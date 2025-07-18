<?xml version="1.0" encoding="utf-8"?>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/jsp/layout/baseHeader.jsp" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/file/fileinput.min.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plantillaBaseConMenu.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cabecera.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/menu.css"/>
		
		<style type="text/css">
			<tiles:insertAttribute name="extraCSS" ignore="true" />
		</style>
		
		<style type="text/css">
			div.backgroundImage {
				background-image: url("${pageContext.request.contextPath}/images/big/Salon.png");
			}
			div#cabeceraContainer{
				background-image: url("${pageContext.request.contextPath}/images/cibertec/bg-banner-2.jpg");
			}
		</style>
	</head>
	<body>
		<div class="backgroundImage"></div>
		<section id="contenedor">
	    	<header>
	        	<tiles:insertAttribute name="cabecera"/>
	        </header>
	        <main>        
		        <div class="flex-container">
		        	<div id="idMenu">
			        	<tiles:insertAttribute name="menu"/>
			        </div>
			        <div id="idCentralConMenu">
			    		<tiles:insertAttribute name="central"/>
			    	</div>
		        </div>
	        </main>
	        <footer>
	        		Derechos Reservados | Cibertec 2016
	        </footer>        
	    </section>
	    
		<jsp:include page="/jsp/layout/baseFooter.jsp" />
		<script src="${pageContext.request.contextPath}/assets/js/fileinput.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datepicker.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/locales/bootstrap-datepicker.es.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/menu.js"></script>
		<script type="text/javascript">
			<tiles:insertAttribute name="extraJS" ignore="true" />
		</script>
	</body>
</html>





















