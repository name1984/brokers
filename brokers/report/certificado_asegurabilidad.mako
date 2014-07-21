<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  </head>
<%
meses = {'01': 'Enero', '02': 'Febrero', '03': 'Marzo', '04': 'Abril', '05': 'Mayo', '06': 'Junio', '07': 'Julio',
         '08': 'Agosto', '09': 'Septiembre', '10': 'Octubre', '11': 'Noviembre', '12': 'Diciembre'}
%>
  % for obj in objects:
  <body>
    <table class="mceItemTable" border="0">
      <tbody>
	<tr>
	  <td>
	    <table style="width: 549px; height: 73px;" class="mceItemTable" border="0">
	      <tbody>
		<tr>
		  <td></td>
		  <td align="right">
		    <p></p>
		  </td>
		</tr>
		<tr>
		  <td><img src="http://50.31.134.204:8080/images/equivida.png" height="47" width="400" /></td>
		  <td align="right">
		    <p><a href="http://www.equivida.com">www.equivida.com</a></p>
		    <p>Pag. 1 de 6</p>
		  </td>
		</tr>
	      </tbody>
	    </table>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p align="center"></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p align="center"><b>SOLICITUD DE ADHESI&Oacute;N</b></p>
	  </td>
	</tr>
	<tr>
	  <td align="center"><b>${ obj.contractor_id.name }</b></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td align="justify">
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td align="justify">
	    <p>Yo, ${ obj.deudor_id.name } ${ obj.deudor_id.last_name }, con c&eacute;dula n&uacute;mero ${ obj.deudor_id.identificador} solicito a ${obj.policy_id.aseguradora_id.name } de forma expresa, libre y voluntariamente adherirme a la P&oacute;liza n&uacute;mero ${ obj.policy_id.name } del Contratante <b>${ obj.contractor_id.name }, </b>y&nbsp;designo a E&amp;A Brokers Cia. Ltda., como mi asesor de seguros.</p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p>Adicional en mi calidad de Asegurado declaro que s&eacute; y conozco lo siguiente:</p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p align="justify">Que tengo derecho a que se le entregue copias debidamente suscritas y sumilladas de la P&oacute;liza y todos sus anexos, para cuyo efecto podr&eacute; &nbsp;acceder en todo momento a la p&aacute;gina web <a href="http://www.equivida.com/">www.equivida.com</a> y obtener una copia de su p&oacute;liza siguiendo las instrucciones que ah&iacute; constan, pues <span>${obj.policy_id.aseguradora_id.name },</span> ha puesto a mi disposici&oacute;n la P&oacute;liza y todos sus anexos para que pueda tener las mismas en todo momento.</p>
	  </td>
	</tr>
	<tr>
	  <td align="justify"></td>
	</tr>
	<tr>
	  <td align="justify">Y que de requerir una copia certificada de la P&oacute;liza y sus anexos, tengo derecho de requerir a la Compa&ntilde;&iacute;a la entrega de una copia con la constancia de ser fiel al original suscrito por el representante de la Aseguradora, la copia as&iacute; entregada se tendr&aacute; por el texto fidedigno de lo pactado para todos los efectos legales.&nbsp; Para el efecto anterior, enviar&aacute; un mensaje electr&oacute;nico a <span>${obj.policy_id.aseguradora_id.name }</span>&nbsp;a la direcci&oacute;n servicioalcliente@equivida.com solicitando copia de la P&oacute;liza y sus Anexos indicado su nombre completo y n&uacute;mero de c&eacute;dula de ciudadan&iacute;a o identidad e indicando la direcci&oacute;n d&oacute;nde se deber&aacute; entregar la copia certificada indicada, o me acercar&eacute; a cualquier oficina de <span>${obj.policy_id.aseguradora_id.name }</span>&nbsp;a formular el indicado requerimiento.</td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>Para constancia de lo anterior, suscribo el presente documento, en la ciudad de ${obj.city_id.name} el&nbsp;<span>${ convert_date(obj.date) }.</span></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p><b>AUTORIZACI&Oacute;N DE D&Eacute;BITO</b></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p align="justify">Yo, <span>${obj.deudor_id.name} ${obj.deudor_id.last_name}</span>&nbsp;con c&eacute;dula n&uacute;mero <span>${obj.deudor_id.identificador}</span>&nbsp;solicito a <span>${obj.policy_id.aseguradora_id.name}, </span>la adhesi&oacute;n a la p&oacute;liza No. <span>${obj.policy_id.name }</span>&nbsp;de forma expresa, libre y voluntariamente; adicionalmente designo a E&amp;A Brokers Cia. Ltda., como mi asesor de seguros, y autorizo a la <b>${obj.contractor_id.name}</b>, se incluya el valor para cubrir la prima del seguro en la cuota de mi cr&eacute;dito Nro. ${obj.nro_operacion_credito}, que estoy solicitando y que esta prima sea cancelada por la <b>${obj.contractor_id.name}</b>, a dicha Aseguradora. En caso de ser requerido autorizo que todas las primas de seguros de <span>${obj.policy_id.aseguradora_id.name},</span> sean debitadas de mi cuenta No. ${obj.account_number} que mantengo en la ${obj.contractor_id.name}.</p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p>Lugar y Fecha:&nbsp;${obj.city_id.name}, ${ convert_date(obj.date) }.</p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <table align="center" class="mceItemTable" border="0">
	      <tbody>
		<tr>
		  <td><b>&nbsp;____________________________</b></td>
		  <td><b>&nbsp;____________________________</b></td>
		</tr>
		<tr>
		  <td><b>FIRMA</b></td>
		  <td><b>FIRMA</b></td>
		</tr>
		<tr>
		  <td><span>${obj.deudor_id.name} ${obj.deudor_id.last_name}</span></td>
		  <td>@#TxtNombreCodeudor @#TxtApellidoCodeudor</td>
		</tr>
		<tr>
		  <td><b>CI/PAS:&nbsp;</b>${obj.deudor_id.identificador}</td>
		  <td><b>CI/PAS:&nbsp;</b>@#TxtCedulaCodeudor</td>
		</tr>
	      </tbody>
	    </table>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <table style="width: 549px; height: 73px;" class="mceItemTable" border="0">
	      <tbody>
		<tr>
		  <td><img src="http://50.31.134.204:8080/images/equivida.png" height="47" width="400" /></td>
		  <td align="right">
		    <p><a href="http://www.equivida.com">www.equivida.com</a></p>
		    <p>Pag. 2 de 6</p>
		  </td>
		</tr>
	      </tbody>
	    </table>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p><b>DECLARACI&Oacute;N DE ORIGEN DE FONDOS Y AUTORIZACI&Oacute;N:</b></p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p align="justify">Declaro expresa e irrevocablemente que los datos consignados en el presente formulario son correctos y fidedignos. As&iacute; mismo declaro que el origen de los fondos entregados a <span>${obj.policy_id.aseguradora_id.name}</span> por la P&oacute;liza, tienen un origen l&iacute;cito, permitido por las leyes del Ecuador.</p>
	    <p align="justify">Faculto a <span>${obj.policy_id.aseguradora_id.name}</span>, a proceder con la comprobaci&oacute;n de esta declaraci&oacute;n; para el efecto podr&aacute; realizar todas las indagaciones que considere necesarias, por los medios que considere convenientes y queda expresamente autorizado para que pueda utilizar, o entregar dicha informaci&oacute;n a las autoridades competentes, organismos de control y/o a otras instituciones o personas jur&iacute;dicas, legal o reglamentariamente facultadas.</p>
	    <p align="justify">Ex&iacute;mo a <span>${obj.policy_id.aseguradora_id.name}</span>, de toda responsabilidad, inclusive respecto de terceros, si esta declaraci&oacute;n fuese falsa.</p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td><b>IMPORTANTE</b></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p align="justify">En los casos que&nbsp;<span>${obj.policy_id.aseguradora_id.name}</span> considere necesario solicitar&aacute; documentaci&oacute;n adicional para identificar plenamente al cliente, en cumplimiento de la pol&iacute;tica "Conozca a su Cliente", estipulada en la normativa legal vigente en materia de Prevenci&oacute;n de Lavado de Activos y Financiamiento de Delitos.</p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>Lugar y Fecha:&nbsp;${obj.city_id.name} el&nbsp;@#fechaFormato.</td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <table align="center" class="mceItemTable" border="0">
	      <tbody>
		<tr>
		  <td><b>____________________________</b></td>
		  <td><b>____________________________</b></td>
		</tr>
		<tr>
		  <td><b>FIRMA&nbsp;&nbsp;</b></td>
		  <td><b>FIRMA &nbsp;</b></td>
		</tr>
		<tr>
		  <td><span>${obj.deudor_id.name} ${obj.deudor_id.last_name}</span></td>
		  <td>@#TxtNombreCodeudor @#TxtApellidoCodeudor</td>
		</tr>
		<tr>
		  <td><b>CI/PAS:&nbsp;</b>${obj.deudor_id.identificador}</td>
		  <td><b>CI/PAS:&nbsp;</b>@#TxtCedulaCodeudor</td>
		</tr>
	      </tbody>
	    </table>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <table class="mceItemTable" border="0">
	      <tbody>
		<tr>
		  <td><img src="http://50.31.134.204:8080/images/equivida.png" height="47" width="400" /></td>
		  <td align="right">
		    <p><a href="http://www.equivida.com/">www.equivida.com</a></p>
		    <p>Pag. 3 de 6</p>
		  </td>
		</tr>
	      </tbody>
	    </table>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p align="center"><b>SEGURO COLECTIVO DE VIDA DEUDORES<br /></b><b>CERTIFICADO INDIVIDUAL DE SEGURO<br />@#TxtContratante</b></p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p align="justify">@#DdAseguradora_label certifica que el Sr(a) <span>${obj.deudor_id.name} ${obj.deudor_id.last_name}</span>, con c&eacute;dula n&uacute;mero ${obj.deudor_id.identificador} y el Sr(a) @#TxtNombreCodeudor @#TxtApellidoCodeudor, con c&eacute;dula n&uacute;mero @#TxtCedulaCodeudor, est&aacute;n asegurados bajo la P&oacute;liza n&uacute;mero <span>@#DdPoliza_label&nbsp;</span>cuyo Contratante es <b>@#TxtContratante</b>, bajo las siguientes coberturas y montos:&nbsp;</p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <table align="center" class="mceItemTable" border="0">
	      <tbody>
		<tr>
		  <td><b>COBERTURAS</b></td>
		  <td><b>MONTO M&Aacute;XIMO ASEGURADO</b></td>
		</tr>
		<tr>
		  <td></td>
		  <td></td>
		</tr>
		<tr>
		  <td align="left">Vida Deudores (Muerte por Cualquier Causa)</td>
		  <td>USD. 250,000.00*</td>
		</tr>
		<tr>
		  <td align="left">Incapacidad Total y Permanente por Cualquier Causa</td>
		  <td>USD. 250,000.00*</td>
		</tr>
		<tr>
		  <td align="left">Sepelio Titular por Cualquier Causa</td>
		  <td>USD.&nbsp;&nbsp;&nbsp; 1,000.00</td>
		</tr>
		<tr>
		  <td align="left">Sepelio Deudor Solidario por Cualquier Causa</td>
		  <td>USD.&nbsp;&nbsp;&nbsp; 1,000.00</td>
		</tr>
	      </tbody>
	    </table>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	    <p align="justify">*El valor asegurado para cada persona ser&aacute; igual al saldo de la deuda contra&iacute;da con la @#TxtContratante, incluyendo los intereses por los d&iacute;as transcurridos entre la fecha del &uacute;ltimo abono contabilizado y la fecha del fallecimiento a raz&oacute;n del inter&eacute;s legal contratado y por un m&aacute;ximo de hasta 6 meses.</p>
	    <p align="justify">Se otorga cobertura para aquellos pr&eacute;stamos que, al fallecimiento del cliente deudor, se encuentren morosos en el pago puntual de su cr&eacute;dito, siempre y cuando la @#TxtContratante, reporte mensualmente tales clientes.</p>
	    <p align="justify">Las exclusiones y dem&aacute;s condiciones constan en la respectiva P&oacute;liza que es de su conocimiento cuyo texto se env&iacute;a a su correo electr&oacute;nico: @#TxtEmailDeudor. Adicional declaro que he recibido una copia de la P&oacute;liza original, todos sus anexos y condiciones particulares de la P&oacute;liza n&uacute;mero <span>@#DdPoliza_label</span>&nbsp;los cuales he le&iacute;do y aceptado.&nbsp;</p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <table class="mceItemTable" border="0">
	      <tbody>
		<tr>
		  <td><b>BENEFICIARIO</b></td>
		  <td align="center"><b>PORCENTAJE</b></td>
		</tr>
		<tr>
		  <td>@#TxtContratante</td>
		  <td align="center">100%</td>
		</tr>
	      </tbody>
	    </table>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p>Para Sepelio del Titular y del Deudor Solidario ser&aacute;n los herederos legales.</p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <table class="mceItemTable" style="width: 526px; height: 20px;" border="0">
	      <tbody>
		<tr>
		  <td><font size="2"><b>VIGENCIA DEL CERTIFICADO:</b></font></td>
		  <td>Desde:&nbsp;@#DatAprobacion</td>
		  <td>Hasta: @#DatLiquidacion</td>
		</tr>
		<tr>
		  <td><font size="2"><b></b></font></td>
		  <td></td>
		  <td></td>
		</tr>
	      </tbody>
	    </table>
	  </td>
	</tr>
	<tr>
	  <td>Fecha de emisi&oacute;n del certificado:&nbsp;@#TxtAgencia, @#fechaFormato.</td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <table align="center" class="mceItemTable" border="0">
	      <tbody>
		<tr>
		  <td><img align="middle" src="http://50.31.134.204:8080/images/FIRMA.png" height="44" width="125" /></td>
		  <td></td>
		  <td></td>
		</tr>
		<tr>
		  <td><b>________________________</b></td>
		  <td><b>________________________</b></td>
		  <td><b>________________________</b></td>
		</tr>
		<tr>
		  <td><b>FIRMA AUTORIZADA&nbsp;</b></td>
		  <td><b>&nbsp;FIRMA</b></td>
		  <td><b>&nbsp;FIRMA</b></td>
		</tr>
		<tr>
		  <td><b>EQUIVIDA COMPA&Ntilde;&Iacute;A DE</b></td>
		  <td>${obj.deudor_id.name} ${obj.deudor_id.last_name}</td>
		  <td><span>@#TxtNombreCodeudor @#TxtApellidoCodeudor</span></td>
		</tr>
		<tr>
		  <td><b>SEGUROS Y REASEGUROS S.A.&nbsp; &nbsp;</b></td>
		  <td><b>CI/PAS:&nbsp;</b>${obj.deudor_id.identificador}</td>
		  <td><b>CI/PAS:&nbsp;</b>@#TxtCedulaCodeudor</td>
		</tr>
	      </tbody>
	    </table>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <table class="mceItemTable" border="0">
	      <tbody>
		<tr>
		  <td><img src="http://50.31.134.204:8080/images/equivida.png" height="47" width="400" /></td>
		  <td align="right">
		    <p><a href="http://www.equivida.com/">www.equivida.com</a></p>
		    <p>Pag. 4 de 6</p>
		  </td>
		</tr>
	      </tbody>
	    </table>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p><b>COBERTURAS:</b></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td align="justify">
	    <p><b>Vida Deudores:</b> Equivida Compa&ntilde;&iacute;a de Seguros y Reaseguros S.A. pagar&aacute; al contratante de la P&oacute;liza hasta el valor m&aacute;ximo reportado ante el fallecimiento del deudor Asegurado, ocurrido en cualquier parte del mundo, en cualquiera de los trescientos sesenta y cinco (365) d&iacute;as del a&ntilde;o, por cualquier causa, estando esta P&oacute;liza en pleno vigor y durante el plazo del cr&eacute;dito concedido. Para que esta cobertura est&eacute; vigente las edades del deudor Asegurado deben estar comprendidas entre el d&iacute;a que cumpla dieciocho (18) a&ntilde;os de edad al momento de contratar el cr&eacute;dito, hasta el d&iacute;a que cumpla ochenta (80) a&ntilde;os de edad con cobertura al 100% y debe estar reportado en los listados enviados a Equivida Compa&ntilde;&iacute;a de Seguros y Reaseguros S.A.<b></b></p>
	    <p><b>Incapacidad Total y Permanente por Cualquier Causa: </b>Equivida Compa&ntilde;&iacute;a de Seguros y Reaseguros S.A. pagar&aacute; al Asegurado o a su(s) beneficiario(s) hasta el valor asegurado contratado, cuando quede incapacitado en forma total&nbsp; y permanente, a consecuencia de enfermedad o accidente, ocurrido durante la vigencia del anexo. Equivida Compa&ntilde;&iacute;a de Seguros y Reaseguros S.A. efectuar&aacute; el pago de la indemnizaci&oacute;n luego de ciento ochenta (180) d&iacute;as consecutivos de declarada la incapacidad por el&nbsp; M&eacute;dico de Equivida Compa&ntilde;&iacute;a de Seguros y Reaseguros S.A. Para que esta cobertura est&eacute; vigente las edades del deudor Asegurado deben estar comprendidas entre el d&iacute;a que cumpla dieciocho (18) a&ntilde;os de edad al momento de contratar el cr&eacute;dito y hasta el d&iacute;a que cumpla ochenta (80) a&ntilde;os de edad con cobertura al 100% y debe estar reportado en los listados enviados a Equivida Compa&ntilde;&iacute;a de Seguros y Reaseguros S.A.</p>
	    <p><b>Sepelio por Cualquier Causa:</b> Equivida Compa&ntilde;&iacute;a de Seguros y Reaseguros S.A. pagar&aacute; al contratante de la P&oacute;liza hasta el valor m&aacute;ximo reportado ante el fallecimiento del deudor Asegurado y/o Deudores Solidarios, ocurrido en cualquier parte del mundo, en cualquiera de los trescientos sesenta y cinco (365) d&iacute;as del a&ntilde;o, por cualquier causa, estando esta P&oacute;liza en pleno vigor y durante el plazo del cr&eacute;dito concedido. Para que esta cobertura est&eacute; vigente las edades del deudor Asegurado deben estar comprendidas entre el d&iacute;a que cumpla un (1) d&iacute;a de edad y hasta el d&iacute;a que cumpla setenta (70) a&ntilde;os de edad con cobertura al 100% y desde setenta a&ntilde;os un d&iacute;a hasta el d&iacute;a que cumpla ochenta (80) a&ntilde;os de edad con cobertura al 50% debe estar reportado en los listados enviados a Equivida Compa&ntilde;&iacute;a de Seguros y Reaseguros S.A.</p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p><b>EXCLUSIONES DE LA P&Oacute;LIZA:</b></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p><b>Vida Deudores y Sepelio por Cualquier Causa: </b>No cubre el suicidio durante el primer (1) a&ntilde;o de haber estado amparado ininterrumpidamente en la p&oacute;liza.<b></b></p>
	    <p><b>Incapacidad Total y Permanente por Cualquier Causa: </b>No cubre ninguna incapacidad que provenga o tenga su origen en:</p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <ul style="list-style-type: square;">
	      <li>Enfermedades o accidentes originados con anterioridad al ingreso a este seguro.</li>
	      <li>Intervenciones quir&uacute;rgicas o tratamientos que no hayan sido motivados por accidente o enfermedad.</li>
	      <li>Guerra declarada o no, conmoci&oacute;n civil, revuelta popular, mot&iacute;n, servicio en las fuerzas armadas (ej&eacute;rcito, aviaci&oacute;n y naval) y polic&iacute;a.</li>
	      <li>Viajes a&eacute;reos en aviones que no sean de l&iacute;neas comerciales autorizadas para el tr&aacute;fico regular de pasajeros, as&iacute; como tambi&eacute;n como miembro de la tripulaci&oacute;n de cualquier aeronave.</li>
	      <li>Heridas autoinflingidas intencionalmente, suicidio o cualquier intento de suicidio estando o no el asegurado en uso de sus facultades mentales.</li>
	      <li>Enfermedades mentales de cualquier naturaleza.</li>
	      <li>Reacci&oacute;n o radiaci&oacute;n nuclear o contaminaci&oacute;n radioactiva.</li>
	    </ul>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <table class="mceItemTable" style="width: 513px; height: 54px;" border="0">
	      <tbody>
		<tr>
		  <td><img src="http://50.31.134.204:8080/images/equivida.png" height="47" width="400" /></td>
		  <td align="right">
		    <p><a href="http://www.equivida.com/">www.equivida.com</a></p>
		    <p>Pag. 5 de 6</p>
		  </td>
		</tr>
	      </tbody>
	    </table>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <ul>
	      <li>Infecciones bacterianas (excepto infecciones piog&eacute;nicas que deriven de cortaduras o heridas accidentales)</li>
	      <li>Lesi&oacute;n corporal que de lugar a formaci&oacute;n de hernias.</li>
	      <li>Lesiones a consecuencia del ejercicio de una ocupaci&oacute;n o actividad deportiva distinta a las declaradas, salvo que el contratante haya notificado de la nueva ocupaci&oacute;n o actividad deportiva por escrito a Equivida S.A. y que esta haya aceptado el nuevo riesgo por escrito.</li>
	    </ul>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p><b>CLAUSULAS IMPORTANTES</b></p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p>Cl&aacute;usula de Indisputabilidad para Deudor Principal y Deudor Solidario presente</p>
	    <p align="justify">Esta condici&oacute;n tiene como objetivo el otorgar un beneficio adicional a los asegurados, a trav&eacute;s del cual quedan eximidos de su obligaci&oacute;n, seg&uacute;n el Art. 14 y el Art. 80 del t&iacute;tulo "del contrato del seguro" del c&oacute;digo de comercio, de declarar objetivamente el estado de su riesgo ya que la reticencia o falsedad son factores que vician de nulidad relativa el contrato de seguro. De no preverse esta condici&oacute;n, el periodo que deber&iacute;a transcurrir para lograr la indisputabilidad en el seguro de vida, ser&iacute;a de 2 a&ntilde;os, tal como lo expresa el Art. 81 de ese mismo cuerpo legal. Como producto de la condici&oacute;n particular anteriormente descrita, este periodo las partes lo acuerdan reducirlo a (90) d&iacute;as, contados desde el ultimo ingreso del asegurado a la p&oacute;liza".</p>
	    <p align="justify">"Equivida S.A. no pagar&aacute; el monto asegurado en el evento de que el titular asegurado que conste en el listado proporcionado por el contratante, el cual forma parte integrante de este contrato, fallezca durante los primeros (90) d&iacute;as desde el &uacute;ltimo ingreso a la p&oacute;liza, a consecuencia directa o indirecta de una enfermedad diagnosticada con anterioridad al &uacute;ltimo ingreso a la p&oacute;liza. Esta condici&oacute;n se entiende saneada si el asegurado ha puesto en conocimiento de Equivida S.A.&nbsp; las circunstancias agravantes y esta las acepta expresamente.</p>
	    <p>Cl&aacute;usula de indisputabilidad para deudor principal y deudor solidario ausente</p>
	    <p align="justify">Esta condici&oacute;n tiene como objetivo el otorgar un beneficio adicional a los asegurados, a trav&eacute;s del cual quedan eximidos de su obligaci&oacute;n, seg&uacute;n el Art. 14 y el Art. 80 del t&iacute;tulo "del contrato del seguro" del c&oacute;digo de comercio, de declarar objetivamente el estado de su riesgo ya que la reticencia o falsedad son factores que vician de nulidad relativa el contrato de seguro. De no preverse esta condici&oacute;n, el periodo que deber&iacute;a transcurrir para lograr la indisputabilidad en el seguro de vida, ser&iacute;a de 2 a&ntilde;os, tal como lo expresa el Art. 81 de ese mismo cuerpo legal. Como producto de la condici&oacute;n particular anteriormente descrita, este periodo las partes lo acuerdan reducirlo a (180) d&iacute;as, contados desde el ultimo ingreso del asegurado a la p&oacute;liza".</p>
	    <p align="justify">"Equivida S.A. no pagar&aacute; el monto asegurado en el evento de que el titular asegurado que conste en el listado proporcionado por el contratante, el cual forma parte integrante de este contrato, fallezca durante los primeros (180) d&iacute;as desde el &uacute;ltimo ingreso a la p&oacute;liza, a consecuencia directa o indirecta de una enfermedad diagnosticada con anterioridad al &uacute;ltimo ingreso a la p&oacute;liza. Esta condici&oacute;n se entiende saneada si el asegurado ha puesto en conocimiento de Equivida S.A.&nbsp; las circunstancias agravantes y esta las acepta expresamente.</p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p><b>PROCEDIMIENTO EN CASO DE SINIESTRO:</b></p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td align="justify">
	    <p>El beneficiario de la P&oacute;liza, en caso de fallecimiento del deudor Asegurado, dar&aacute; aviso por escrito cuando conozca de la existencia del beneficio, con el l&iacute;mite m&aacute;ximo de dos (2) a&ntilde;os contados desde la ocurrencia del siniestro. El plazo para aviso de siniestro en las dem&aacute;s coberturas es de 60 d&iacute;as como consta en las condiciones generales de la P&oacute;liza de seguro colectivo de vida deudores; caso contrario ser&aacute; considerado como extempor&aacute;neo y perder&aacute; los derechos a los beneficios establecidos en esta p&oacute;liza, librando a Equivida Compa&ntilde;&iacute;a de Seguros y Reaseguros S.A. del pago de la indemnizaci&oacute;n que hubiere correspondido.</p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <table class="mceItemTable" style="width: 513px; height: 54px;" border="0">
	      <tbody>
		<tr>
		  <td><img src="http://50.31.134.204:8080/images/equivida.png" height="47" width="400" /></td>
		  <td align="right">
		    <p><a href="http://www.equivida.com/">www.equivida.com</a></p>
		    <p>Pag. 6 de 6</p>
		  </td>
		</tr>
	      </tbody>
	    </table>
	  </td>
	</tr>
	<tr>
	  <td><b></b></td>
	</tr>
	<tr>
	  <td><b>DOCUMENTOS NECESARIOS EN CASO DE SINIESTRO:</b></td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p>Para pago de vida desgravamen</p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <ul style="list-style-type: square;">
	      <li>Formulario de reclamaci&oacute;n debidamente llenado en su totalidad y firmado por el reclamante.</li>
	      <li>Copia certificada o notariada de historia cl&iacute;nica y certificado del m&eacute;dico tratante indicando causas de fallecimiento y fechas en caso de enfermedades preexistentes.</li>
	      <li>Copia de la cedula de identidad del fallecido.</li>
	      <li>Acta de defunci&oacute;n certificada&nbsp; y/o notariada.</li>
	      <li>Tabla de amortizaci&oacute;n.</li>
	      <li>Copia del pagare.</li>
	    </ul>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p>En el caso de fallecimiento por accidente: adicional a todo lo indicado anteriormente se enviara:</p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <ul style="list-style-type: square;">
	      <li>Copia certificado parte policial.</li>
	      <li>Copia certificada o notariada de acta de levantamiento del cad&aacute;ver.</li>
	      <li>Copia certificada o notariada del protocolo de autopsia.</li>
	    </ul>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p>Para pago de Sepelio</p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <ul style="list-style-type: square;">
	      <li>Formulario de reclamaci&oacute;n debidamente llenado en su totalidad y firmado por el reclamante.</li>
	      <li>Copia certificada o notariada de historia cl&iacute;nica y/o certificado del m&eacute;dico tratante indicando causas de fallecimiento.</li>
	      <li>Copia de cedula de identidad del fallecido.</li>
	      <li>Acta de defunci&oacute;n certificada y/o notariada.</li>
	    </ul>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p>Para pago de Incapacidad Total y Permanente</p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <p></p>
	  </td>
	</tr>
	<tr>
	  <td>
	    <ul style="list-style-type: square;">
	      <li>Formulario de reclamaci&oacute;n debidamente llenado en su totalidad y firmado por el reclamante.</li>
	      <li>Copia certificada o notariada historia cl&iacute;nica y certificado del m&eacute;dico tratante indicando las causas y las fechas de la capacidad.</li>
	      <li>Informaci&oacute;n cl&iacute;nica, radiol&oacute;gica, histol&oacute;gica y de laboratorio.</li>
	      <li>Certificado del IESS validando la incapacidad.</li>
	      <li>Carnet del CONADIS.</li>
	      <li>Tabla de amortizaci&oacute;n.</li>
	      <li>Copia del pagar&eacute; o copia del contrato de otorgamiento del cr&eacute;dito.</li>
	    </ul>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <p>Nota: en caso de presentarse un siniestro amparado por la p&oacute;liza, Equivida S.A. podr&aacute; solicitar documentaci&oacute;n adicional que le permita determinar con exactitud la causa del fallecimiento y/o la incapacidad total y permanente.</p>
	  </td>
	</tr>
	<tr>
	  <td></td>
	</tr>
	<tr>
	  <td>
	    <table align="center" class="mceItemTable" border="0">
	      <tbody>
		<tr>
		  <td><img align="middle" src="http://50.31.134.204:8080/images/FIRMA.png" height="44" width="125" /></td>
		  <td></td>
		  <td></td>
		</tr>
		<tr>
		  <td><b>________________________</b></td>
		  <td><b>________________________</b></td>
		  <td><b>________________________</b></td>
		</tr>
		<tr>
		  <td><b>FIRMA AUTORIZADA&nbsp;</b></td>
		  <td><b>&nbsp;FIRMA</b></td>
		  <td><b>&nbsp;FIRMA</b></td>
		</tr>
		<tr>
		  <td><b>EQUIVIDA COMPA&Ntilde;&Iacute;A DE</b></td>
		  <td>${obj.deudor_id.name} ${obj.deudor_id.last_name}</td>
		  <td>@#TxtNombreCodeudor @#TxtApellidoCodeudor</td>
		</tr>
		<tr>
		  <td><b>SEGUROS Y REASEGUROS S.A.&nbsp; &nbsp;</b></td>
		  <td><b>CI/PAS:&nbsp;</b>${obj.deudor_id.identificador}</td>
		  <td><b>CI/PAS:&nbsp;</b>@#TxtCedulaCodeudor</td>
		</tr>
	      </tbody>
	    </table>
	  </td>
	</tr>
      </tbody>
    </table>
  </body>
  %endfor
</html>
