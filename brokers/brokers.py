# -*- coding: utf-8 -*-

import time

from osv import osv, fields


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

    _name = 'insurance.parameter'
    _columns = {
        'partner_id': fields.many2one(
            'res.partner',
            string='Aseguradora',
            required=True,
            select=True
        ),
        'policy_id': fields.many2one(
            'insurance.policy',
            string='Póliza',
            required=True,
            select=True
        ),
        'amount_min': fields.float('Monto Mínimo', digits=(16,2)),
        'amount_max1': fields.float('Monto Maximo 1', digits=(16,2)),
        'amount_max2': fields.float('Monto Maximo 2', digits=(16,2))
    }


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

    """
    TODO:
    campos: total_active_credits, total_credits cambiar a funcion
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
        'monto_credito_solicitado': fields.float('Monto Crédito Solicitado', digits=(16,2)),
        'total_credits': fields.float('Total Créditos', digits=(16,2)),
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
        )
    }

    def get_contractor(self, cr, uid, context=None):
        data = self.pool.get('res.users').read(cr, uid, uid, ['contractor_id'])
        return data['contractor_id'] and data['contractor_id'][0]

    def action_validate(self, cr, uid, ids, context=None):
        """
        
        """
        self.write(cr, uid, ids, {'state': 'request'})
        return True

    def action_print(self, cr, uid, ids, context=None):
        """

        """
        return True

    _defaults = {
        'state': 'draft',
        'name': '/',
        'contractor_id': get_contractor,
        'date': time.strftime('%Y-%m-%d')
    }
