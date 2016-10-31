<?xml version="1.0" encoding="utf-8"?>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>ss</title>	
<sj:head locale="es" jqueryui="true" jquerytheme="south-street"/>
<script type="text/javascript">
var x=window.history.length; 
if (window.history[x]!=window.location) 
{ 
    window.history.forward(); 
} 
</script>	

        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon_1.ico"/>

        <!-- Base Css Files -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Font Icons -->
        <link href="${pageContext.request.contextPath}/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/ionicon/css/ionicons.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/material-design-iconic-font.min.css" rel="stylesheet"/>

        <!-- animate css -->
        <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet" />

        <!-- Waves-effect -->
        <link href="${pageContext.request.contextPath}/css/waves-effect.css" rel="stylesheet"/>

        <!-- Custom Files -->
        <link href="${pageContext.request.contextPath}/css/helper.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        <script src="${pageContext.request.contextPath}/js/modernizr.min.js"></script>
<STYLE type="text/css">
#contenedor{
	width:90%;
	height:100%;
	/*margin:0 auto;	*/
	margin-top:15px;
	margin-left:15%;
	margin-right:15%;
}
header{
	background:white;
	text-align:center;
	height:100%;
}

#centro{
	background:white;
	float:left;
	/*max-width:100%;*/
	padding:10px;
	width:33%;
	height:450px;
	text-align:center;
	box-sizing:border-box
}

footer{
	clear:both;
	background:#000;
	text-align:center;
	height:45px;
}



</STYLE>
</head>
<body>
    	<header>
        	
        </header>
    	<section id="info">
    		 <div id="idCentralConMenu">
    		 	<tiles:insertAttribute name="central"/>
    		 </div>
        </section>
<script>

            var resizefunc = [];
        </script>
    	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/waves.js"></script>
        <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.scrollTo.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/jquery-detectmobile/detect.js"></script>
        <script src="${pageContext.request.contextPath}/assets/fastclick/fastclick.js"></script>
        <script src="${pageContext.request.contextPath}/assets/jquery-slimscroll/jquery.slimscroll.js"></script>
        <script src="${pageContext.request.contextPath}/assets/jquery-blockui/jquery.blockUI.js"></script>


        <!-- CUSTOM JS -->
        <script src="${pageContext.request.contextPath}/js/jquery.app.js"></script>
</body>
</html>