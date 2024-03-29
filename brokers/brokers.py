# -*- coding: utf-8 -*-

import time
from datetime import date
from datetime import datetime
from dateutil.relativedelta import relativedelta

from openerp.osv import fields, osv, orm
import openerp.addons.decimal_precision as dp

DP = dp.get_precision('Brokers')


class ResUser(orm.Model):

    _inherit = 'res.users'

    _columns = {
        'contractor_id': fields.many2one(
            'res.partner',
            string='Canal de Distribución'
        )
    }


class InsuranceParentesco(orm.Model):
    _name = 'insurance.parentesco'
    _description = 'Parentezco de Deudores'
    _columns = {
        'name': fields.char('Parentesco', size=32, required=True),
        'conyugue': fields.boolean('Conyugue ?')
    }


class InsurancePartnerCivil(orm.Model):

    _name = 'insurance.partner.civil'

    _columns = {
        'code': fields.char('Código', size=8, required=True),
        'name': fields.char('Nombre', size=16, required=True),
        'married': fields.boolean('Casado ?')
        }


class InsurancePartner(orm.Model):
    _name = 'insurance.partner'
    _description = 'Deudores'
    _order = 'last_name ASC, name ASC'

    def create(self, cr, uid, vals, context=None):
        obj_id = super(InsurancePartner, self).create(cr, uid, vals, context)
        if vals.get('parent_id'):
            upd = "UPDATE insurance_partner SET parent_id=%s WHERE id=%s"% (obj_id, vals.get('parent_id'))
            cr.execute(upd)
        return obj_id

    def name_get(self, cr, uid, ids, context=None):
        res = []
        for r in self.read(cr, uid, ids, ['name','last_name', 'identificador', 'age_int'], context):
            name = u'%s - %s %s (%d años)' % (r['identificador'], r['name'], r['last_name'], r['age_int'])
            res.append((r['id'], name))
        return res

    def compute_age(self, birth):
        """
        Calculo de Edad
        @birth: fecha de nacimiento %Y-%m-%d
        """
        res = False
        year, month, day = [int(x) for x in birth.split("-")]
        born = date(year, month, day)
        today = date.today()
        #Days
        if born.day > today.day:
            days = today.day + 30 - born.day
            born = born.replace(month=born.month + 1)
        else:
            days = today.day - born.day
        #Month
        if born.month > today.month:
            mes = today.month + 12 - born.month
            born = born.replace(year=born.year + 1)
        else:
            mes = today.month - born.month
        #Years
        years = today.year - born.year
        age = "{0} años {1} meses {2} días".format(years, mes, days)
        return age

    def _compute_age(self, cr, uid, ids, name, args, context=None):
        res = {}
        for obj in self.browse(cr, uid, ids, context):
            res[obj.id] = {
                'age': '',
                'age_int': 0
            }
            age = self.compute_age(obj.birth_date)
            res[obj.id]['age'] = age
            res[obj.id]['age_int'] = int(age.split(' ')[0])
        return res

    _columns = {
        'name': fields.char(
            'Nombres',
            size=128,
            required=True,
            select=True
        ),
        'last_name': fields.char(
            'Apellidos', size=128,
            required=True, select=True
        ),
        'tipo_identificador': fields.selection(
            [('cedula', 'CEDULA'),
             ('passport', 'PASAPORTE'),
            ('ruc', 'RUC')],
            string='Identificador',
            required=True
        ),
        'identificador': fields.char(
            'Identificador',
            required=True,
            select=True
        ),
        'birth_date': fields.date('Fecha de Nacimiento', required=True),
        'age': fields.function(
            _compute_age,
            string='Edad',
            type='char',
            multi='age',
            store={'insurance.partner': (lambda self, cr, uid, ids, c={}: ids, ['birth_date'], 20)}
        ),
        'age_int': fields.function(
            _compute_age,
            string='Edad (Años)',
            type='integer',
            multi='age',
            store={'insurance.partner': (lambda self, cr, uid, ids, c={}: ids, ['birth_date'], 20)}
        ),
        'sexo': fields.selection(
            [('m', 'MASCULINO'),
             ('f', 'FEMENINO')],
             string='Sexo',
             required=True
        ),
        'civil_id': fields.many2one(
            'insurance.partner.civil',
            string='Estado Civil'
        ),
        'casado': fields.boolean('Casado'),
        'mobile': fields.char('Celular', size=16, required=True),
        'phone': fields.char('Teléfono Casa', size=16, required=True),
        'phone2': fields.char('Teléfono Oficina', size=16, required=True),
        'email': fields.char('E-mail', size=32, required=True),
        'street': fields.char('Calle Principal', size=64),
        'street2': fields.char('Calle Secundaria', size=64),
        'street_number': fields.char('Nro Domicilio',size=16),
        'parentesco_id': fields.many2one(
            'insurance.parentesco',
            string="Parentesco"
        ),
        'parent_id': fields.many2one(
            'insurance.partner',
            string='Conyugue'
        ),
        'bank_ids': fields.one2many('insurance.partner.account', 'partner_id', 'Cuentas de Banco')
    }

    _defaults = {
        'sexo': 'm',
        'tipo_identificador': 'cedula'
    }

    def _check_cedula(self, identificador):
        if len(identificador) == 13 and not identificador[10:13] == '001':
            return False
        elif len(identificador) < 10:
            return False
        coef = [2,1,2,1,2,1,2,1,2]
        cedula = identificador[:9]
        suma = 0
        for c in cedula:
            val = int(c) * coef.pop()
            suma += val > 9 and val-9 or val
        result = 10 - ((suma % 10)!=0 and suma%10 or 10)
        if result == int(identificador[9:10]):
            return True
        else:
            return False

    def _check_ruc(self, partner):
        ruc = partner.identificador
        coef = []
        verificador = False
        if not len(ruc) == 13:
            return False
        if ruc[2:3] == '9':
            coef = [4,3,2,7,6,5,4,3,2,0]
            coef.reverse()
            verificador = int(ruc[9:10])
        elif ruc[2:3] == '6':
            coef = [3,2,7,6,5,4,3,2,0,0]
            coef.reverse()
            verificador = int(ruc[8:9])
        suma = sum([int(i)*c for i,c in zip(ruc[:10], coef)])
        result = 11 - (suma>0 and suma % 11 or 11)
        if result == verificador:
            return True
        else:
            return False

    def _check_identificador(self, cr, uid, ids):
        for partner in self.browse(cr, uid, ids):
            if partner.tipo_identificador == 'pasaporte':
                return True
            elif partner.tipo_identificador == 'ruc':
                return self._check_ruc(partner)
            else:
                return self._check_cedula(partner.identificador)
        return True

    _constraints = [
        (_check_identificador, 'Error en su Cedula/RUC/Pasaporte', ['identificador'])
    ]

    _sql_constraints = [
        ('unique_identificador',
         'unique(tipo_identificador,identificador)',
        u'El identificador es único.')
    ]

    def onchange_civil(self, cr, uid, ids, civil_id):
        res = {'value': {'casado': False}}
        if not civil_id:
            return {}
        data = self.pool.get('insurance.partner.civil').read(cr, uid, [civil_id], ['married'])
        res['value']['casado'] = data[0]['married']        
        return res

    def is_married(self, cr, uid, deudor_id):
        deudor = self.browse(cr, uid, deudor_id)
        return deudor.civil_id.married

    def get_conyugue(self, cr, uid, deudor_id):
        deudor = self.browse(cr, uid, deudor_id)
        return deudor.parent_id and deudor.parent_id or False

    def name_search(self, cr, uid, name, args=None, operator='ilike', context=None, limit=100):
        domain = ['|',('name',operator,name),'|',('last_name',operator,name),('identificador',operator,name)]
        ids = self.search(cr, uid, args + domain, limit=limit, context=context)
        return self.name_get(cr, uid, ids, context)


