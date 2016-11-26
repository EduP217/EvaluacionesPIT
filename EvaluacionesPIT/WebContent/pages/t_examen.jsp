<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<script type="text/javascript">

	function listarCursos(codciclo) {
		$.ajax({
            url: "<s:url action='listarCursos?codciclo="+codciclo+"'/>",          
        }).done(function(result) {
            $("#listaCurso").html(result);
        });
		/*$.ajax({
			type : 'POST',
			url : 'listarCursos?codciclo=' + $("#idciclo").val(),
			dataType : 'json',
			success : function(data) {
				$('#listaCurso').append(data);
			}
		});*/
		//window.location="listarCursos?codciclo="+$("#idciclo").val();
	}
	$(document).ready(function() {

	});
</script>

<s:form>
<table class="table" style="text-align: center;">
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
			<s:form action="listarCursos">
			<s:select 
				name="curso.codciclo"
				id="idciclo"
				list="lstCiclo"
				listKey="codigo"
				listValue="datos"
				headerKey="-1"
				headerValue="[ Seleccionar ]"
				onchange="listarCursos(this.value)" cssClass="form-control"/>
			</s:form>
		</td>
	</tr>
	<tr>
		<td width="100px">
			CURSO
		</td>					
		<td>
			<!--s:select 
				name="curso.codigo"
				id="idcurso"
				list="lstCurso"
				listKey="codigo"
				listValue="datos"
				cssClass="form-control"/-->
			<select class="form-control">
				<option value="-1">[ Seleccionar ]</option>
				<s:iterator value="lstCurso">
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
		<td colspan="2">
			LISTA DE SECCIONES QUE RENDIRAN EL EXAMEN
		</td>
		<td>
		</td>
	</tr>
</table>
</s:form>
