# -*- coding: utf-8 -*-

import time
from datetime import date

from osv import osv, fields
import openerp.addons.decimal_precision as dp

DP = dp.get_precision('Brokers')


class ResUser(osv.osv):

    _inherit = 'res.users'

    _columns = {
        'contractor_id': fields.many2one(
            'res.partner',
            string='Canal de Distribución'
        )
    }


class InsuranceParentesco(osv.osv):
    _name = 'insurance.parentesco'
    _description = 'Parentezco de Deudores'
    _columns = {
        'name': fields.char('Parentesco', size=32, required=True),
    }


class InsurancePartner(osv.osv):
    _name = 'insurance.partner'
    _description = 'Deudores'    

    def name_get(self, cr, uid, ids, context=None):
        res = []
        for r in self.read(cr, uid, ids, ['name','last_name', 'identificador'], context):
            name = '%s - %s %s' % (r['identificador'], r['name'], r['last_name'])
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
            age = self.compute_age(obj.birth_date)
            res[obj.id] = age
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
        'age': fields.function(_compute_age, string='Edad', type='char'),
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
        'mobile': fields.char('Celular', size=16, required=True),
        'phone': fields.char('Teléfono', size=16, required=True),
        'email': fields.char('E-mail', size=32, required=True),
        'street': fields.char('Dirección', size=64),
        'parentesco_id': fields.many2one(
            'insurance.parentesco',
            string="Parentesco"
        ),
        'parent_id': fields.many2one(
            'insurance.partner',
            string='Partner'
        ),
        'child_ids': fields.one2many(
            'insurance.partner',
            'parent_id',
            string='Partner Padre'
        )
    }

    _defaults = {
        'sexo': 'm',
        'tipo_identificador': 'cedula'
    }


class InsurancePolicy(osv.osv):
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
        )
    }