class InsurancePolicy(orm.Model):
    _name = 'insurance.policy'

    def name_get(self, cr, uid, ids, context=None):
        res = []
        for r in self.read(cr, uid, ids, ['name','aseguradora_id'], context):
            name = "{0} - {1}".format(r['name'], r['aseguradora_id'][1])
            res.append((r['id'], name))
        return res

    _columns = {
        'name': fields.char('Código', size=32 ,required=True),
        'partner_id': fields.many2one(
            'res.partner',
            string='Cliente Asegurado',
            required=True
        ),
        'aseguradora_id': fields.many2one(
            'res.partner',
            string='Aseguradora',
            required=True
        )
    }


class InsuranceParameter(orm.Model):
    """
    Parametros de configuracion para decidir que poliza
    utilizar.
    """

    def onchange_policy(self, cr, uid, ids, policy_id):
        if not policy_id:
            return {}
        data = self.pool.get('insurance.policy').read(cr, uid, policy_id, ['aseguradora_id','partner_id'])
        return {
            'value': {
                'aseguradora_id': data['aseguradora_id'],
                'partner_id': data['partner_id']
            }
        }

    _name = 'insurance.parameter'
    _columns = {
        'policy_id': fields.many2one(
            'insurance.policy',
            string='Póliza',
            required=True,
            select=True
        ),
        'aseguradora_id': fields.related(
            'policy_id',
            'aseguradora_id',
            relation='res.partner',
            string='Aseguradora',
            select=True,
            type='many2one',
            store=True,
            readonly=True
        ),
        'partner_id': fields.related(
            'policy_id',
            'partner_id',
            relation='res.partner',
            string='Cliente',
            select=True,
            type='many2one',
            store=True,
            readonly=True
        ),
        'amount_min': fields.float('Monto Mín', digits_compute=DP),
        'amount_max1': fields.float('Monto Max 1', digits_compute=DP),
        'amount_max2': fields.float('Monto Max 2', digits_compute=DP),
        'age_min': fields.integer('Edad Mín'),
        'age_max': fields.integer('Edad Máx'),
        'age_max2': fields.integer('Edad Máxima 2'),
        'age_min_codeudor': fields.integer('Edad Mín Codeudor'),
        'age_max_codeudor': fields.integer('Edad Máx Codeudor'),
        'certificate': fields.boolean('Emite Certificado ?'),
    }

    _sql_constraints = [
        ('amount_max2_min' ,'CHECK (amount_max2 > 0)' ,u'El monto máx 2. debe ser positivo !.'),
        ('age_min_max', 'CHECK (age_max > age_min)', u'Edad máx debe ser mayor !".'),
        ('age_min_max2', 'CHECK (age_max2 > age_min)', u'Edad máx 2 debe ser mayor !.'),
        ('age_codeudor', 'CHECK (age_max_codeudor > age_min_codeudor)', u'Edades de codeudor incorrectas !'),
        ('not_zero_values', 'CHECK (amount_min*amount_max1*amount_max2 > 0)', u'Los valores deben ser positivos !'),
        ('unique_policy', 'unique(policy_id)', u'Los parámetros son únicos por póliza.')
    ]

    def validate(self, cr, uid, credit, deudor, partner_id):
        """
        """
        msg1 = u'Las personas que tengan %s años 1 día, no tendrán cobertura'
        msg2 = u'El monto asegurado máximo por persona para los socios que tengan desde %s años 1 día hasta el día que cumpla %s años será de hasta $%s'
        msg3 = u'Desde el Día que cumpla %s años de edad hasta el día que cumpla %s años de edad, al momento de contratar el crédito con cobertura hasta %s'
        msg4 = u'Monto asegurado no requiere Declaración de Asegurabilidad'
        ids = self.search(cr, uid, [('partner_id','=',partner_id)])
        if not ids:
            raise osv.except_osv('Error', u'No existen polizas configuradas para este canal.')
        for obj in self.browse(cr, uid, ids):
            edad = deudor.age_int
            if obj.age_min <= edad <= obj.age_max:
                if obj.age_min <= edad <= obj.age_max2:
                    if obj.amount_min <= credit <= obj.amount_max1:
                        return True, 'show_declaration'
                    elif credit < obj.amount_min:
                        if obj.certificate:
                            return True, 'show_certificate'
                        return False, msg4
                    else:
                        return False, msg3 % (obj.age_min, obj.age_max, obj.amount_max1)
                else:
                    if credit < obj.amount_max2:
                        if obj.certificate:
                            return True, 'show_certificate'
                    return False, msg2 % (obj.age_max2, obj.age_max, obj.amount_max2)
            else:
                return False, msg1 % obj.age_max


