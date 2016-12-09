<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<style>
.table{	
	font-size:16px;
	font-family: 'Gloria Hallelujah', cursive;
	text-transform: capitalize;
}
.nav-tabs>li>a{
	color: black;
	font-size:16px;
	font-family: 'Gloria Hallelujah', cursive;	
}
.tab-content{
	font-size:16px;
	font-family: 'Gloria Hallelujah', cursive;
	text-transform: capitalize;
}
</style>
<script type="text/javascript">
function buscarCursos(valor) {
	document.idFormCiclo.submit();
}
function setCurso(valor){
	$('#idCurso').val(valor);
	//$('#regPreg').show();
}
$(document).ready(function() {
	$('.fecha').datepicker({
		format: "dd-mm-yyyy",
	    maxViewMode: 3,
	    language: "es",
	    autoclose:true,
	    orientation: "bottom auto"
	});
});
</script>
<center><h2>REGISTRO DE EVALUACIÓN VIRTUAL</h2></center>
<div id="divMensaje" style="text-align:center;">
<s:set var="msj_val"><s:property value="mensaje"/></s:set>
<s:set var="msje_val"><s:property value="mensajeError"/></s:set>
<s:if test="#msj_val != ''">
	<div class="alert alert-success">
	  <strong>¡Éxito!</strong> <s:property value="mensaje"/>.
	</div>	
</s:if>
<s:if test="#msje_val != ''">
	<div class="alert alert-danger">
	  <strong>¡Error!</strong> <s:property value="mensajeError"/>.
	</div>
</s:if>	
</div>
<table class="table" style="text-align: left;">
	<tr>
		<td width="100px" style="vertical-align: middle;">
			CARRERA			
		</td>
		<td width="250px">
			<s:select 
				name="codcarrera"
				list="lstCarreraExa"
				listKey="codigo"
				listValue="datos" cssClass="form-control"/>
		</td>
		<td width="100px" style="vertical-align: middle;">
			CICLO
		</td>
		<td width="150px">
			<s:form id="idFormCiclo" action="buscCursos">
			<s:select				
				name="codciclo" 
				list="lstCicloExa"
				listKey="codigo"
				listValue="datos"
				value="#session.selCiclo"
				headerKey="-1"
				headerValue="[ Seleccionar ]"
				onchange="buscarCursos(this.value)" cssClass="form-control"/>
			</s:form>
		</td>
	</tr>
	<tr>
		<td width="100px" style="vertical-align: middle;">
			CURSO
		</td>					
		<td>
			<select class="form-control" onchange="setCurso(this.value)">
				<option value="-1">[ Seleccionar ]</option>
				<s:iterator value="#session.keylstCurso">
					<option value='<s:property value="codigo" />'><s:property value="nombre"/></option>
				</s:iterator>
			</select>
		</td>
		<td style="vertical-align: middle;">
			SECCIONES ASIGNADAS AL EXAMEN
		</td>
		<td>
			<s:iterator value="#session.keylstSeccion">
				<option value='<s:property value="codigo" />'><s:property value="descripcion"/></option>
			</s:iterator>						
		</td>
	</tr>
	<s:form id="registroExamen" action="regExamen">
	<input id="idCurso" name="codcurso" hidden="hidden" />
		<tr>
			<td>FECHA DE INICIO</td>
			<td>
				<div class="form-group">
					<input type="text" name="fecini" Class="form-control fecha" readonly="readonly"/>
				</div>
			</td>
			<td>FECHA DE CULMINO</td>
			<td>
				<div class="form-group">
					<input type="text" name="fecfin" Class="form-control fecha" readonly="readonly"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>DURACION DE LA EVALUACION</td>
			<td>
				<div class="form-group">
					<input type="number" name="duracion" Class="form-control" step="30"/>
				</div>
			</td>
			<td colspan="2">
				<div class="form-group">
					<s:submit id="btnRegExa" value="REGISTRAR EXAMEN" cssClass="btn btn-primary btn-block"/>
				</div>
			</td>
		</tr>		
	</s:form>	
