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
	div.userAvatar{		
		/* cambia estos dos valores para definir el tamaño de tu círculo */
	    height: 50px;
	    width: 50px;
	    /*margin-left:80%;*/
	    /* los siguientes valores son independientes del tamaño del círculo */
	    background-repeat: no-repeat;
	    background-position: 50%;
	    border-radius: 50%;
	    background-size: 100% auto;
	}
	ul {
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	    overflow: hidden;
	    background-color: #333;
	}
	
	li {
	    float: left;
	}
	
	.dropbtn {
	    text-align: center;
	    text-decoration: none;
	    height: 50px;
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
	<table style="float: right;margin-right: 3%;">
		<tr>
			<td>
				
			</td>
			<td>
				<div class="userAvatar"
					style="background-image: url('${pageContext.request.contextPath}/images/users/avatar-6.jpg');"></div>
			</td>
			<td>
				<div class="dropdown">					
					<button class="btn dropdown-toggle dropbtn" type="button" id="menu1" data-toggle="dropdown">					    
						<s:property value="#session.keyUsuario.email" />
				    	<span class="caret"></span>
				    </button>
				    <ul class="dropdown-content">
				    	<li>
				    		<a>
				    		<img src="${pageContext.request.contextPath}/images/cibertec/tuerca-icon.png" width="20" height="20" />
				    		Configuración</a>
				    	</li>				    
				    	<li>
					    	<a href="${pageContext.request.contextPath}/CerrarSesion">
							<img src="${pageContext.request.contextPath}/images/cibertec/exit.png" width="20" height="20" />
							Salir</a>
					  	</li>
				    </ul>
				</div>				
			</td>
		</tr>
	</table>
</div>