class InsuranceExam(orm.Model):
    _name = 'insurance.exams'
    _columns = {
        'name': fields.char('Examen', size=128, required=True),
        'print': fields.boolean('Imprimir ?'),
    }


class InsurancePartnerAccount(orm.Model):
    _name = 'insurance.partner.account'

    def name_get(self, cr, uid, ids, context=None):
        TIPO = {
            'ahorros': 'Cta. Ahorros',
            'corriente': 'Cta. Corriente'
        }
        res = []
        for rec in self.read(cr, uid, ids, ['name', 'tipo']):
            texto = '%s - %s' % (rec['name'], TIPO[rec['tipo']])
            res.append((rec['id'], texto))
        return res
        
    _columns = {
        'name': fields.char('Número', size=32, required=True),
        'tipo': fields.selection(
            [('ahorros', 'Cta. Ahorros'),
             ('corriente', 'Cta. Corriente')],
             string='Tipo de Cuenta',
             required=True
        ),
        'partner_id': fields.many2one(
            'insurance.partner',
            string='Deudor'
        )
    }

    _defaults = {
        'tipo': 'ahorros'
    }


class InsuranceParameterValue(orm.Model):
    """
    Parametros de configuracion para decidir segun la edad
    el monto limite de seguro a entregar
    """
    _name = 'insurance.parameter.value'
    _order = 'amount_min ASC, age_min ASC'
    _columns = {
        'amount_min': fields.float('Monto Mínimo', digits_compute=DP),
        'amount_max': fields.float('Monto Máximo', digits_compute=DP),
        'age_min': fields.integer('Edad Mínima'),
        'age_max': fields.integer('Edad Máxima'),
        'exams': fields.many2many('insurance.exams', string='Examenes'),
        'policy_id': fields.many2one(
            'insurance.policy',
            string='Póliza',
            required=True
        )
    }

    _sql_constraints = [
        ('amount_max_min' ,'CHECK (amount_max > amount_min)' ,u'El monto máx. debe ser mayor !.'),
        ('age_max_min' ,'CHECK (age_max > age_min)' ,u'La edad máx. debe ser mayor !.'),
    ]

    def get_exams(self, cr, uid, value_requested, age, policy_id):
        """
        Consulta de examenes segun monto y edad
        """
        flag = False
        edad = int(age.split(' ')[0])
        cr.execute("SELECT min(amount_min) as minimo FROM insurance_parameter_value WHERE policy_id=%s;" % policy_id)
        res = cr.fetchone()
        if value_requested < res[0]:
            return False, False
        ids = self.search(
            cr, uid,
            [('amount_min','<=', value_requested),
             ('amount_max','>=', value_requested),
             ('age_min','<=', edad),
             ('age_max','>=', edad),
             ('policy_id','=',policy_id)
            ]
        )
        if not ids:
            raise osv.except_osv('Error', u'No aplica a ningun caso de la configuración de exámenes.')
        data = self.read(cr, uid, ids, ['exams'])
        for ex in self.pool.get('insurance.exams').read(cr, uid, data[0]['exams'], ['print']):
            if ex['print']:
                flag = True
        return data[0]['exams'], flag


