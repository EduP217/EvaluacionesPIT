<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<script type="text/javascript">
function buscarCursos(valor) {
	document.idFormCiclo.submit();
}
function setCurso(valor){
	$('#idCurso').val(valor);
}
$(document).ready(function() {
	
});
</script>

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
		<td>
		</td>
		<td>
		</td>	
	</tr>
	<tr>
		<td colspan="2" style="vertical-align: middle;">
			LISTA DE SECCIONES QUE RENDIRAN EL EXAMEN
		</td>
		<td>
			<s:iterator value="#session.keylstSeccion">
				<option value='<s:property value="codigo" />'><s:property value="descripcion"/></option>
			</s:iterator>						
		</td>
	</tr>
</table>

<s:form>
	<input id="idCurso" name="codcurso" />
	ENUNCIADO 
	
	INGRESAR 10 PREGUNTAS, 4 OPCIONES POR PREGUNTA.
	<s:submit value="REGISTRAR EXAMEN"/>
</s:form>
