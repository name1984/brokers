# -*- coding: utf-8 -*-

from openerp.tests.common import TransactionCase


class SeguroSinCoberturaTest(TransactionCase):

    def setUp(self):
        super(SeguroSinCoberturaTest, self).setUp()
        self.Seguro = self.registry('insurance.insurance')
        self.Deudor = self.registry('insurance.partner')
        self.City = self.registry('res.country.state.city')
        self.city_id = self.City.search(
            self.cr,
            self.uid,
            [('name','=','Cuenca')]
        )[0]
        self.Civil = self.registry('insurance.partner.civil')
        self.casado = self.Civil.create(
            self.cr,
            self.uid,
            {
                'code': '01',
                'name': 'CASADO',
                'married': True
            }
        )
        self.soltero = self.Civil.create(
            self.cr,
            self.uid,
            {
                'code': '02',
                'name': 'SOLTERO',
            }
        )        
        

    def test_seguro_sin_cobertura_menor_edad(self):
        cursor = self.cr
        user_id = self.uid
        deudor_id = self.Deudor.create(
            cursor,
            user_id,
            {
                'name': 'Juanito',
                'last_name': 'Perez',
                'tipo_identificador': 'cedula',
                'identificador': '0103893962',
                'birth_date': '2000-01-01',
                'mobile': '0994112233',
                'phone': '072888888',
                'sexo': 'm',
                'email': 'juanito@perez.com',
                'civil_id': self.soltero
            }
        )
        seguro_id = self.Seguro.create(
            cursor,
            user_id,
            {
                'deudor_id': deudor_id,
                'city_id': self.city_id,
                'account_number': '00980981',
                'nro_operacion_credito': '14343',
                'plazo': 12,
                'total_active_credits': 10000,
                'monto_credito_solicitado': 30000
            }
        )
        self.assertNotEqual(seguro_id, 0)
        self.Seguro.action_validate(cursor, user_id, [seguro_id])
        
        
