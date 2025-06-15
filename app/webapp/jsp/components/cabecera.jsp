<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />

<style>
	#ver{
		background-image: url("${pageContext.request.contextPath}/images/cibertec/bg-banner-2.jpg");
		background-repeat: no-repeat;
		width:100%;
		height: 80px;
		max-width:100%;
		max-height: 100%;
		margin: 0 auto;
		padding-top: 14px;
	}
	#tableAvatar{
		float: right;
		margin-right: 2%;
		font-family: 'Gloria Hallelujah', cursive;
	}
	.userAvatar{
	    height: 60px;
	    width: 60px;
	    background-repeat: no-repeat;
		background-position: 50%;
		border: 2px solid;
		border-radius: 50%;
		border-color: white;
		background-size: 100% auto;
	}
	.chip {
	    display: inline-block;
	    padding: 0 25px;
	    height: 50px;
	    line-height: 50px;
	    border-radius: 25px;
	    background-color: #f1f1f1;
	}
	.btnContainer {
	    position: relative;
	    z-index: 2;
	}
	#foto {
	    height: 35px;
	    width: 35px;
	    border-radius: 50%;
	}
	
	.dropbtn {
	    text-align: center;
	    text-decoration: none;
	    height: 50px;	    
		text-transform: capitalize;
		background-color: transparent !important;
	    padding: 0;
	    position: relative;
    	min-width: 135px;
	}
	.dropdown-content {
	    display: none;
	    position: absolute;
	    background-color: #f1f1f1;
    	box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.2);
	    z-index: 1;
    	width: 100%;
	    border-radius: 0px 0px 9px 9px;
	    left: 0;
	    padding-top: 24px;
	    bottom: -100px;
	}
	
	.dropdown-content a {
	    color: black;
	    text-decoration: none;
	    padding: 0;
	    display: block;
	    text-align: left;
    	padding-left: 10px;
	}	
	.dropdown-content a:hover {
		background-color: #f9f9f9;
	}
	.dropdown-content a:last-child:hover {
	    border-radius: 0px 0px 9px 9px;
	}
	.dropdown:hover .dropdown-content {
	    display: block;
	}	
</style>
<div id="ver">
	<div style="position: absolute;margin:-8px 0 0 15px;">
		<img src="${pageContext.request.contextPath}/images/cibertec/logo_Cibertec_02.png" width="250" />
	</div>
	<table id="tableAvatar">
		<tr>
			<td>
				<div class="dropdown chip">
					<div class="btnContainer">
						<img src="${pageContext.request.contextPath}/images/users/${sessionScope.user.imagenURL}" id="foto">
						<button class="btn dropbtn" type="button" id="menu1" data-toggle="dropdown">					    
							<s:property value="#session.user.persona.apellidos+' '+#session.user.persona.nombres" />
				    		<span class="caret"></span>
				    	</button>
					</div>
				    <div class="dropdown-content">				    	
				    	<a href="" style="color:black;">
				    		<img src="${pageContext.request.contextPath}/images/cibertec/tuerca-icon.png" width="30" height="20" style="padding-right: 10px;" />Configuración</a>
				    	<a href="${pageContext.request.contextPath}/cerrarSesion" style="color:black;">
							<img src="${pageContext.request.contextPath}/images/cibertec/exit.png" width="30" height="20" style="padding-right: 10px;"/>Salir</a>
					</div>
				</div>								
			</td>
		</tr>
	</table>
</div>