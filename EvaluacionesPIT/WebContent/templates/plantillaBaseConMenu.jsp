<?xml version="1.0" encoding="utf-8"?>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Sistema de Control de Evaluaciones | CIBERTEC</title>
<sj:head jqueryui="true"  jquerytheme="blitzer"/>
<script type="text/javascript">
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ico-educacion.ico" />
<!-- Base Css Files -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/fileinput.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<!-- Font Icons -->
<link href="https://fonts.googleapis.com/css?family=Gloria+Hallelujah"	rel="stylesheet">
<!-- animate css -->
<link href="${pageContext.request.contextPath}/css/animate.css"	rel="stylesheet" />
<!-- Waves-effect -->
<link href="${pageContext.request.contextPath}/css/waves-effect.css"	rel="stylesheet" />
<!-- Custom Files -->


<STYLE type="text/css">
#contenedor{
	width:95%;
	height:auto;
	margin:0 auto;
	margin-top:10px;
	background-color:hsla(360, 100%, 100%, 0.31);
}
header{
	background:white;
	text-align:center;
	height:100%;
}

body{
	background-image: url("${pageContext.request.contextPath}/images/big/Salon.png");	
}

footer{
	clear:both;
	background:#000;
	text-align:center;
	height:45px;
	padding-top: 10px;
	color: white;
}
#idMenu{
	width: 400px;
	margin-right: 50px;
}
#idDatosUsuario{
	width: 375px;
	margin-top:-25px;
}
#idCentralConMenu{
	width: 110%;
	height: 700px;
	margin-left: -50px;
}

</STYLE>
</head>
<body>
	<section id="contenedor">
    	<header>
        	<tiles:insertAttribute name="cabecera"/>
        </header>        
        <section>
        	<table>
        	<tr>
        		<td>
			        <div id="idMenu">
			        	<tiles:insertAttribute name="menu"/>
			        </div>
	        	</td>
	        	<td rowspan="2">
			    	<div id="idCentralConMenu">
			    		<tiles:insertAttribute name="central"/>
			    	</div>
			    </td>
	        </tr>
	        <tr>
	        	<td>
			        <div id="idDatosUsuario">
			        	<tiles:insertAttribute name="datospersonales"/>
			        </div>
			   	</td>
	    	</tr>
	    	</table>
        </section>
        <footer>
        		Derechos Reservados - 
        		Cibertec 2016
        </footer>        
    </section>
	<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>	
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrapValidator.js"></script>
	<script src="${pageContext.request.contextPath}/js/fileinput.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/locales/bootstrap-datepicker.es.min.js"></script>
</body>
</html>





















