<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<style>
.datosPersonales {
	width : 100%;
	height: auto;
	font-family: 'Gloria Hallelujah', cursive;
	font-size: 20px;
	text-transform: capitalize;
}
.texto{	
	text-shadow: -2px -2px 1px #fff, 2px 2px 1px #fff, -2px 2px 1px #fff, 2px -2px 1px #fff;
}
/*.userAvatarMain {
	/* cambia estos dos valores para definir el tamaño de tu círculo 
	height: 300px;
	width: 300px;
	/* los siguientes valores son independientes del tamaño del círculo 
	background-repeat: no-repeat;
	background-position: 50%;
	border: 3px solid;
	border-radius: 50%;
	border-color: white;
	background-size: 100% auto;
}*/
</style>
<script type="text/javascript">
$(document).ready( function() {
	$("#avatar").fileinput({
	    browseClass: "btn btn-primary",
	    allowedFileExtensions: ["jpg", "png"],
	    maxImageWidth: 1000,
	    maxImageHeight: 1000,
	    showCaption: false,
	    showClose: false,
	    showDelete: false,
	    showZoom: false,
	    browseLabel: '',
	    removeLabel: '',
	    uploadLabel: '',
	    browseIcon: '<i><img src="${pageContext.request.contextPath}/img/folder-open-solid.png" width="18px"/></i>',
	    removeIcon: '<i><img src="${pageContext.request.contextPath}/img/trash_icon.png" width="20px"/></i>',
	    uploadIcon: '<i><img src="${pageContext.request.contextPath}/img/cloud_upload.png" width="20px"/></i>',
	    defaultPreviewContent: '<img src="<s:property value="#session.keyUsuario.urlFoto" />" style="width:100%" />'
	});
});
</script>
<div class="datosPersonales">
	<table class="table table-bordered">
		<tr>
			<td colspan="2" align="center">
			<s:form method="post" enctype="multipart/form-data" action="modAvatar">
				<input name="objUsuario.codigo" value="<s:property value="#session.keyUsuario.codigo" />" hidden="true" />
				<input name="objUsuario.usuario" value="<s:property value="#session.keyUsuario.usuario" />" hidden="true" />
				<div>
					<input type="file" name="objUsuario.Foto" id="avatar" accept="image/*"/>
				</div>
				<!--div class="userAvatarMain" 
					 style="background-image: url('${pageContext.request.contextPath}/<s:property value="#session.keyUsuario.urlFoto"/>');"></div-->		
			</s:form>
			</td>
		</tr>
		<tr class="texto">
			<td align="center"><s:property value="#session.keyDatosUsuario.apellido" /></td>
			<td align="center"><s:property value="#session.keyDatosUsuario.nombre" /></td>			
		</tr>
		<tr class="texto">
			<td align="center"><s:property value="#session.keyDatosUsuario.fechanac" /></td>
			<td align="center"><s:property value="#session.keyUsuario.perfil" /></td>
		</tr>
		<tr class="texto">
			<td colspan="2" align="center">Estado : <s:property value="#session.keyUsuario.estado" /></td>
		</tr>
	</table>
</div>