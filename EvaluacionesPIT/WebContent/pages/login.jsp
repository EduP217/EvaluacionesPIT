<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Admin Template">
<meta name="author" content="GSCREATIVAS">

</head>
<body>
	<div class="wrapper-page">
		<div class="panel panel-color panel-primary panel-pages">
			<div class="panel-heading bg-img">
				<div class="bg-overlay"></div>
				<h2 class="text-center m-t-10 text-white">
					<strong>CIBERTEC | SISTEMA DE CONTROL DE EVALUACIONES</strong>
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
					<div class="form-group m-t-30"></div>
				</s:form>
			</div>
		</div>
	</div>
</body>
</html>