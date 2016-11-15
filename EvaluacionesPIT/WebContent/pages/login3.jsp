<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<s:form id="idLogin" cssClass="form-horizontal m-t-20" action="IniciarSesion" method="POST">
	<div class="form-group ">
		<div class="col-xs-12">
			<s:textfield name="usuario" cssClass="form-control input-lg"
				placeholder="Usuario"></s:textfield>
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-12">
			<s:password name="clave" cssClass="form-control input-lg"
				placeholder="Password"></s:password>
		</div>
	</div>
	<div class="form-group ">
		<div class="col-xs-12">
			<div class="checkbox checkbox-primary"></div>
		</div>
	</div>
	<div class="form-group text-center m-t-40">
		<div class="col-xs-12">
			<button class="btn btn-primary btn-lg w-lg waves-effect waves-light"
				type="submit">INGRESAR</button>
		</div>
	</div>
	<div class="form-group m-t-30"></div>
</s:form>