class InsuranceInsurance(orm.Model):
    _name = 'insurance.insurance'
    _inherit = ['mail.thread']
    _description = 'Seguros de Desgravamen'
    STATES = {'draft': [('readonly', False)]}

    EMAIL_TEMPLATES = {
        '1': 'edi_insurance_confirm_da_canal',
        '2': 'edi_insurance_cuestionarios_extras_canal',
        '3': 'edi_insurance_dc_canal',
        '4': 'edi_insurance_confirm_da_canal',
        '5': 'edi_insurance_error_da_canal',
        '6': 'edi_insurance_extraprimar_da_canal',
        '7': 'edi_insurance_extraprima_aseguradora',
    }

    def onchange_deudor(self, cr, uid, ids, deudor_id):
        part_obj = self.pool.get('insurance.partner')
        res = {}
        if not deudor_id:
            return res
        married = part_obj.is_married(cr, uid, deudor_id)
        conyugue = part_obj.get_conyugue(cr, uid, deudor_id)
        return {
            'value': {
                'has_codeudor': married,
                'total_active_credits': 0,
                'credits_codeudor': 0,
                'monto_credito_solicitado': 0,
                'codeudor_id': conyugue and conyugue.id or False,
                'show_questions': False,
                'show_questions2': False
            }
        }

    def onchange_has_credit(self, cr, uid, ids, has_active_credit):
        if not has_active_credit:
            return {'value': {'total_active_credits': 0, 'credits_codeudor': 0}}
        return {}

    def onchange_credit(self, cr, uid, ids, current, requested, codeudor):
        return {
            'value': {'total_credits': codeudor + self.sumar(current, requested) }
        }

    def onchange_total(self, cr, uid, ids, total, contractor_id, has_codeudor):
        if total == 0:
            return {}
        result = {'value': {'show_questions': False, 'show_question2': False}}
        params_obj = self.pool.get('insurance.parameter')
        res = params_obj.search(cr, uid, [('partner_id','=',contractor_id),('amount_min','<=',total)], limit=1)
        if res and res[0]:
            result['value']['show_questions'] = True
            if has_codeudor:
                result['value']['show_questions2'] = True
        return result

    def sumar(self, val1, val2):
        return val1 + val2

    def _compute_total(self, cr, uid, ids, args, fields, context=None):
        res = {}
        for obj in self.browse(cr, uid, ids):
            res[obj.id] = {'total_credits': 0, 'total_pago': 0}
            res[obj.id]['total_credits'] = obj.total_active_credits + obj.credits_codeudor + obj.monto_credito_solicitado
        return res

    """
    TODO:
    revisar: solicitud llenada por
    """
    _columns = {
        'name': fields.char('Código', size=32, required=True),
        'contractor_id': fields.many2one(
            'res.partner',
            string='Contratante',
            required=True,
            readonly=True,
            states=STATES
        ),
        'deudor_id': fields.many2one(
            'insurance.partner',
            string='Deudor',
            required=True,
            readonly=True,
            states=STATES
        ),
        'account_number_id': fields.many2one(
            'insurance.partner.account',
            string='Cuenta Bancaria'
        ),
        'codeudor_id': fields.many2one(
            'insurance.partner',
            string='Codeudor',
            readonly=True,
            states=STATES
        ),
        'has_active_credit': fields.boolean('El deudor/codeudor tiene créditos vigentes en la institución?'),
        'has_codeudor': fields.boolean('Tiene Codeudor'),
        'city_id': fields.many2one(
            'res.country.state.city',
            string='Cuidad de Trámite',
            required=True,
            readonly=True,
            states=STATES
        ),
        'date': fields.date('Fecha de Solicitud de Crédito', readonly=True),
        'date_ok': fields.date('Fecha Aprobacion', readonly=True),
        'date_due': fields.date('Fecha Vencimiento', readonly=True),
        'account_number': fields.char(
            'Número de Cuenta',
            size=32,
            required=True,
            readonly=True,
            states=STATES
        ),
        'nro_operacion_credito': fields.char(
            'Nro Operación Crédito',
            size=32,
            required=True,
            readonly=True,
            states=STATES
        ),
        'total_active_credits': fields.float(
            'Créditos Vigentes Deudor',
            digits_compute=DP,
            readonly=True,
            states=STATES
        ),
        'credits_codeudor': fields.float(
            'Créditos Vigentes Codeudor',
            digits_compute=DP,
            readonly=True,
            states=STATES
        ),
        'monto_credito_solicitado': fields.float(
            'Monto Crédito Solicitado',
            digits_compute=DP,
            readonly=True,
            states=STATES
        ),
        'total_credits': fields.function(
            _compute_total,
            string='Total Créditos',
            digits_compute=DP,
            store={
                'insurance.insurance': (
                    lambda self, cr, uid, ids, c={}: ids,
                    ['monto_credito_solicitado',
                     'total_active_credits',
                     'credits_codeudor'],
                20),
            },
            multi='tipo'
        ),
        'total_pago': fields.function(
            _compute_total,
            string='Total Pago',
            digits_compute=DP,
            readonly=True,
            store={
                'insurance.insurance': (
                    lambda self, cr, uid, ids, c={}: ids,
                    ['monto_credito_solicitado',
                     'total_active_credits',
                     'credits_codeudor'],
                20),
            },
            multi='tipo'
        ),
        'plazo': fields.integer(
            'Plazo (meses)',
            readonly=True,
            states=STATES
        ),
        'aseguradora_id': fields.many2one(
            'res.partner',
            string='Aseguradora',
            readonly=True,
            states=STATES
        ),
        'state': fields.selection(
            [('draft', 'Borrador'),
             ('request', 'Solicitado'),
             ('revision','En Revision'),
             ('aprobado', 'Aprobado'),
             ('negado', 'Negado'),
             ('ok', 'Aprobado')],
            string='Estado',
            readonly=True,
            required=True
        ),
        'type': fields.selection(
            [('desgravamen', 'Seguro Desgravamen'),
             ('exequial', 'Seguro Exequial')],
             string='Tipo',
             required=True
        ),
        'show_questions': fields.boolean(
            'Mostrar Preguntas',
            readonly=True,
            states=STATES
        ),
        'show_questions2': fields.boolean(
            'Mostrar Preguntas Codeudor',
        ),
        'question1': fields.selection(
            [('si','SI'),('no','NO')],
            string='Respuesta',
            readonly=True,
            states=STATES
        ),
        'answer1': fields.text(
            'Respuesta',
            readonly=True,
            states=STATES
        ),
        'question2': fields.selection(
            [('si','SI'),('no','NO')],
            string='Respuesta 2',
            readonly=True,
            states=STATES
        ),
        'answer2': fields.text(
            'Respuesta',
            readonly=True,
            states=STATES
        ),

        'question3': fields.selection(
            [('si','SI'),('no','NO')],
            string='Respuesta',
            readonly=True,
            states=STATES
        ),
        'answer3': fields.text(
            'Respuesta',
            readonly=True,
            states=STATES
        ),
        'question4': fields.selection(
            [('si','SI'),('no','NO')],
            string='Respuesta 2',
            readonly=True,
            states=STATES
        ),
        'answer4': fields.text(
            'Respuesta',
            readonly=True,
            states=STATES
        ),
        'print_certificate': fields.boolean(
            'Imprime Certificado ?',
            readonly=True,
            states=STATES
        ),
        'print_declaration': fields.boolean(
            'Imprime Declaración ?',
            readonly=True,
            states=STATES
        ),
        'tiene_apoderado': fields.boolean(
            'Tiene Apoderado',
            readonly=True,
            states=STATES
        ),
        'apoderado_id': fields.many2one(
            'insurance.partner',
            string='Apoderado',
            readonly=True,
            states=STATES
        ),
        'user_id': fields.many2one(
            'res.users',
            required=True,
            string='Usuario'
        ),
        'exams': fields.many2many(
            'insurance.exams',
            string='Examenes',
            readonly=True
        ),
        'exams_codeudor': fields.many2many(
            'insurance.exams',
            string='Examenes Codeudor',
            readonly=True
        ),
        'policy_id': fields.many2one(
            'insurance.policy',
            string='Poliza en Uso',
            required=True,
            readonly=True,
            states=STATES
        ),
        # Campos extras para seguro exequial
    }

    def _get_contractor(self, cr, uid, context=None):
        data = self.pool.get('res.users').read(cr, uid, uid, ['contractor_id'])
        return data['contractor_id'] and data['contractor_id'][0]

    def _get_policy(self, cr, uid, context=None):
        param_obj = self.pool.get('insurance.parameter')
        contractor_id = self._get_contractor(cr, uid, context=context)
        res = param_obj.search(
            cr, uid,
            [('partner_id','=',contractor_id)],
            limit=1
        )
        if not res:
            raise osv.except_osv('Alerta', 'No tiene una poliza asignada.')
        data = param_obj.read(cr, uid, res, ['policy_id'])
        return data[0]['policy_id'][0]

    def _get_user(self, cr, uid, context=None):
        return uid

    def _get_type(self, cr, uid, context=None):
        return context.get('seguro_type', 'desgravamen')

    _defaults = {
        'state': 'draft',
        'name': '/',
        'contractor_id': _get_contractor,
        'date': time.strftime('%Y-%m-%d'),
        'user_id': _get_user,
        'answer1': '\n\n\n\n\n\n',
        'answer2': '\n\n\n\n\n\n',
        'answer3': '\n\n\n\n\n\n',
        'answer4': '\n\n\n\n\n\n',
        'type': _get_type
    }

    def _check_conyugue(self, cr, uid, ids):
        for obj in self.browse(cr, uid, ids):
            if not obj.deudor_id.civil_id.married:
                return True
            for parent in obj.deudor_id.child_ids:
                if parent.parentesco_id.conyugue:
                    return True
        return False

    _sql_constraints = [
        ('plazo_not_zero' ,'CHECK (plazo > 0)' ,'El plazo debe ser positivo !.'),
        ('monto_not_zero', 'CHECK (monto_credito_solicitado > 0)', 'Debe solicitar un monto mayor a cero !')
    ]

    _constraints = [
        (_check_conyugue, 'Requiere los datos del Codeudor (conyugue)', ['Familiares'])
    ]

    def _check_values(self, cr, uid, ids, context=None):
        param_obj = self.pool.get('insurance.parameter')
        part_obj = self.pool.get('insurance.partner')
        for obj in self.browse(cr, uid, ids, context):
            codeudor = obj.codeudor_id
            res, msg = param_obj.validate(
                cr, uid,
                obj.total_credits,
                obj.deudor_id,
                obj.contractor_id.id,
            )
            if not res:
                raise osv.except_osv('Alerta', msg)
        return True, msg

    def _get_exams(self, cr, uid, ids, context=None):
        """
        Metodo de validacion por monto para identificar
        que examenes debe realizarse el deudor.
        """
        exam_obj = self.pool.get('insurance.parameter.value')
        for obj in self.browse(cr, uid, ids, context):
            exams = exam_obj.get_exams(cr, uid, obj.total_credits, obj.deudor_id.age, obj.policy_id.id)
        return exams

    def _get_coexams(self, cr, uid, ids, context=None):
        """
        Metodo de validacion por monto para identificar
        que examenes debe realizarse el deudor.
        """
        exam_obj = self.pool.get('insurance.parameter.value')
        for obj in self.browse(cr, uid, ids, context):
            exams = exam_obj.get_exams(cr, uid, obj.total_credits, obj.codeudor_id.age, obj.policy_id.id)
        return exams

    def action_draft(self, cr, uid, ids, context=None):
        for obj in self.browse(cr, uid, ids, context):
            exams = [e.id for e in obj.exams]
            coexams = [e.id for e in obj.exams_codeudor]
            data = {
                'state': 'draft',
                'print_certificate': False,
                'print_declaration': False,
                'question1': '',
                'question2': '',
                'question3': '',
                'question4': '',
            }
            if exams:
                data.update({'exams': [(5,)]})
            if coexams:
                data.update({'exams_codeudor': [(5,)]})
        self.write(cr, uid, ids, data)

    def get_number(self, cr, uid, ids, context=None):
        seq_obj = self.pool.get('ir.sequence')
        param_obj = self.pool.get('insurance.parameter')
        for obj in self.browse(cr, uid, ids, context):
            number = seq_obj.get(cr, uid, 'insurance.insurance', context=context)
            pre, suf = number.split('/')
            res = param_obj.search(cr, uid, [('partner_id','=',obj.contractor_id.id)], limit=1)
            if not res:
                raise osv.except_osv('Error', 'No se ha encontrado una póliza para este canal.')
            param = param_obj.browse(cr, uid, res[0])
            policy = param.policy_id.name
            name = '/'.join([pre, policy, suf])
            return name

    def get_template(self, cr, uid, template_ref):
        ir_model_data = self.pool.get('ir.model.data')        
        self.pool.get('email.template')
        tmpl = self.EMAIL_TEMPLATES[template_ref]
        try:
            template_id = ir_model_data.get_object_reference(cr, uid, 'brokers', tmpl)
        except ValueError:
            template_id = False
        return template_id

    def send_mail(self, cr, uid, obj, msg, exams):
        """
        obj: instance of this object
        msg: message response from _check_values
        exams: list: [exams_dedudor, exams_codeudor]
        """
        mail_obj = self.pool.get('email.template')
        if msg == 'show_declaration' and len(exams[0]) == 1:
            mail_obj.send_mail(cr, uid, self.get_template(cr, uid, '1'), obj.id)
        return True
            

    def action_validate(self, cr, uid, ids, context=None):
        """
        Valida datos segun tablas de configuracion
        Tabla 1: insurance.parameter
        Tabla 2: insurance.parameter.value
        """
        state = 'request'
        data = {'state': state}
        coexams = False
        param_obj = self.pool.get('insurance.parameter')
        for obj in self.browse(cr, uid, ids, context):
            flag, msg = self._check_values(cr, uid, [obj.id], context)
            if msg == 'show_certificate':
                data['print_certificate'] = True
            elif msg == 'show_declaration':
                data['print_declaration'] = True
            exams, flag_exam = self._get_exams(cr, uid, [obj.id], context)
            if exams:
                data.update({'exams': [(6,0,exams)]})            
            if obj.codeudor_id:
                coexams, flag_coexams = self._get_coexams(cr, uid, [obj.id], context)
                if coexams:
                    data.update({'exams_codeudor': [(6,0,coexams)]})                
            if obj.show_questions:
                data.update({'print_declaration': True})
                if obj.question1 == 'no' and obj.question2 == 'no' and flag_exam:
                    data.update({'print_certificate': True})
            #Fechas
            y, m, d = obj.date.split('-')
            d = datetime(year=int(y), month=int(m), day=int(d)) + relativedelta(months=obj.plazo)
            date_due = d.strftime('%Y-%m-%d')
            data.update({'date_due': date_due, 'date_ok': obj.date})
            # numero de documento
            if not obj.name != '/':
                name = self.get_number(cr, uid, ids, context)
                data.update({'name': name})
            self.write(cr, uid, ids, data)
            self.send_mail(cr, uid, obj, msg, [exams, coexams])
        return True

    def action_ok(self, cr, uid, ids, context=None):
        """
        """
        for obj in self.browse(cr, uid, ids, context):
            date_ok = time.strftime('%Y-%m-%d')
            y, m, d = date_ok.split('-')
            d = datetime(year=int(y), month=int(m), day=int(d)) + relativedelta(months=obj.plazo)
            date_due = d.strftime('%Y-%m-%d')
            self.write(cr, uid, ids, {'state': 'ok', 'date_ok': date_ok, 'date_due': date_due})
        return True

    def action_print_declaracion(self, cr, uid, ids, context=None):
        """
        Impresion de declaracion de asegurabilidad
        """
        if not context:
            context = {}
        report_name = 'declaracion_report'
        obj = self.browse(cr, uid, ids, context)[0]
        if obj.has_codeudor:
            report_name = 'declaracion_deudor_codeudor_report'
        datas = {'ids': [obj.id], 'model': 'insurance.insurance'}
        return {
            'type': 'ir.actions.report.xml',
            'report_name': report_name,
            'model': 'insurance.insurance',
            'datas': datas,
            'nodestroy': True,
        }

    def action_print_certificate(self, cr, uid, ids, context=None):
        """
        Impresion de certificado de asegurabilidad
        """
        if not context:
            context = {}
        report_name = 'certificado_deudor_report'
        obj = self.browse(cr, uid, ids, context)[0]
        if obj.has_codeudor:
            report_name = 'certificado_report'
        datas = {'ids': [obj.id], 'model': 'insurance.insurance'}
        return {
            'type': 'ir.actions.report.xml',
            'report_name': report_name,
            'model': 'insurance.insurance',
            'datas': datas,
            'nodestroy': True,
        }

    def action_send_email(self, cr, uid, ids, context=None):
        assert len(ids) == 1, 'Esta opcion es solo para un registro'
        ir_model_data = self.pool.get('ir.model.data')
        ins_obj = self.browse(cr, uid, ids, context)[0]
        #DECIDIR QUE TMPL USAR
        tmpl2send = self.MAIL_TEMPLATES['1']
        partners = [(6,0,[ins_obj.contractor_id.id])]
        try:
            template_id = ir_model_data.get_object_reference(cr, uid, 'brokers', tmpl2send)[1]
        except ValueError:
            template_id = False
        try:
            compose_form_id = ir_model_data.get_object_reference(cr, uid, 'mail', 'email_compose_message_wizard_form')[1]
        except ValueError:
            compose_form_id = False
        ctx = dict(context)        
        ctx.update({
            'default_model': 'insurance.insurance',
            'default_res_id': ids[0],
            'default_use_template': bool(template_id),
            'default_template_id': template_id,
            'default_composition_mode': 'comment',
            'default_partner_ids': partners,
            'examenes_deudor': ','.join([ex.name for ex in ins_obj.exams]),
            'examenes_codeudor': ','.join([ex.name for ex in ins_obj.exams_codeudor]),
            })
        return {
            'type': 'ir.actions.act_window',
            'view_type': 'form',
            'view_mode': 'form',
            'res_model': 'mail.compose.message',
            'views': [(compose_form_id, 'form')],
            'view_id': compose_form_id,
            'target': 'new',
            'context': ctx,
        }        
