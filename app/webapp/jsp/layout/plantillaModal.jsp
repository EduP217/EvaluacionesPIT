<?xml version="1.0" encoding="utf-8"?>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/jsp/layout/baseHeader.jsp" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plantillaModal.css" type="text/css" />
		    
		<style type="text/css">
			div#templateModal div.modal-header {
				background-image: url("${pageContext.request.contextPath}/images/small/student_banner.jpg");
			}
			div.backgroundImage {
				background-image: url("${pageContext.request.contextPath}/images/big/Salon.png");
			}
		</style>
	</head>
	<body onload="loadModal()">
		<div class="backgroundImage"></div>
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
						<tiles:insertAttribute name="modal-body" />
					</div>
	
					<!-- Footer Section -->
					<div class="modal-footer">
						<tiles:insertAttribute name="modal-footer" />
					</div>
	
				</div>
			</div>
		</div>
		
		<jsp:include page="/jsp/layout/baseFooter.jsp" />
		<script type="text/javascript">
			function loadModal(){
				$("#templateModal").modal("show");
			}
		</script>
	</body>
</html>