class InsuranceParameter(osv.osv):
    """
    Parametros de configuracion para decidir que poliza
    utilizar.
    """

    def onchange_policy(self, cr, uid, ids, policy_id):
        if not policy_id:
            return {}
        data = self.pool.get('insurance.policy').read(cr, uid, policy_id, ['aseguradora_id'])
        return {
            'value': {'partner_id': data['aseguradora_id']}
        }
        
    _name = 'insurance.parameter'
    _columns = {
        'policy_id': fields.many2one(
            'insurance.policy',
            string='Póliza',
            required=True,
            select=True
        ),
        'partner_id': fields.related(
            'policy_id',
            'aseguradora_id',
            relation='res.partner',
            string='Aseguradora',
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
    }

    _sql_constraints = [
        ('amount_max1_min' ,'CHECK (amount_max1 > amount_min)' ,u'El monto máx. debe ser mayor !.'),
        ('amount_max2_min' ,'CHECK (amount_max2 > 0)' ,u'El monto máx 2. debe ser positivo !.'),
        ('age_min_max', 'CHECK (age_max > age_min)', u'Edad máx debe ser mayor !".'),
        ('age_min_max2', 'CHECK (age_max2 > age_min)', u'Edad máx 2 debe ser mayor !.'),
        ('age_codeudor', 'CHECK (age_max_codeudor > age_min_codeudor)', u'Edades de codeudor incorrectas !'),
        ('not_zero_values', 'CHECK (amount_min*amount_max1*amount_max2 > 0)', u'Los valores deben ser positivos !')
    ]    


class InsuranceExam(osv.osv):
    _name = 'insurance.exams'
    _columns = {
        'name': fields.char('Examen', size=128, required=True)
    }


class InsuranceParameterValue(osv.osv):
    """
    Parametros de configuracion para decidir segun la edad
    el monto limite de seguro a entregar
    """
    _name = 'insurance.parameter.value'
    _columns = {
        'amount_min': fields.float('Monto Mínimo', digits_compute=DP),
        'amount_max': fields.float('Monto Máximo', digits_compute=DP),
        'age_min': fields.integer('Edad Mínima'),
        'age_max': fields.integer('Edad Máxima'),
        'exams': fields.many2many('insurance.exams', string='Examenes')
    }

    _sql_constraints = [
        ('amount_max_min' ,'CHECK (amount_max > amount_min)' ,u'El monto máx. debe ser mayor !.'),
        ('age_max_min' ,'CHECK (age_max > age_min)' ,u'La edad máx. debe ser mayor !.'),        
    ]
    

class InsurancePartnerCivil(osv.osv):

    _name = 'insurance.partner.civil'

    _columns = {
        'code': fields.char('Código', size=8, required=True),
        'name': fields.char('Nombre', size=16, required=True)
        }


class InsuranceInsurance(osv.osv):
    _name = 'insurance.insurance'
    _inherit = ['mail.thread']
    _description = 'Seguros de Desgravamen'

    def onchange_credit(self, cr, uid, ids, current, requested):
        return {
            'value': {'total_credits': self.sumar(current, requested) }
            }

    def sumar(self, val1, val2):
        return val1 + val2

    def _compute_total(self, cr, uid, ids, args, fields, context=None):
        res = {}
        for obj in self.browse(cr, uid, ids):
            res[obj.id] = self.sumar(
                obj.total_active_credits,
                obj.monto_credito_solicitado
            )
        return res

    """
    TODO:
    revisar: solicitud llenada por
    """
    _columns = {
        'name': fields.char('Código', size=16, required=True),
        'contractor_id': fields.many2one(
            'res.partner',
            string='Contratante',
            required=True
        ),
        'deudor_id': fields.many2one(
            'insurance.partner',
            string='Deudor',
            required=True
        ),
        'has_active_credit': fields.boolean('El deudor tiene créditos vigentes ?'),
        'total_active_credits': fields.float('Total Créditos Vigentes', digits=(16,2)),
        'city_id': fields.many2one(
            'res.country.state.city',
            string='Cuidad de Trámite',
            required=True
        ),
        'date': fields.date('Fecha de Solicitud de Crédito'),
        'account_number': fields.char('Número de Cuenta', size=32, required=True),
        'nro_operacion_credito': fields.char('Nro Operación Crédito', size=32, required=True),
        'monto_credito_solicitado': fields.float('Monto Crédito Solicitado', digits_compute=DP),
        'total_credits': fields.function(_compute_total, string='Total Créditos', digits_compute=DP),
        'plazo': fields.integer('Plazo (meses)'),
        'aseguradora_id': fields.many2one('res.partner', string='Aseguradora'),
        'state': fields.selection(
            [('draft', 'Borrador'),
            ('request', 'Solicitado'),
            ('ok', 'Aprobado')],
            string='Estado',
            required=True
        ),
        'question1': fields.boolean(
            "Transtornos ?"
        ),
        'answer1': fields.text('Respuesta'),
        'question2': fields.boolean(
            "Q2"
        ),
        'answer2': fields.text('Respuesta'),
        'tiene_apoderado': fields.boolean('Tiene Apoderado'),
        'apoderado_id': fields.many2one(
            'insurance.partner',
            string='Apoderado',
        ),
        'user_id': fields.many2one(
            'res.users',
            required=True,
            string='Usuario'
        )
    }

    def _get_contractor(self, cr, uid, context=None):
        data = self.pool.get('res.users').read(cr, uid, uid, ['contractor_id'])
        return data['contractor_id'] and data['contractor_id'][0]

    def _get_user(self, cr, uid, context=None):
        return uid

    _defaults = {
        'state': 'draft',
        'name': '/',
        'contractor_id': _get_contractor,
        'date': time.strftime('%Y-%m-%d'),
        'user_id': _get_user
    }

    _sql_constraints = [
        ('plazo_not_zero' ,'CHECK (plazo > 0)' ,'El plazo debe ser positivo !.')
    ]

    def _check_values(self, cr, uid, ids, context=None):
        exam_obj = self.pool.get('insurance.parameter')
        for obj in self.browse(cr, uid, ids, context):
            res, msg = exam_obj.validate(cr, uid, obj.monto_credito_solicitado, obj.deudor_id)
            if not res:
                raise osv.except_osv('Alerta', msg)        
        return True

    def _check_exams(self, cr, uid, ids, context=None):
        """
        Metodo de validacion por monto para identificar
        que examenes debe realizarse el deudor.
        """
        return True

    def action_validate(self, cr, uid, ids, context=None):
        """
        Valida datos segun tablas de configuracion
        Tabla 1: insurance.parameter
        Tabla 2: insurance.parameter.value
        """
        self._check_values(cr, uid, ids, context)
        self._check_exams(cr, uid, ids, context)
        self.write(cr, uid, ids, {'state': 'request'})
        return True

    def action_print(self, cr, uid, ids, context=None):
        """

        """
        return True
