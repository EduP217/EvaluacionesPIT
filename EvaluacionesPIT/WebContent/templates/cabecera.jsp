<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />

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
		/* cambia estos dos valores para definir el tama�o de tu c�rculo */
	    height: 60px;
	    width: 60px;
	    /* los siguientes valores son independientes del tama�o del c�rculo */
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
	#foto {
	    float: left;
	    margin: -11px 10px 0 -30px;
	    height: 63px;
	    width: 63px;
	    border-radius: 50%;
	}
	
	.dropbtn {
	    text-align: center;
	    text-decoration: none;
	    height: 50px;	    
		text-transform: capitalize;
		background-color: transparent !important;
	}
	.dropdown-content {
	    display: none;
	    position: absolute;
	    min-width: 160px;
	    background-color: #f9f9f9;
	    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	    z-index: 2000;
	}
	
	.dropdown-content a {
	    color: black;
	    text-decoration: none;
	    padding: 15px;
	    display: block;
	    text-align: left;
	    width: 220px;
	}	
	.dropdown-content a:hover {
		background-color: #f1f1f1;
	    min-width: 160px;
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
					<img src="${pageContext.request.contextPath}/images/${sessionScope.keyUsuario.urlFoto}" id="foto">
					<button class="btn dropbtn" type="button" id="menu1" data-toggle="dropdown">					    
						<s:property value="#session.keyDatosUsuario.apellido+' '+#session.keyDatosUsuario.nombre" />
			    		<span class="caret"></span>
			    	</button>
				    <div class="dropdown-content">				    	
				    	<a href="" style="color:black;">
				    		<img src="${pageContext.request.contextPath}/images/cibertec/tuerca-icon.png" width="30" height="20" style="padding-right: 10px;" />Configuraci�n</a>
				    	<a href="${pageContext.request.contextPath}/CerrarSesion" style="color:black;">
							<img src="${pageContext.request.contextPath}/images/cibertec/exit.png" width="30" height="20" style="padding-right: 10px;"/>Salir</a>
					</div>
				</div>								
			</td>
		</tr>
	</table>
</div>