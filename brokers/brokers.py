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


class InsurancePartner(osv.osv):
    _name = 'insurance.partner'
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
        'street': fields.char('Dirección', size=64)
    }

    _defaults = {
        'sexo': 'm',
        'tipo_identificador': 'cedula'
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
        'state': fields.selection([('draft', 'Borrador'),
                                   ('request', 'Solicitado'),
                                   ('ok', 'Aprobado')],
                                   string='Estado',
                                   required=True)
    }

    def get_contractor(self, cr, uid, context=None):
        data = self.pool.get('res.users').read(cr, uid, uid, ['contractor_id'])
        return data['contractor_id']

    _defaults = {
        'state': 'draft',
        'name': '/',
        'contractor_id': get_contractor,
        'date': time.strftime('%Y-%m-%d')
    }