</table>
<hr/>
<div class="form-group" hidden="hidden" id="regPreg">
<s:form id="registroPreguntas" action="regPreguntas">
	<input name="codexamen" hidden="hidden" value="<s:property value="#session.codExamen"/>" />
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#p1">Nº 1</a></li>
		<li><a data-toggle="tab" href="#p2">Nº 2</a></li>
		<li><a data-toggle="tab" href="#p3">Nº 3</a></li>
		<li><a data-toggle="tab" href="#p4">Nº 4</a></li>
		<li><a data-toggle="tab" href="#p5">Nº 5</a></li>
		<li><a data-toggle="tab" href="#p6">Nº 6</a></li>
		<li><a data-toggle="tab" href="#p7">Nº 7</a></li>
		<li><a data-toggle="tab" href="#p8">Nº 8</a></li>
		<li><a data-toggle="tab" href="#p9">Nº 9</a></li>
		<li><a data-toggle="tab" href="#p10">Nº 10</a></li>
	</ul>
	<br/>
	<div class="tab-content">
		<div id="p1" class="form-group tab-pane fade in active">
			<s:label for="Enunciado1"><strong>Ingrese el Enunciado</strong></s:label>
			<s:textfield id="Enunciado1" name="Enunciado1" cssClass="form-control"/>
			<br/>
			<s:label><strong>Ingrese las Opciones</strong></s:label>
			<table class="table">
				<tr>
					<td><input type="radio" value="op1" name="cp1"/></td>
					<td><s:textfield id="op1" name="op1" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op2" name="cp1"/></td>
					<td><s:textfield id="op2" name="op2" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op3" name="cp1"/></td>
					<td><s:textfield id="op3" name="op3" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op4" name="cp1"/></td>
					<td><s:textfield id="op4" name="op4" cssClass="form-control"/></td>
				</tr>		
			</table>
		</div>
		<div id="p2" class="form-group tab-pane fade">
			<s:label for="Enunciado2">Ingrese el Enunciado</s:label>
			<s:textfield id="Enunciado2" name="Enunciado2" cssClass="form-control"/>
			<br/>
			<s:label><strong>Ingrese las Opciones</strong></s:label>
			<table class="table">
				<tr>
					<td><input type="radio" value="op5" name="cp2"/></td>
					<td><s:textfield id="op5" name="op5" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op6" name="cp2"/></td>
					<td><s:textfield id="op6" name="op6" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op7" name="cp2"/></td>
					<td><s:textfield id="op7" name="op7" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op8" name="cp2"/></td>
					<td><s:textfield id="op8" name="op8" cssClass="form-control"/></td>
				</tr>		
			</table>
		</div>
		<div id="p3" class="form-group tab-pane fade">
			<s:label for="Enunciado3">Ingrese el Enunciado</s:label>
			<s:textfield id="Enunciado3" name="Enunciado3" cssClass="form-control"/>
			<br/>
			<s:label><strong>Ingrese las Opciones</strong></s:label>
			<table class="table">
				<tr>
					<td><input type="radio" value="op9" name="cp3"/></td>
					<td><s:textfield id="op9" name="op9" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op10" name="cp3"/></td>
					<td><s:textfield id="op10" name="op10" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op11" name="cp3"/></td>
					<td><s:textfield id="op11" name="op11" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op12" name="cp3"/></td>
					<td><s:textfield id="op12" name="op12" cssClass="form-control"/></td>
				</tr>		
			</table>
		</div>
		<div id="p4" class="form-group tab-pane fade">
			<s:label for="Enunciado4">Ingrese el Enunciado</s:label>
			<s:textfield id="Enunciado4" name="Enunciado4" cssClass="form-control"/>
			<br/>
			<s:label><strong>Ingrese las Opciones</strong></s:label>
			<table class="table">
				<tr>
					<td><input type="radio" value="op13" name="cp4"/></td>
					<td><s:textfield id="op13" name="op13" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op14" name="cp4"/></td>
					<td><s:textfield id="op14" name="op14" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op15" name="cp4"/></td>
					<td><s:textfield id="op15" name="op15" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op16" name="cp4"/></td>
					<td><s:textfield id="op16" name="op16" cssClass="form-control"/></td>
				</tr>		
			</table>
		</div>
		<div id="p5" class="form-group tab-pane fade">
			<s:label for="Enunciado5">Ingrese el Enunciado</s:label>
			<s:textfield id="Enunciado5" name="Enunciado5" cssClass="form-control"/>
			<br/>
			<s:label><strong>Ingrese las Opciones</strong></s:label>
			<table class="table">
				<tr>
					<td><input type="radio" value="op17" name="cp5"/></td>
					<td><s:textfield id="op17" name="op17" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op18" name="cp5"/></td>
					<td><s:textfield id="op18" name="op18" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op19" name="cp5"/></td>
					<td><s:textfield id="op19" name="op19" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op20" name="cp5"/></td>
					<td><s:textfield id="op20" name="op20" cssClass="form-control"/></td>
				</tr>		
			</table>
		</div>
		<div id="p6" class="form-group tab-pane fade">
			<s:label for="Enunciado6">Ingrese el Enunciado</s:label>
			<s:textfield id="Enunciado6" name="Enunciado6" cssClass="form-control"/>
			<br/>
			<s:label><strong>Ingrese las Opciones</strong></s:label>
			<table class="table">
				<tr>
					<td><input type="radio" value="op21" name="cp6"/></td>
					<td><s:textfield id="op21" name="op21" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op22" name="cp6"/></td>
					<td><s:textfield id="op22" name="op22" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op23" name="cp6"/></td>
					<td><s:textfield id="op23" name="op23" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op24" name="cp6"/></td>
					<td><s:textfield id="op24" name="op24" cssClass="form-control"/></td>
				</tr>		
			</table>
		</div>
		<div id="p7" class="form-group tab-pane fade">
			<s:label for="Enunciado7">Ingrese el Enunciado</s:label>
			<s:textfield id="Enunciado7" name="Enunciado7" cssClass="form-control"/>
			<br/>
			<s:label><strong>Ingrese las Opciones</strong></s:label>
			<table class="table">
				<tr>
					<td><input type="radio" value="op25" name="cp7"/></td>
					<td><s:textfield id="op25" name="op25" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op26" name="cp7"/></td>
					<td><s:textfield id="op26" name="op26" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op27" name="cp7"/></td>
					<td><s:textfield id="op27" name="op27" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op28" name="cp7"/></td>
					<td><s:textfield id="op28" name="op28" cssClass="form-control"/></td>
				</tr>		
			</table>
		</div>
		<div id="p8" class="form-group tab-pane fade">
			<s:label for="Enunciado8">Ingrese el Enunciado</s:label>
			<s:textfield id="Enunciado8" name="Enunciado8" cssClass="form-control"/>
			<br/>
			<s:label><strong>Ingrese las Opciones</strong></s:label>
			<table class="table">
				<tr>
					<td><input type="radio" value="op29" name="cp8"/></td>
					<td><s:textfield id="op29" name="op29" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op30" name="cp8"/></td>
					<td><s:textfield id="op30" name="op30" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op31" name="cp8"/></td>
					<td><s:textfield id="op31" name="op31" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op32" name="cp8"/></td>
					<td><s:textfield id="op32" name="op32" cssClass="form-control"/></td>
				</tr>		
			</table>
		</div>
		<div id="p9" class="form-group tab-pane fade">
			<s:label for="Enunciado9">Ingrese el Enunciado</s:label>
			<s:textfield id="Enunciado9" name="Enunciado9" cssClass="form-control"/>
			<br/>
			<s:label><strong>Ingrese las Opciones</strong></s:label>
			<table class="table">
				<tr>
					<td><input type="radio" value="op33" name="cp9"/></td>
					<td><s:textfield id="op33" name="op33" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op34" name="cp9"/></td>
					<td><s:textfield id="op34" name="op34" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op35" name="cp9"/></td>
					<td><s:textfield id="op35" name="op35" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op36" name="cp9"/></td>
					<td><s:textfield id="op36" name="op36" cssClass="form-control"/></td>
				</tr>		
			</table>
		</div>
		<div id="p10" class="form-group tab-pane fade">
			<s:label for="Enunciado10">Ingrese el Enunciado</s:label>
			<s:textfield id="Enunciado10" name="Enunciado10" cssClass="form-control"/>
			<br/>
			<s:label><strong>Ingrese las Opciones</strong></s:label>
			<table class="table">
				<tr>
					<td><input type="radio" value="op37" name="cp10"/></td>
					<td><s:textfield id="op37" name="op37" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op38" name="cp10"/></td>
					<td><s:textfield id="op38" name="op38" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op39" name="cp10"/></td>
					<td><s:textfield id="op39" name="op39" cssClass="form-control"/></td>
				</tr>
				<tr>
					<td><input type="radio" value="op40" name="cp10"/></td>
					<td><s:textfield id="op40" name="op40" cssClass="form-control"/></td>
				</tr>		
			</table>
		</div>
	</div>	
	<hr/>	
	<br/>
	<div class="form-group">
		<s:submit value="REGISTRAR PREGUNTAS Y OPCIONES" cssClass="btn btn-primary btn-block"/>
	</div>	
</s:form>
</div>	

