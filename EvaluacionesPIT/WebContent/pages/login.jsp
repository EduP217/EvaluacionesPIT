<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Admin Template">
<meta name="author" content="CIBERTEC">
    
<style type="text/css">
body{
	background-image: url("${pageContext.request.contextPath}/images/big/Salon.png");
}
</style>

</head>
<body>
	<div class="wrapper-page">
		<div class="panel panel-color panel-primary panel-pages">
			<div class="panel-heading bg-img">
				<h2 class="text-center m-t-10 text-white">
					<strong>SISTEMA DE CONTROL DE EVALUACIONES | CIBERTEC </strong>
				</h2>
			</div>
			<div class="panel-body">			
				<s:form id="idLogin" cssClass="form-horizontal m-t-20" action="IniciarSesion" method="POST">
					<div class="form-group ">
						<div class="col-xs-12">
							<s:textfield name="usuario" cssClass="form-control input-lg" placeholder="Usuario"></s:textfield>
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-12">
							<s:password name="clave" cssClass="form-control input-lg" placeholder="Password"></s:password>
						</div>
					</div>

					<div class="form-group ">
						<div class="col-xs-12">
							<div class="checkbox checkbox-primary"></div>
						</div>
					</div>

					<div class="form-group text-center m-t-40">
						<div class="col-xs-12">
							<button class="btn btn-primary btn-lg w-lg waves-effect waves-light" type="submit">INGRESAR</button>
						</div>
					</div>
					<div class="form-group m-t-40"></div>
				</s:form>				
			</div>
			<div class="panel-footer">
				<div class="col-xs-12" style="margin-top: -20px;">
					<span class="pull-left"><a href="#">¿Olvidé mi contraseña?</a></span>
					<span class="pull-right"><a href="#">Registrar</a></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>