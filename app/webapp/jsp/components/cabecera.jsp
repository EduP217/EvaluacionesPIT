<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<div id="cabeceraContainer">
	<div class="institutionalLogo">
		<img src="${pageContext.request.contextPath}/images/cibertec/logo_Cibertec_02.png"/>
	</div>
	<div id="menuUsuario">
		<div class="dropdown chip">
			<div class="btnContainer">
				<img src="${pageContext.request.contextPath}/images/users/${sessionScope.user.imagenURL}" id="foto"/>
				<button class="btn dropbtn" type="button" id="menu1" data-toggle="dropdown">					    
					<span><s:property value="#session.user.persona.nombres+' '+#session.user.persona.apellidos"/></span>
		    		<span class="caret"></span>
		    	</button>
			</div>
		    <div class="dropdown-content">
		    	<div class="p-1rem">
		    		<select name="personaPerfil" id="personaPerfil" class="form-control">
		    			<s:iterator value="#session.user.persona.perfiles">
		    				<option value="<s:property value='perfilId' />"  <s:if test="perfilId == #session.perfil.perfilId">selected</s:if>>
		    					<s:property value="perfil" />
		    				</option>
		    			</s:iterator>
		    		</select>
		    	</div>
		    	<a href="${pageContext.request.contextPath}/configuracion">
		    		<i class="fa fa-gear" aria-hidden="true"></i>
		    		<span>Configuración</span>
		    	</a>
		    	<a href="${pageContext.request.contextPath}/cerrarSesion">
		    		<i class="fa fa-times" aria-hidden="true"></i>
					<span>Salir</span>
				</a>
			</div>
		</div>
	</div>
</div>