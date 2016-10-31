<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<div class="seventeen columns">
	<nav id="access" class="access" role="navigation">
		<div id="menu" class="menu">
			<ul id="tiny">
				<li><a href="index.html" class="selected">Inicio</a></li>
				<s:iterator value="#session.keyPermisos">				
					<li>
						<a href="${pageContext.request.contextPath}/<s:property value="enlace"/>">
						<s:property value="descripcion"/></a>
					</li>
				</s:iterator>
			</ul>
		</div>
	</nav>
</div>