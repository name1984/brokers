# -*- coding: utf-8 -*-

import time

from openerp.report import report_sxw

class certificado(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(certificado, self).__init__(cr, uid, name, context=context)
        self.localcontext.update(
            {
                'time': time,
                'convert_date': self.convert_date
            }
        )

    def convert_date(self, date):
        if not date:
            return ""
        meses = {'01': 'Enero', '02': 'Febrero',
                 '03': 'Marzo', '04': 'Abril',
                 '05': 'Mayo', '06': 'Junio',
                 '07': 'Julio',
                 '08': 'Agosto', '09': 'Septiembre',
                 '10': 'Octubre', '11': 'Noviembre',
                 '12': 'Diciembre'}
        y, m, d = date.split('-')
        return '{0} de {1} del {2}'.format(d,meses[m],y)
    

report_sxw.report_sxw('report.certificado_report', 'certificado_report', 'brokers/report/certificado_asegurabilidad.mako',parser=certificado)

report_sxw.report_sxw('report.certificado_deudor_report', 'certificado_deudor_report', 'brokers/report/certificado_deudor.mako', parser=certificado)

report_sxw.report_sxw('report.declaracion_report', 'declaracion_report', 'brokers/report/declaracion.mako', parser=certificado)

report_sxw.report_sxw('report.declaracion_deudor_codeudor_report',
                      'declaracion_deudor_codeudor_report',
                      'brokers/report/declaracion_deudor_codeudor.mako', parser=certificado)
