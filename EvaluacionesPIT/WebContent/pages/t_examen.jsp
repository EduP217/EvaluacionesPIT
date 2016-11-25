<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<script type="text/javascript">
$(document).ready( function() {
	
});
</script>
<s:form>
<table style="text-align: center;">
	<tr>
		<td width="100px">
			CARRERA			
		</td>
		<td width="250px">
			<s:select 
				name="curso.codcarrera"
				list="lstCarrera"
				listKey="codigo"
				listValue="datos" cssClass="form-control"/>
		</td>
		<td width="100px">
			CICLO
		</td>
		<td width="150px">
			<s:select 
				name="curso.codciclo"
				id="idciclo"
				list="lstCiclo"
				listKey="codigo"
				listValue="datos"
				headerKey="-1"
				headerValue="[Seleccione]" cssClass="form-control"/>
		</td>
	</tr>
	<tr>
		<td>
			CURSO
		</td>
		<td colspan="3">
		</td>		
	</tr>
	<tr>
		<td colspan="2">
			LISTA DE SECCIONES QUE RENDIRAN EL EXAMEN
		</td>
		<td>
		</td>
	</tr>
</table>
</s:form>
