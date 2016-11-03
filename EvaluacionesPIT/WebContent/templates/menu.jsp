<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<style>
#access{
	text-transform: uppercase;
	margin: 0 auto;
	z-index: 1000;
}
</style>

<div class="seventeen columns">
	<!-- nav id="access" class="access" role="navigation">
		<div id="menu" class="menu">
			<ul>
				<li><a class="selected">
					<img src="${pageContext.request.contextPath}/images/cibertec/menu_icon.png" width="10" height="10" /></a>
				</li>
				<s:iterator value="#session.keyPermisos">
					<li><a href="${pageContext.request.contextPath}/<s:property value="enlace"/>">
					<s:property value="descripcion"/></a></li>
				</s:iterator>
			</ul>
		</div>
	</nav-->
	<nav class="navbar navbar-inverse" id="access" role="navigation">
	    <ul class="nav navbar-nav">
	      	<li class="active">
	      		<a href="#"><img src="${pageContext.request.contextPath}/images/cibertec/menu_icon.png" width="20" height="20" /></a>
	      	</li>
	      	<li class="dropdown">
		    	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Evaluaciones <span class="caret"></span></a>
		        <div class="dropdown-content">	
			      	<s:iterator value="#session.keyPermisosT">			      					      				      	
						<a href="${pageContext.request.contextPath}/<s:property value="enlace"/>">
						<s:property value="descripcion"/></a>
					</s:iterator>
		    	</div>
		   	</li>
	      	<li class="dropdown">
		    	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Consultas <span class="caret"></span></a>
		        <div class="dropdown-content">	
			      	<s:iterator value="#session.keyPermisosC">			      					      				      	
						<a href="${pageContext.request.contextPath}/<s:property value="enlace"/>">
						<s:property value="descripcion"/></a>
					</s:iterator>
		    	</div>
		   	</li>
	      	<li class="dropdown">
		    	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Mantenimiento <span class="caret"></span></a>
		        <div class="dropdown-content">	
			      	<s:iterator value="#session.keyPermisosM">			      					      				      	
						<a href="${pageContext.request.contextPath}/<s:property value="enlace"/>">
						<s:property value="descripcion"/></a>
					</s:iterator>
		    	</div>
		   	</li>
	    </ul>
	</nav>
</div>
