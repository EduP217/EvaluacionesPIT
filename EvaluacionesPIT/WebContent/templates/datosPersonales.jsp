<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<style>
.datosPersonales {
	width : 100%;
	height: auto;
	font-family: 'Gloria Hallelujah', cursive;
}
.userAvatarMain {
	/* cambia estos dos valores para definir el tamaño de tu círculo */
	height: 300px;
	width: 300px;
	/* los siguientes valores son independientes del tamaño del círculo */
	background-repeat: no-repeat;
	background-position: 50%;
	border-radius: 50%;
	background-size: 100% auto;
}
</style>
<div class="datosPersonales">
	<table class="table">
		<tr>
			<td colspan="2" align="center">
				<div class="userAvatarMain" 
						style="background-image: url('${pageContext.request.contextPath}/images/<s:property value="#session.keyUsuario.urlFoto"/>');"></div>
				
			</td>
		</tr>
		<tr>
			<td><s:property value="#session.keyDatosUsuario.apellido" /></td>
			<td><s:property value="#session.keyDatosUsuario.nombre" /></td>			
		</tr>
		<tr>
			<td><s:property value="#session.keyDatosUsuario.fechanac" /></td>
			<td><s:property value="#session.keyUsuario.perfil" /></td>
		</tr>
		<tr>
			<td colspan="2"><s:property value="#session.keyUsuario.estado" /></td>
		</tr>
	</table>
</div>