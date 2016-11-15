<?xml version="1.0" encoding="utf-8"?>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Sistema de Control de Evaluaciones | CIBERTEC</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />	
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ico-educacion.ico"/>
	<!-- animate css -->
	<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet" />
	<!-- Waves-effect -->
	<link href="${pageContext.request.contextPath}/css/waves-effect.css" rel="stylesheet"/>
	<!-- Custom Files -->
	<link href="${pageContext.request.contextPath}/css/helper.css" rel="stylesheet" type="text/css" />
	<!-- ESTE STYLE ES UNA COPIA DEL STYLE.CSS PERO SIN LOS ASPECTOS PARA EL MODAL -->
	<link href="${pageContext.request.contextPath}/css/style3.css" rel="stylesheet" type="text/css" />
    
<style type="text/css">
.modal-footer {
	border-top: 0px;
}
.modal-header {
	background-image: url("${pageContext.request.contextPath}/images/small/bg.jpg");
	color: white;
	height: 160px;
	padding: 5%;
}
#idmodal{
	width: 30% !important;
}
body{
	background-image: url("${pageContext.request.contextPath}/images/big/Salon.png");
}
</style>
	
<script type="text/javascript">
function loadModal(){
	$("#myModal").modal("show");
}
</script>
</head>
<body onload="loadModal()">
	<!--login modal-->
	<div class="modal fade" id="myModal" role="dialog"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" id="idmodal">
			<div class="modal-content">

				<!-- Header Section -->
				<div class="modal-header">
					<tiles:insertAttribute name="modal-header" />
				</div>

				<!-- Body Section -->
				<div class="modal-body">
					<tiles:insertAttribute name="central" />
				</div>

				<!-- Footer Section -->
				<div class="modal-footer">
					<tiles:insertAttribute name="modal-footer" />
				</div>

			</div>
		</div>
	</div>	
</body>
</html>