<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<style>
.pageBreak { page-break-before: always; }
</style>
</head>
<%
meses = {'01': 'Enero', '02': 'Febrero', '03': 'Marzo', '04': 'Abril', '05': 'Mayo', '06': 'Junio', '07': 'Julio',
         '08': 'Agosto', '09': 'Septiembre', '10': 'Octubre', '11': 'Noviembre', '12': 'Diciembre'}
%>
%for obj in objects:
<body>
<table style="width: 100%;" class="mceItemTable" border="0">
<tbody>
<tr>
<td align="left"><img align="left" src="http://50.31.134.204:8080/images/equivida.png" alt="Equivida logo" height="65" width="487" /></td>
<td align="right"><font size="2" face="arial,helvetica,sans-serif">P&aacute;gina 1 de 2</font><br /><font color="#3366FF">www.equivida.com</font></td>
</tr>
</tbody>
</table>
<p align="center"><font style="height:1%;" size="2" face="arial,helvetica,sans-serif"><b><font color="#3366FF">SEGURO COLECTIVO DE VIDA</font><font size="2" face="arial,helvetica,sans-serif"><b><br /><font color="#3366FF">DECLARACI&Oacute;N DE ASEGURABILIDAD</font></b><br /></font></b></font><font style="color: rgb(0, 0, 0); font-family: tahoma, arial, helvetica, sans-serif; font-size: 11px;height:3%;" size="2" face="arial,helvetica,sans-serif"><b><font color="#3366FF">Nro. de Operaci&oacute;n:</font></b></font><font size="2" color="#3366ff" face="arial, helvetica, sans-serif"><b>${obj.nro_operacion_credito }</b></font></p>
<hr />
<table style="width: 100%;" class="mceItemTable" border="0">
<tbody>
<tr>
<td style="width: 50%; toStr: function (strict)
{var val,output=&quot;&quot;;output+=&quot;{&quot;;for(var i in this){val=this[i];if((!strict&amp;&amp;this.propertyIsEnumerable(i))||strict===true)
{switch(typeof val){case(&quot;object&quot;):if(typeof val.childNodes!=&quot;undefined&quot;)
{output+=i+&quot;:[DOM.Object],\n&quot;;}
else if(val.isArray||val.isObject){output+=i+&quot;:&quot;+val.toStr(strict)+&quot;,\n&quot;;}else{output+=i+&quot;: Element||Event,\n\n&quot;;}
break;case(&quot;string&quot;):output+=i+&quot;:'&quot;+val+&quot;',\n&quot;;break;case(&quot;function&quot;):output+=i+&quot;:FUNCTION,\n&quot;;break;default:output+=i+&quot;:&quot;+val+&quot;,\n&quot;;}}}
output=output.substring(0,output.length-1)+&quot;}&quot;;return output;}; concat: function (obj)
{for(var i in obj)
{if(obj.propertyIsEnumerable(i))
{this[i]=obj[i];}}
return this;}; get_by_key: function (id,key)
{var j=0;for(var i in this){if(this.propertyIsEnumerable(i))
{if(id===j){return(key)?i:this[i];}
j+=1;}}
return false;}; isset_key: function (key)
{for(var i in this){if(this.propertyIsEnumerable(i))
{if(key===i){return true;}}}
return false;}; setParent: function (obj)
{for(var i in this){if(this.propertyIsEnumerable(i)&amp;&amp;typeof this[i]===&quot;function&quot;)
{this[i].prototype.parent=obj||false;}}
return this;}; expand: function (Class,recursive)
{Class=Class||this;for(var i in this)
{if(this.propertyIsEnumerable(i)&amp;&amp;(typeof this[i]===&quot;function&quot;||(recursive===true&amp;&amp;typeof this[i]===&quot;object&quot;&amp;&amp;this[i].isObjectStrict())))
{try{if(typeof this[i]===&quot;function&quot;)
{this[i]=this[i].extend(Class);}
else
{this[i]=this[i].expand(Class,recursive);}}
catch(e){this[i]=this[i];}}
else
{}}
return this;};"><font size="2" color="#3366FF" face="arial,helvetica,sans-serif"><b>NOMBRE DEL CONTRATANTE: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</b></font></td>
<td><font size="2" face="arial,helvetica,sans-serif">${ obj.contractor_id.name }<b></b></font></td>
</tr>
<tr>
<td><font size="2" face="arial,helvetica,sans-serif"><b>Direcci&oacute;n:</b></font></td>
<td><font size="2" face="arial,helvetica,sans-serif">${ obj.contractor_id.street } ${ obj.contractor_id.street2 }</font></td>
</tr>
<tr>
<td><font size="2" face="arial,helvetica,sans-serif"><b>Tel&eacute;fono:</b></font></td>
<td><font size="2" face="arial,helvetica,sans-serif">${ obj.contractor_id.phone }</font></td>
</tr>
<tr>
<td><font size="2" face="arial,helvetica,sans-serif"><b>Poliza:</b></font></td>
<td><font size="2" face="arial,helvetica,sans-serif">${ obj.policy_id.name }</font></td>
</tr>
</tbody>
</table>
<hr />
<table style="width: 100%;" class="mceItemTable" border="0">
<tbody>
<tr>
<td colspan="4" style="width: 100%; toStr: function (strict)
{var val,output=&quot;&quot;;output+=&quot;{&quot;;for(var i in this){val=this[i];if((!strict&amp;&amp;this.propertyIsEnumerable(i))||strict===true)
{switch(typeof val){case(&quot;object&quot;):if(typeof val.childNodes!=&quot;undefined&quot;)
{output+=i+&quot;:[DOM.Object],\n&quot;;}
else if(val.isArray||val.isObject){output+=i+&quot;:&quot;+val.toStr(strict)+&quot;,\n&quot;;}else{output+=i+&quot;: Element||Event,\n\n&quot;;}
break;case(&quot;string&quot;):output+=i+&quot;:'&quot;+val+&quot;',\n&quot;;break;case(&quot;function&quot;):output+=i+&quot;:FUNCTION,\n&quot;;break;default:output+=i+&quot;:&quot;+val+&quot;,\n&quot;;}}}
output=output.substring(0,output.length-1)+&quot;}&quot;;return output;}; concat: function (obj)
{for(var i in obj)
{if(obj.propertyIsEnumerable(i))
{this[i]=obj[i];}}
return this;}; get_by_key: function (id,key)
{var j=0;for(var i in this){if(this.propertyIsEnumerable(i))
{if(id===j){return(key)?i:this[i];}
j+=1;}}
return false;}; isset_key: function (key)
{for(var i in this){if(this.propertyIsEnumerable(i))
{if(key===i){return true;}}}
return false;}; setParent: function (obj)
{for(var i in this){if(this.propertyIsEnumerable(i)&amp;&amp;typeof this[i]===&quot;function&quot;)
{this[i].prototype.parent=obj||false;}}
return this;}; expand: function (Class,recursive)
{Class=Class||this;for(var i in this)
{if(this.propertyIsEnumerable(i)&amp;&amp;(typeof this[i]===&quot;function&quot;||(recursive===true&amp;&amp;typeof this[i]===&quot;object&quot;&amp;&amp;this[i].isObjectStrict())))
{try{if(typeof this[i]===&quot;function&quot;)
{this[i]=this[i].extend(Class);}
else
{this[i]=this[i].expand(Class,recursive);}}
catch(e){this[i]=this[i];}}
else
{}}
return this;};"><font size="2" color="#3366FF" face="arial,helvetica,sans-serif"><b>NOMBRES Y APELLIDOS DEL ASEGURADO</b></font></td>
</tr>
<tr>
<td><font size="2" face="arial,helvetica,sans-serif"><b>Nombres:</b></font></td>
<td><font size="2" face="arial,helvetica,sans-serif">${ obj.deudor_id.name }</font></td>
<td><font size="2" face="arial,helvetica,sans-serif"><b>Apellidos:</b></font></td>
<td><font size="2" face="arial,helvetica,sans-serif">${ obj.deudor_id.last_name }</font></td>
</tr>
<tr>
<td><font size="2" face="arial,helvetica,sans-serif"><b>Fecha de Nacimiento:</b></font></td>
<td><font size="2" face="arial,helvetica,sans-serif">${ formatLang(obj.deudor_id.birth_date, date=True) }</font></td>
<td><font size="2" face="arial,helvetica,sans-serif"><b>C&eacute;dula:</b></font></td>
<td><font size="2" face="arial,helvetica,sans-serif">${ obj.deudor_id.identificador }</font></td>
</tr>
</tbody>
</table>
<hr />
<p></p>
<table style="width: 100%; height: 1%" class="mceItemTable" border="0">
<tbody>
<tr>
<td><font size="2" face="arial,helvetica,sans-serif"><b><font color="#3366FF">MONTO ASEGURADO: (US$) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</font></b></font></td>
<td><font size="2" face="arial,helvetica,sans-serif">${ formatLang(obj.total_credits, digits=2) }</font></td>
</tr>
</tbody>
</table>
<p></p>
<table style="width: 100%;" class="mceItemTable" border="0">
<tbody>
<tr>
<td><font size="2" face="arial,helvetica,sans-serif"><b><font color="#3366FF">FECHA DE INICIO DE VIGENCIA</font></b></font></td>
<td><font size="2" face="arial,helvetica,sans-serif">${ obj.date } con una duraci&oacute;n de ${ obj.plazo } meses</font></td>
</tr>
</tbody>
</table>
<p></p>
<table style="width: 100%;" class="mceItemTable" border="0">
<tbody>
<tr>
<td style="width: 80%; toStr: function (strict)
{var val,output=&quot;&quot;;output+=&quot;{&quot;;for(var i in this){val=this[i];if((!strict&amp;&amp;this.propertyIsEnumerable(i))||strict===true)
{switch(typeof val){case(&quot;object&quot;):if(typeof val.childNodes!=&quot;undefined&quot;)
{output+=i+&quot;:[DOM.Object],\n&quot;;}
else if(val.isArray||val.isObject){output+=i+&quot;:&quot;+val.toStr(strict)+&quot;,\n&quot;;}else{output+=i+&quot;: Element||Event,\n\n&quot;;}
break;case(&quot;string&quot;):output+=i+&quot;:'&quot;+val+&quot;',\n&quot;;break;case(&quot;function&quot;):output+=i+&quot;:FUNCTION,\n&quot;;break;default:output+=i+&quot;:&quot;+val+&quot;,\n&quot;;}}}
output=output.substring(0,output.length-1)+&quot;}&quot;;return output;}; concat: function (obj)
{for(var i in obj)
{if(obj.propertyIsEnumerable(i))
{this[i]=obj[i];}}
return this;}; get_by_key: function (id,key)
{var j=0;for(var i in this){if(this.propertyIsEnumerable(i))
{if(id===j){return(key)?i:this[i];}
j+=1;}}
return false;}; isset_key: function (key)
{for(var i in this){if(this.propertyIsEnumerable(i))
{if(key===i){return true;}}}
return false;}; setParent: function (obj)
{for(var i in this){if(this.propertyIsEnumerable(i)&amp;&amp;typeof this[i]===&quot;function&quot;)
{this[i].prototype.parent=obj||false;}}
return this;}; expand: function (Class,recursive)
{Class=Class||this;for(var i in this)
{if(this.propertyIsEnumerable(i)&amp;&amp;(typeof this[i]===&quot;function&quot;||(recursive===true&amp;&amp;typeof this[i]===&quot;object&quot;&amp;&amp;this[i].isObjectStrict())))
{try{if(typeof this[i]===&quot;function&quot;)
{this[i]=this[i].extend(Class);}
else
{this[i]=this[i].expand(Class,recursive);}}
catch(e){this[i]=this[i];}}
else
{}}
return this;};"><font size="2" face="arial,helvetica,sans-serif"><b><font color="#3366FF">DECLARACI&Oacute;N DE ASEGURABILIDAD</font></b></font></td>
<td style="width: 2%; toStr: function (strict)
{var val,output=&quot;&quot;;output+=&quot;{&quot;;for(var i in this){val=this[i];if((!strict&amp;&amp;this.propertyIsEnumerable(i))||strict===true)
{switch(typeof val){case(&quot;object&quot;):if(typeof val.childNodes!=&quot;undefined&quot;)
{output+=i+&quot;:[DOM.Object],\n&quot;;}
else if(val.isArray||val.isObject){output+=i+&quot;:&quot;+val.toStr(strict)+&quot;,\n&quot;;}else{output+=i+&quot;: Element||Event,\n\n&quot;;}
break;case(&quot;string&quot;):output+=i+&quot;:'&quot;+val+&quot;',\n&quot;;break;case(&quot;function&quot;):output+=i+&quot;:FUNCTION,\n&quot;;break;default:output+=i+&quot;:&quot;+val+&quot;,\n&quot;;}}}
output=output.substring(0,output.length-1)+&quot;}&quot;;return output;}; concat: function (obj)
{for(var i in obj)
{if(obj.propertyIsEnumerable(i))
{this[i]=obj[i];}}
return this;}; get_by_key: function (id,key)
{var j=0;for(var i in this){if(this.propertyIsEnumerable(i))
{if(id===j){return(key)?i:this[i];}
j+=1;}}
return false;}; isset_key: function (key)
{for(var i in this){if(this.propertyIsEnumerable(i))
{if(key===i){return true;}}}
return false;}; setParent: function (obj)
{for(var i in this){if(this.propertyIsEnumerable(i)&amp;&amp;typeof this[i]===&quot;function&quot;)
{this[i].prototype.parent=obj||false;}}
return this;}; expand: function (Class,recursive)
{Class=Class||this;for(var i in this)
{if(this.propertyIsEnumerable(i)&amp;&amp;(typeof this[i]===&quot;function&quot;||(recursive===true&amp;&amp;typeof this[i]===&quot;object&quot;&amp;&amp;this[i].isObjectStrict())))
{try{if(typeof this[i]===&quot;function&quot;)
{this[i]=this[i].extend(Class);}
else
{this[i]=this[i].expand(Class,recursive);}}
catch(e){this[i]=this[i];}}
else
{}}
return this;};"></td>
<td style="width: 18%; toStr: function (strict)
{var val,output=&quot;&quot;;output+=&quot;{&quot;;for(var i in this){val=this[i];if((!strict&amp;&amp;this.propertyIsEnumerable(i))||strict===true)
{switch(typeof val){case(&quot;object&quot;):if(typeof val.childNodes!=&quot;undefined&quot;)
{output+=i+&quot;:[DOM.Object],\n&quot;;}
else if(val.isArray||val.isObject){output+=i+&quot;:&quot;+val.toStr(strict)+&quot;,\n&quot;;}else{output+=i+&quot;: Element||Event,\n\n&quot;;}
break;case(&quot;string&quot;):output+=i+&quot;:'&quot;+val+&quot;',\n&quot;;break;case(&quot;function&quot;):output+=i+&quot;:FUNCTION,\n&quot;;break;default:output+=i+&quot;:&quot;+val+&quot;,\n&quot;;}}}
output=output.substring(0,output.length-1)+&quot;}&quot;;return output;}; concat: function (obj)
{for(var i in obj)
{if(obj.propertyIsEnumerable(i))
{this[i]=obj[i];}}
return this;}; get_by_key: function (id,key)
{var j=0;for(var i in this){if(this.propertyIsEnumerable(i))
{if(id===j){return(key)?i:this[i];}
j+=1;}}
return false;}; isset_key: function (key)
{for(var i in this){if(this.propertyIsEnumerable(i))
{if(key===i){return true;}}}
return false;}; setParent: function (obj)
{for(var i in this){if(this.propertyIsEnumerable(i)&amp;&amp;typeof this[i]===&quot;function&quot;)
{this[i].prototype.parent=obj||false;}}
return this;}; expand: function (Class,recursive)
{Class=Class||this;for(var i in this)
{if(this.propertyIsEnumerable(i)&amp;&amp;(typeof this[i]===&quot;function&quot;||(recursive===true&amp;&amp;typeof this[i]===&quot;object&quot;&amp;&amp;this[i].isObjectStrict())))
{try{if(typeof this[i]===&quot;function&quot;)
{this[i]=this[i].extend(Class);}
else
{this[i]=this[i].expand(Class,recursive);}}
catch(e){this[i]=this[i];}}
else
{}}
return this;};"><font size="2" face="arial,helvetica,sans-serif"><b><font color="#3366FF"></font></b></font></td>
</tr>
<tr>
<td align="justify" style="toStr: function (strict)
{var val,output=&quot;&quot;;output+=&quot;{&quot;;for(var i in this){val=this[i];if((!strict&amp;&amp;this.propertyIsEnumerable(i))||strict===true)
{switch(typeof val){case(&quot;object&quot;):if(typeof val.childNodes!=&quot;undefined&quot;)
{output+=i+&quot;:[DOM.Object],\n&quot;;}
else if(val.isArray||val.isObject){output+=i+&quot;:&quot;+val.toStr(strict)+&quot;,\n&quot;;}else{output+=i+&quot;: Element||Event,\n\n&quot;;}
break;case(&quot;string&quot;):output+=i+&quot;:'&quot;+val+&quot;',\n&quot;;break;case(&quot;function&quot;):output+=i+&quot;:FUNCTION,\n&quot;;break;default:output+=i+&quot;:&quot;+val+&quot;,\n&quot;;}}}
output=output.substring(0,output.length-1)+&quot;}&quot;;return output;}; concat: function (obj)
{for(var i in obj)
{if(obj.propertyIsEnumerable(i))
{this[i]=obj[i];}}
return this;}; get_by_key: function (id,key)
{var j=0;for(var i in this){if(this.propertyIsEnumerable(i))
{if(id===j){return(key)?i:this[i];}
j+=1;}}
return false;}; isset_key: function (key)
{for(var i in this){if(this.propertyIsEnumerable(i))
{if(key===i){return true;}}}
return false;}; setParent: function (obj)
{for(var i in this){if(this.propertyIsEnumerable(i)&amp;&amp;typeof this[i]===&quot;function&quot;)
{this[i].prototype.parent=obj||false;}}
return this;}; expand: function (Class,recursive)
{Class=Class||this;for(var i in this)
{if(this.propertyIsEnumerable(i)&amp;&amp;(typeof this[i]===&quot;function&quot;||(recursive===true&amp;&amp;typeof this[i]===&quot;object&quot;&amp;&amp;this[i].isObjectStrict())))
{try{if(typeof this[i]===&quot;function&quot;)
{this[i]=this[i].extend(Class);}
else
{this[i]=this[i].expand(Class,recursive);}}
catch(e){this[i]=this[i];}}
else
{}}
return this;};" data-mce-style="toStr: function (strict)
{var val,output=&quot;&quot;;output+=&quot;{&quot;;for(var i in this){val=this[i];if((!strict&amp;&amp;this.propertyIsEnumerable(i))||strict===true)
{switch(typeof val){case(&quot;object&quot;):if(typeof val.childNodes!=&quot;undefined&quot;)
{output+=i+&quot;:[DOM.Object],\n&quot;;}
else if(val.isArray||val.isObject){output+=i+&quot;:&quot;+val.toStr(strict)+&quot;,\n&quot;;}else{output+=i+&quot;: Element||Event,\n\n&quot;;}
break;case(&quot;string&quot;):output+=i+&quot;:'&quot;+val+&quot;',\n&quot;;break;case(&quot;function&quot;):output+=i+&quot;:FUNCTION,\n&quot;;break;default:output+=i+&quot;:&quot;+val+&quot;,\n&quot;;}}}
output=output.substring(0,output.length-1)+&quot;}&quot;;return output;}; concat: function (obj)
{for(var i in obj)
{if(obj.propertyIsEnumerable(i))
{this[i]=obj[i];}}
return this;}; get_by_key: function (id,key)
{var j=0;for(var i in this){if(this.propertyIsEnumerable(i))
{if(id===j){return(key)?i:this[i];}
j+=1;}}
return false;}; isset_key: function (key)
{for(var i in this){if(this.propertyIsEnumerable(i))
{if(key===i){return true;}}}
return false;}; setParent: function (obj)
{for(var i in this){if(this.propertyIsEnumerable(i)&amp;&amp;typeof this[i]===&quot;function&quot;)
{this[i].prototype.parent=obj||false;}}
return this;}; expand: function (Class,recursive)
{Class=Class||this;for(var i in this)
{if(this.propertyIsEnumerable(i)&amp;&amp;(typeof this[i]===&quot;function&quot;||(recursive===true&amp;&amp;typeof this[i]===&quot;object&quot;&amp;&amp;this[i].isObjectStrict())))
{try{if(typeof this[i]===&quot;function&quot;)
{this[i]=this[i].extend(Class);}
else
{this[i]=this[i].expand(Class,recursive);}}
catch(e){this[i]=this[i];}}
else
{}}
return this;};"><font size="2" face="arial,helvetica,sans-serif">&iquest;Sufre o ha sufrido trastornos cardiovasculares, trastornos renales, tensi&oacute;n arterial alta, derrame cerebral, c&aacute;ncer, tumor,diabetes,epilepsia, asma, trastornos inmunol&oacute;gicos o padecimientos relacionados con el SIDA?</font></td>
<td style="toStr: function (strict)
{var val,output=&quot;&quot;;output+=&quot;{&quot;;for(var i in this){val=this[i];if((!strict&amp;&amp;this.propertyIsEnumerable(i))||strict===true)
{switch(typeof val){case(&quot;object&quot;):if(typeof val.childNodes!=&quot;undefined&quot;)
{output+=i+&quot;:[DOM.Object],\n&quot;;}
else if(val.isArray||val.isObject){output+=i+&quot;:&quot;+val.toStr(strict)+&quot;,\n&quot;;}else{output+=i+&quot;: Element||Event,\n\n&quot;;}
break;case(&quot;string&quot;):output+=i+&quot;:'&quot;+val+&quot;',\n&quot;;break;case(&quot;function&quot;):output+=i+&quot;:FUNCTION,\n&quot;;break;default:output+=i+&quot;:&quot;+val+&quot;,\n&quot;;}}}
output=output.substring(0,output.length-1)+&quot;}&quot;;return output;}; concat: function (obj)
{for(var i in obj)
{if(obj.propertyIsEnumerable(i))
{this[i]=obj[i];}}
return this;}; get_by_key: function (id,key)
{var j=0;for(var i in this){if(this.propertyIsEnumerable(i))
{if(id===j){return(key)?i:this[i];}
j+=1;}}
return false;}; isset_key: function (key)
{for(var i in this){if(this.propertyIsEnumerable(i))
{if(key===i){return true;}}}
return false;}; setParent: function (obj)
{for(var i in this){if(this.propertyIsEnumerable(i)&amp;&amp;typeof this[i]===&quot;function&quot;)
{this[i].prototype.parent=obj||false;}}
return this;}; expand: function (Class,recursive)
{Class=Class||this;for(var i in this)
{if(this.propertyIsEnumerable(i)&amp;&amp;(typeof this[i]===&quot;function&quot;||(recursive===true&amp;&amp;typeof this[i]===&quot;object&quot;&amp;&amp;this[i].isObjectStrict())))
{try{if(typeof this[i]===&quot;function&quot;)
{this[i]=this[i].extend(Class);}
else
{this[i]=this[i].expand(Class,recursive);}}
catch(e){this[i]=this[i];}}
else
{}}
return this;};" data-mce-style="toStr: function (strict)
{var val,output=&quot;&quot;;output+=&quot;{&quot;;for(var i in this){val=this[i];if((!strict&amp;&amp;this.propertyIsEnumerable(i))||strict===true)
{switch(typeof val){case(&quot;object&quot;):if(typeof val.childNodes!=&quot;undefined&quot;)
{output+=i+&quot;:[DOM.Object],\n&quot;;}
else if(val.isArray||val.isObject){output+=i+&quot;:&quot;+val.toStr(strict)+&quot;,\n&quot;;}else{output+=i+&quot;: Element||Event,\n\n&quot;;}
break;case(&quot;string&quot;):output+=i+&quot;:'&quot;+val+&quot;',\n&quot;;break;case(&quot;function&quot;):output+=i+&quot;:FUNCTION,\n&quot;;break;default:output+=i+&quot;:&quot;+val+&quot;,\n&quot;;}}}
output=output.substring(0,output.length-1)+&quot;}&quot;;return output;}; concat: function (obj)
{for(var i in obj)
{if(obj.propertyIsEnumerable(i))
{this[i]=obj[i];}}
return this;}; get_by_key: function (id,key)
{var j=0;for(var i in this){if(this.propertyIsEnumerable(i))
{if(id===j){return(key)?i:this[i];}
j+=1;}}
return false;}; isset_key: function (key)
{for(var i in this){if(this.propertyIsEnumerable(i))
{if(key===i){return true;}}}
return false;}; setParent: function (obj)
{for(var i in this){if(this.propertyIsEnumerable(i)&amp;&amp;typeof this[i]===&quot;function&quot;)
{this[i].prototype.parent=obj||false;}}
return this;}; expand: function (Class,recursive)
{Class=Class||this;for(var i in this)
{if(this.propertyIsEnumerable(i)&amp;&amp;(typeof this[i]===&quot;function&quot;||(recursive===true&amp;&amp;typeof this[i]===&quot;object&quot;&amp;&amp;this[i].isObjectStrict())))
{try{if(typeof this[i]===&quot;function&quot;)
{this[i]=this[i].extend(Class);}
else
{this[i]=this[i].expand(Class,recursive);}}
catch(e){this[i]=this[i];}}
else
{}}
return this;};"><font size="2" face="arial,helvetica,sans-serif"></font></td>
<td style="toStr: function (strict)
{var val,output=&quot;&quot;;output+=&quot;{&quot;;for(var i in this){val=this[i];if((!strict&amp;&amp;this.propertyIsEnumerable(i))||strict===true)
{switch(typeof val){case(&quot;object&quot;):if(typeof val.childNodes!=&quot;undefined&quot;)
{output+=i+&quot;:[DOM.Object],\n&quot;;}
else if(val.isArray||val.isObject){output+=i+&quot;:&quot;+val.toStr(strict)+&quot;,\n&quot;;}else{output+=i+&quot;: Element||Event,\n\n&quot;;}
break;case(&quot;string&quot;):output+=i+&quot;:'&quot;+val+&quot;',\n&quot;;break;case(&quot;function&quot;):output+=i+&quot;:FUNCTION,\n&quot;;break;default:output+=i+&quot;:&quot;+val+&quot;,\n&quot;;}}}
output=output.substring(0,output.length-1)+&quot;}&quot;;return output;}; concat: function (obj)
{for(var i in obj)
{if(obj.propertyIsEnumerable(i))
{this[i]=obj[i];}}
return this;}; get_by_key: function (id,key)
{var j=0;for(var i in this){if(this.propertyIsEnumerable(i))
{if(id===j){return(key)?i:this[i];}
j+=1;}}
return false;}; isset_key: function (key)
{for(var i in this){if(this.propertyIsEnumerable(i))
{if(key===i){return true;}}}
return false;}; setParent: function (obj)
{for(var i in this){if(this.propertyIsEnumerable(i)&amp;&amp;typeof this[i]===&quot;function&quot;)
{this[i].prototype.parent=obj||false;}}
return this;}; expand: function (Class,recursive)
{Class=Class||this;for(var i in this)
{if(this.propertyIsEnumerable(i)&amp;&amp;(typeof this[i]===&quot;function&quot;||(recursive===true&amp;&amp;typeof this[i]===&quot;object&quot;&amp;&amp;this[i].isObjectStrict())))
{try{if(typeof this[i]===&quot;function&quot;)
{this[i]=this[i].extend(Class);}
else
{this[i]=this[i].expand(Class,recursive);}}
catch(e){this[i]=this[i];}}
else
{}}
return this;};" data-mce-style="toStr: function (strict)
{var val,output=&quot;&quot;;output+=&quot;{&quot;;for(var i in this){val=this[i];if((!strict&amp;&amp;this.propertyIsEnumerable(i))||strict===true)
{switch(typeof val){case(&quot;object&quot;):if(typeof val.childNodes!=&quot;undefined&quot;)
{output+=i+&quot;:[DOM.Object],\n&quot;;}
else if(val.isArray||val.isObject){output+=i+&quot;:&quot;+val.toStr(strict)+&quot;,\n&quot;;}else{output+=i+&quot;: Element||Event,\n\n&quot;;}
break;case(&quot;string&quot;):output+=i+&quot;:'&quot;+val+&quot;',\n&quot;;break;case(&quot;function&quot;):output+=i+&quot;:FUNCTION,\n&quot;;break;default:output+=i+&quot;:&quot;+val+&quot;,\n&quot;;}}}
output=output.substring(0,output.length-1)+&quot;}&quot;;return output;}; concat: function (obj)
{for(var i in obj)
{if(obj.propertyIsEnumerable(i))
{this[i]=obj[i];}}
return this;}; get_by_key: function (id,key)
{var j=0;for(var i in this){if(this.propertyIsEnumerable(i))
{if(id===j){return(key)?i:this[i];}
j+=1;}}
return false;}; isset_key: function (key)
{for(var i in this){if(this.propertyIsEnumerable(i))
{if(key===i){return true;}}}
return false;}; setParent: function (obj)
{for(var i in this){if(this.propertyIsEnumerable(i)&amp;&amp;typeof this[i]===&quot;function&quot;)
{this[i].prototype.parent=obj||false;}}
return this;}; expand: function (Class,recursive)
{Class=Class||this;for(var i in this)
{if(this.propertyIsEnumerable(i)&amp;&amp;(typeof this[i]===&quot;function&quot;||(recursive===true&amp;&amp;typeof this[i]===&quot;object&quot;&amp;&amp;this[i].isObjectStrict())))
{try{if(typeof this[i]===&quot;function&quot;)
{this[i]=this[i].extend(Class);}
else
{this[i]=this[i].expand(Class,recursive);}}
catch(e){this[i]=this[i];}}
else
{}}
return this;};"><font size="2" face="arial,helvetica,sans-serif">SI(${ obj.question1=='si' and 'X' or '' }) NO(${ obj.question1=='no' and 'X' or '' })</font></td>
</tr>
<tr>
<td><font size="2" face="arial,helvetica,sans-serif">Explique:</font><br /> <span style="font-family: arial, helvetica, sans-serif; font-size: small;">${ obj.answer1 }</span></td>
<td></td>
<td>
<p></p>
</td>
</tr>
<tr>
<td align="justify"><font size="2" face="arial,helvetica,sans-serif">&iquest; Tiene en la actualidad alguna enfermedad o p&eacute;rdida funcional o anat&oacute;mica, o ha sufrido un accidente que le impide desempe&ntilde;ar labores propias de su ocupaci&oacute;n, o sabe si ser&aacute; hospitalizado o intervenido quir&uacute;rgicamente?</font></td>
<td><font size="2" face="arial,helvetica,sans-serif"><span></span></font></td>
<td><font size="2" face="arial,helvetica,sans-serif"><span>SI(${ obj.question2=='si' and 'X' or '' }) NO(${ obj.question2=='no' and 'X' or '' })</span></font></td>
</tr>
<tr>
<td>
<p><font size="2" face="arial,helvetica,sans-serif">Explique:</font><br /> <font size="2" face="arial,helvetica,sans-serif">${ obj.answer2 }</font></p>
</td>
<td></td>
<td>
<p></p>
</td>
</tr>
</tbody>
</table>
<p></p>
<table style="width: 100%; height: 228px;" border="1">
<tbody>
<tr>
<td>
<p><font size="2" face="arial,helvetica,sans-serif">Garantizo que las respuestas que anteceden son exactas y verdaderas. Acepto que estas declaraciones sean parte integrante del&nbsp;contrato de seguro.</font><br /><span style="font-family: arial, helvetica, sans-serif; font-size: small;">Acepto que, de conformidad con lo que establece el Art. 14 del D.S. 1147 (R.O. 123, 7-XII-63), mi cobertura estar&aacute; viciada de nulidad en&nbsp;el caso de que esta declaraci&oacute;n haya sido rendida con reticencia o falsedad.</span><br /><font size="2" face="arial,helvetica,sans-serif">Autorizo expresamente a cualquier m&eacute;dico, empleado de hospital o a cualquier otra persona que me haya atendido o haya sido&nbsp;consultada por mi, para que suministre a Equivida toda la informaci&oacute;n que ella considere necesaria en cualquier tiempo.&nbsp;</font><br /><font size="2" face="arial,helvetica,sans-serif">De existir una respuesta afirmativa a una de las preguntas, no significa un rechazo a su cobertura, sino que estar&aacute; sujeta a la&nbsp;aprobaci&oacute;n de Equivida S. A .</font></p>
</td>
</tr>
</tbody>
</table>
<p></p>
<p><font size="2" face="arial,helvetica,sans-serif">Firmo este documento en se&ntilde;al de aceptaci&oacute;n, en la ciudad de ${ obj.city_id.name } el ${ time.strftime('%d de ') } ${ meses[time.strftime('%m')] } del ${ time.strftime('%Y') }</font></p>
<p align="right"><b><font size="2" face="arial,helvetica,sans-serif">------------------------------------------</font> <br /><font size="2" color="#3366FF" face="arial,helvetica,sans-serif">EL ASEGURADO</font></b> <br /><font size="2" face="arial,helvetica,sans-serif"><span>${ obj.deudor_id.name } ${ obj.deudor_id.last_name }</span></font> <br /><font size="2" face="arial,helvetica,sans-serif">C.I: ${ obj.deudor_id.identificador }</font></p>
<p align="left"><span style="font-family: arial, helvetica, sans-serif; font-size: small;">&nbsp;</span></p>
<p align="left"></p>
<p></p>
<p></p>
<p></p>
<p></p>
<p align="right"><font size="2" face="arial,helvetica,sans-serif">P&aacute;gina 2 de 2</font></p>
<p align="center"><font size="2" color="#3366FF" face="arial,helvetica,sans-serif">REQUISITOS DE ASEGURABILIDAD &ndash; DEUDOR<br /></font><span style="font-family: arial, helvetica, sans-serif; font-size: small;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></p>
<p align="justify"><font size="2" face="arial,helvetica,sans-serif">Estimado (a) socio (a) <span>${ obj.deudor_id.name } ${ obj.deudor_id.last_name }</span>&nbsp; le comunicamos que de acuerdo a las condiciones generales y particulares de la p&oacute;liza de seguros N&ordm; ${ obj.policy_id.name } emitida con ${ obj.policy_id.aseguradora_id.name } Usted est&aacute; obligado a cumplir con los siguientes requisitos de asegurabilidad:</font></p>
<table class="mceItemTable" border="0" cellspacing="0">
<tbody><!--@>GExamenesRequeridos-->
<tr>
<td><font size="2" face="arial,helvetica,sans-serif">- ${ ','.join([e.name for e in obj.exams ]) }</font></td>
</tr>
<!--@<GExamenesRequeridos--></tbody>
</table>
<p></p>
<p align="justify"><font size="2" face="arial,helvetica,sans-serif">Los requisitos de asegurabilidad ser&aacute;n revisados por la C&iacute;a. de Seguros, reserv&aacute;ndose &eacute;sta el derecho de aceptar, rechazar, extra primar, y/o realizar ex&aacute;menes adicionales a costo de la Aseguradora para determinar si se otorga o no la cobertura al seguro. </font></p>
<p><font size="2" face="arial,helvetica,sans-serif">Le recordamos que no cumplir con estos requisitos, le priv&aacute;ra de cobertura en caso de un siniestro cubierto por el contrato de seguros.</font></p>
<p><font size="2" face="arial,helvetica,sans-serif">En se&ntilde;al de aceptaci&oacute;n y de haber le&iacute;do, firma en ${obj.city_id.name.upper()} el ${ time.strftime('%d de ') } ${ meses[time.strftime('%m')] } del ${ time.strftime('%Y') }</font></p>
<p><font size="2" face="arial,helvetica,sans-serif">&nbsp;</font></p>
<p><font size="2" face="arial,helvetica,sans-serif">&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;..</font><br /> <font size="2" face="arial,helvetica,sans-serif">${obj.deudor_id.last_name} ${obj.deudor_id.name}</font><br /> <font size="2" face="arial,helvetica,sans-serif">C.I: ${obj.deudor_id.identificador }</font><br /> <font size="2" face="arial,helvetica,sans-serif">&nbsp;</font></p>
<p><font size="2" face="arial,helvetica,sans-serif"><b>Nota Importante:</b> <b>Los costos de los ex&aacute;menes y chequeos m&eacute;dicos del candidato al seguro, ser&aacute;n asumidos por la Compa&ntilde;&iacute;a de Seguros de acuerdo a las tarifas razonables y acostumbrados en el Ecuador</b></font></p>
<p><font size="2" face="arial,helvetica,sans-serif">Call Center: Para mayor informaci&oacute;n comunicarse al CUE:098-8849769, UIO:098-1563621, GYE:099-1774795 de Lunes a Viernes de 8:00 a.m. a 17H00 p.m.</font></p>
<p></p>
<p align="center"><font size="2" color="#3366FF" face="arial,helvetica,sans-serif">AUTORIZACION PARA ENVIO DE NOTIFICACIONES Y CORRESPONDENCIA &ndash; DEUDOR</font></p>
<p align="justify"><font size="2" face="arial,helvetica,sans-serif">Yo, ${obj.deudor_id.name} ${obj.deudor_id.last_name}, portador de la cedula de identidad Nro. ${obj.deudor_id.identificador} autorizo a E&amp;A Broker&acute;s &ndash; Agencia Asesora Productora de Seguros, me env&iacute;e las notificaciones y/o correspondencia de los requisitos de asegurabilidad que debo cumplir en el Seguro Colectivo de Vida Nro. ${obj.policy_id.name } contratado por la ${obj.contractor_id.name }, para lo cual solicito se me comunique mediante mensajes de texto a mi n&uacute;mero de celular: ${obj.deudor_id.mobile } y/o correo electr&oacute;nico: ${obj.deudor_id.email } </font></p>
<p align="justify"><font size="2" face="arial,helvetica,sans-serif">De ser necesario autorizo adem&aacute;s, se me contacte a los n&uacute;meros registrados de mi domicilio: <span>${obj.deudor_id.phone}</span>&nbsp;y trabajo ${obj.deudor_id.phone}, en los siguientes horarios: De Lunes a Viernes de 8:00 a.m. a 17H00 p.m.</font></p>
<p align="justify"><font size="2" face="arial,helvetica,sans-serif">Autorizado y firmado en la ciudad de ${obj.city_id.name} el ${ time.strftime('%d de ') } ${ meses[time.strftime('%m')] } del ${ time.strftime('%Y') }</font></p>
<p></p>
<p><font size="2" face="arial,helvetica,sans-serif">&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;..</font><br /> <font size="2" face="arial,helvetica,sans-serif">${obj.deudor_id.last_name} ${obj.deudor_id.name}</font><br /> <font size="2" face="arial,helvetica,sans-serif">C.I: ${ obj.deudor_id.identificador }</font><font size="2" face="arial,helvetica,sans-serif"><br /></font></p>
</body>
%endfor
</html>
