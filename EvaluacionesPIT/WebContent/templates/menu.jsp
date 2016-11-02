<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<style>		
	li.dropdown {
	    display: inline-block;
	}
	.dropdown-content {
	    display: none;
	    position: absolute;
	    min-width: 160px;
	    background-color: #f9f9f9;
	    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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

<div class="seventeen columns">
	<nav id="access" class="access" role="navigation">
		<div id="menu" class="menu">
			<ul id="tiny">
				<li><a class="selected">
					<img src="${pageContext.request.contextPath}/images/mainmenu-home-icon.png" width="20" height="20" /></a>
				</li>
				<li class="dropdown">
					<a>Page 1<span class="caret"></span></a>
       			<div class="dropdown-content">
				<s:iterator value="#session.keyPermisos">
					<a href="${pageContext.request.contextPath}/<s:property value="enlace"/>">
					<s:property value="descripcion"/></a>
				</s:iterator>
				</div>
       			</li>
			</ul>
		</div>
	</nav>
</div>