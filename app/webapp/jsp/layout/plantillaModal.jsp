<?xml version="1.0" encoding="utf-8"?>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		
		<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/css/animate.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/css/waves-effect.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/assets/css/helper.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/assets/css/style3.css" rel="stylesheet" type="text/css" />
		
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ico-educacion.ico"/>
		<title>Sistema de Control de Evaluaciones | CIBERTEC</title>
		    
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
	</head>
	<body onload="loadModal()">
		<!--login modal-->
		<div class="modal fade" id="templateModal" role="dialog"
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
		
		<script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			function loadModal(){
				$("#templateModal").modal("show");
			}
		</script>
	</body>
</html>