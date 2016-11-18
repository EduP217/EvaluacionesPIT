<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<style>
.datosPersonales {
	width : 100%;
	height: auto;
	font-family: 'Gloria Hallelujah', cursive;
	text-shadow: -2px -2px 1px #fff, 2px 2px 1px #fff, -2px 2px 1px #fff, 2px -2px 1px #fff;
}
.userAvatarMain {
	/* cambia estos dos valores para definir el tamaño de tu círculo */
	height: 300px;
	width: 300px;
	/* los siguientes valores son independientes del tamaño del círculo */
	background-repeat: no-repeat;
	background-position: 50%;
	border: 3px solid;
	border-radius: 50%;
	border-color: white;
	background-size: 100% auto;
}
</style>
<div class="datosPersonales">
	<table class="table table-hover">
		<tr>
			<td colspan="2" align="center">
				<div class="userAvatarMain" 
						style="background-image: url('${pageContext.request.contextPath}/images/<s:property value="#session.keyUsuario.urlFoto"/>');"></div>
				
			</td>
		</tr>
		<tr>
			<td align="center"><s:property value="#session.keyDatosUsuario.apellido" /></td>
			<td align="center"><s:property value="#session.keyDatosUsuario.nombre" /></td>			
		</tr>
		<tr>
			<td align="center"><s:property value="#session.keyDatosUsuario.fechanac" /></td>
			<td align="center"><s:property value="#session.keyUsuario.perfil" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">Estado : <s:property value="#session.keyUsuario.estado" /></td>
		</tr>
	</table>
</div>