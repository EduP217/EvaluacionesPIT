<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<style>
	#ver{
		background-image: url("images/big/cabecera1.png");
		width:100%;
		max-width:100%;
		max-height: 100%;
		height: 150px;
		background-repeat: no-repeat;
		margin: 0 auto;
		text-align: right;
		padding-top: 70px;
	}

</style>
<div id="ver">
 <img src="images/big/sesion.png"/>
 Código:<s:property value="#session.keyUsuario.email"/>
 <a href="${pageContext.request.contextPath}/CerrarSesion"><img src="images/big/cerrar2.png"/>Salir</a>
</div>