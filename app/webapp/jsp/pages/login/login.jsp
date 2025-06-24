<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<s:form id="idLogin" cssClass="form-horizontal m-t-20" action="iniciarSesion" method="POST">
	<div class="form-group ">
		<div class="col-xs-12">
			<label for="inputUsuario" class="form-label">Usuario:</label>
			<s:textfield id="inputUsuario" name="usuario" cssClass="form-control input-md" placeholder="Ingresa tu usuario"></s:textfield>
		</div>
	</div>

	<div class="form-group">
		<div class="col-xs-12">
			<label for="inputClave" class="form-label">Contraseña:</label>
			<s:password id="inputClave" name="clave" cssClass="form-control input-md" placeholder="Ingresa tu Contraseña"></s:password>
		</div>
	</div>

	<div class="form-group">
		<div class="col-xs-12">
			<label for="recordarUsuario" class="form-label m-t-10">
				<input type="checkbox" id="recordarUsuario" name="recordarUsuario" />
				Deseo recordar el usuario
			</label>
		</div>
	</div>

	<div class="form-group text-center m-t-40">
		<div class="col-xs-12">
			<button class="btn btn-primary btn-lg w-lg waves-effect waves-light" type="submit">Ingresar</button>
		</div>
	</div>
	<div class="form-group m-t-30"></div>
</s:form>