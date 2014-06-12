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
        'partner_id': fields.many2one(
            'res.partner',
            string='Cliente',
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

    _defaults = {
        'state': 'draft',
        'name': '/'
    }
