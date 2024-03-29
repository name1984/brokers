# -*- coding: utf-8 -*-
##############################################################################
#
#    OpenERP, Open Source Management Solution
#    Copyright (C) 2014 Cristian Salamea.
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
##############################################################################

{
    'name' : 'Gestión de Seguros y Polizas',
    'version' : '0.1.0',
    'author' : 'Cristian Salamea',
    'category': 'General',
    'complexity': 'normal',
    'website': 'www.ayni.io',
    'data': [
        'security/brokers_security.xml',
        'security/ir.model.access.csv',
        'view/brokers_view.xml',
        'view/brokers_menu.xml',
        'report/brokers_report.xml',
        'data/brokers_data.xml',
        'data/sequence_brokers.xml',
        'data/res.country.state.csv',
        'data/res.country.state.city.csv',
        'edi/brokers_templates.xml'
    ],
    'depends' : [
        'decimal_precision',
        'city',
        'edi',
        'web_m2x_options',
        'report_webkit'
    ],
    'js': [
    ],
    'qweb': [
    ],
    'css': [
    ],
    'test': [
    ],
    'installable': True,
    'auto_install': False,                
}
