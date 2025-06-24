<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<div class="contenedor-menu">
	<a href="#" class="btn-menu">Menu<i class="icono fa fa-bars" aria-hidden="true"></i></a>
	<ul class="menu">
		<li class="text-white">
			<div class="parentMenu">
				<i class="fa fa-home" aria-hidden="true"></i>
				<a href="${pageContext.request.contextPath}/dashboard">
					<span>Panel principal</span>
				</a>
			</div>
		</li>
		<s:iterator value="#session.perfil.enlaces">
			<li class="text-white">
				<div class="parentMenu">
					<i class="<s:property value='icono' />" aria-hidden="true"></i>
					<a href="${pageContext.request.contextPath}/<s:property value='rutaURL' />">
						<span><s:property value='enlace' /></span>
					</a>
					<s:if test="subEnlaces != null">
						<i class="fa fa-chevron-down" aria-hidden="true"></i>
					</s:if>
				</div>
				<ul class="subMenu">
					<s:if test="subEnlaces != null">
						<s:iterator value="subEnlaces" var="se">
							<li class="text-white">
								<a href="${pageContext.request.contextPath}/<s:property value="#se.rutaURL"/>">
									<s:property value="#se.enlace" />
								</a>
							</li>
						</s:iterator>
					</s:if>
				</ul>
			</li>
		</s:iterator>
	</ul>
</div>

