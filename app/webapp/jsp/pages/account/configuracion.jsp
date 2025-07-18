<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/account.css"/>
		
<div class="datosPersonales">
	<h1 class="border-bottom">Configuración de Cuenta</h1>
	<s:form id="formConfiguracionCuenta" enctype="multipart/form-data" action="guardar-configuracion-cuenta" method="post" 
		cssClass="form-horizontal text-right">
		<div class="col-md-5">
			<input type="hidden" id="avatarDeUsuarioFilename" value="${session.user.imagenURL}" />
			<input type="file" name="avatarDeUsuario.file" id="usuarioAvatar" accept="image/*"/>
			<div id="avatarDeUsuario-errors"></div>
		</div>
		<div class="col-md-7">
			<div class="form-group">
				<label for="usuarioIdentificador" class="col-sm-4">Nro. Identificador</label>
				<div class="col-sm-8">
					<s:textfield id="usuarioIdentificador" name="datosDeUsuario.persona.identificador" value="%{#session.user.persona.identificador}" 
						cssClass="form-control input-md" placeholder="Identificador" disabled="true"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<label for="personaApellidos" class="col-sm-4">Apellidos</label>
				<div class="col-sm-8">
					<s:textfield id="personaApellidos" name="datosDeUsuario.persona.apellidos" value="%{#session.user.persona.apellidos}" 
						cssClass="form-control input-md" placeholder="Apellidos"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<label for="personaNombres" class="col-sm-4">Nombres</label>
				<div class="col-sm-8">
					<s:textfield id="personaNombres" name="datosDeUsuario.persona.nombres" value="%{#session.user.persona.nombres}"
						cssClass="form-control input-md" placeholder="Nombres"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<label for="personaFechaNacimiento" class="col-sm-4">Fecha de Nacimiento</label>
				<div class="col-sm-8">
					<s:textfield id="personaFechaNacimiento" name="datosDeUsuario.persona.fechaNacimiento" value="%{#session.user.persona.fechaNacimiento}" 
						cssClass="form-control input-md" placeholder="Fecha de Nacimiento"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<label for="personaTelefono" class="col-sm-4">Teléfono</label>
				<div class="col-sm-8">
					<s:textfield id="personaTelefono" name="datosDeUsuario.persona.telefono" value="%{#session.user.persona.telefono}" 
						cssClass="form-control input-md" placeholder="Teléfono"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<label for="usuarioEstado" class="col-sm-4">Estado</label>
				<div class="col-sm-8">
					<s:textfield id="usuarioEstado" name="datosDeUsuario.estado.estado" value="%{#session.user.estado.estado}" 
						cssClass="form-control input-md" placeholder="Estado" disabled="true"></s:textfield>
				</div>
			</div>
					
			<div class="form-group">
				<label for="usuarioUsuario" class="col-sm-4">Usuario</label>
				<div class="col-sm-8">
					<s:textfield id="usuarioUsuario" name="datosDeUsuario.usuario" value="%{#session.user.usuario}" 
						cssClass="form-control input-md" placeholder="Ingresa tu usuario"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<label for="usuarioPassword" class="col-sm-4">Contraseña</label>
				<div class="col-sm-8">
					<s:textfield id="usuarioPassword" cssClass="form-control input-md" value="************" 
						placeholder="Ingresa tu Contraseña" disabled="true"></s:textfield>
				</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
	      			<button type="submit" class="btn btn-default">Guardar Configuración</button>
	    		</div>
	  		</div>
		</div>
  		<div class="clearfix"></div>
	</s:form>
</div>
