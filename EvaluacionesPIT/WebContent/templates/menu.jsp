<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<style>
a:link  {
	text-decoration: none;
	color: white;
}
.btn-menu{
	display: none;
	padding: 20px;
	background: #0d2c44;
	color: white;
}
.btn-menu:hover{
	background: #e9e9e9;
}
.btn-menu .icono{
	float: right;
}
.contenedor-menu{
	width:104.5%;
	min-width:300px;
	display:inline-block;
	font-family: 'Gloria Hallelujah', cursive;
	line-height: 18px;
	text-transform: capitalize;
}
.contenedor-menu .menu{
	width: 100%;
}
.contenedor-menu ul{
	list-style: none;
	margin-left: -40px;
	width: 104.5%;
}
.contenedor-menu .menu li a{
	color: #494949;
	display: block;
	padding: 15px 20px;
	background: #e9e9e9;
	font-size: 18px;
}
.contenedor-menu .menu li a:hover{
	background: #1a95d5;
	color: white;
}
.contenedor-menu .menu .icono{
	font-size: 12px;
	line-height: 18px;
}
.contenedor-menu .menu .icono.izquierda{
	float: left;
	margin-right: 10px;
}
.contenedor-menu .menu .icono.derecha{
	float: right;
	margin-left: 10px;
}
.contenedor-menu .menu ul{
	display: none;
	margin-left: -40px;
	width: 110.8%;
}
.contenedor-menu .menu ul li a{
	background: #424242;
	color: #e9e9e9;
}
.contenedor-menu .menu .activado > a{
	background: #1a95d5;
	color: white;
}
@media screen and (max-width: 450px) {
	#idDatosUsuario{
		width: 335px;
		margin-left: 15px;
	}
	.contenedor-menu{
		width: 95%;
		position: fixed;
		z-index: 1000;
	}
	.btn-menu{
		display: block;
	}
	.contenedor-menu .menu{
		width: 111.5%;
		display: none;
	}
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.menu li:has(ul)').click(function(e){
			e.preventDefault();
			if ($(this).hasClass('activado')){
				$(this).removeClass('activado');
				$(this).children('ul').slideUp();
			} else {
				$('.menu li ul').slideUp();
				$('.menu li').removeClass('activado');
				$(this).addClass('activado');
				$(this).children('ul').slideDown();
			}
		});
		$('.btn-menu').click(function(){
			$('.contenedor-menu .menu').slideToggle();
		});
		$(window).resize(function(){
			if($(document).width()>450){
				$('.contenedor-menu .menu').css({'display':'block'});
			}
			if($(document).width()<450){
				$('.contenedor-menu .menu').css({'display':'none'});
				$('.menu li ul').slideUp();
				$('.menu li').removeClass('activado');
			}
		});
		$('.menu li ul li a').click(function(){
			window.location.href = $(this).attr("href");
		})
	});
</script>
<div class="contenedor-menu">
	<a href="#" class="btn-menu">Menu<i class="icono fa fa-bars" aria-hidden="true"></i></a>
	<ul class="menu">
		<li>
			<a href="main"><i class="icono izquierda fa fa-home" aria-hidden="true"></i>Inicio</a>
		</li>
		<li>
			<a href="#"><i class="icono izquierda fa fa-pencil" aria-hidden="true"></i>Evaluaciones<i class="icono derecha fa fa-chevron-down" aria-hidden="true"></i></a>
			<ul>
				<s:iterator value="#session.keyPermisosT">
					<li><a href="${pageContext.request.contextPath}/<s:property value="enlace"/>"><s:property value="descripcion" /></a></li>
				</s:iterator>
			</ul>
		</li>
		<li>
			<a href="#"><i class="icono izquierda fa fa-list-alt" aria-hidden="true"></i>Consultas<i class="icono derecha fa fa-chevron-down" aria-hidden="true"></i></span></a>
			<ul>
				<s:iterator value="#session.keyPermisosC">
					<li><a href="${pageContext.request.contextPath}/<s:property value="enlace"/>"><s:property value="descripcion" /></a></li>
				</s:iterator>
			</ul>
		</li>
		<li>
			<a href="#"><i class="icono izquierda fa fa-wrench" aria-hidden="true"></i>Mantenimiento<i class="icono derecha fa fa-chevron-down" aria-hidden="true"></i></span></a>
			<ul>
				<s:iterator value="#session.keyPermisosM">
					<li><a href="${pageContext.request.contextPath}/<s:property value="enlace"/>"><s:property value="descripcion" /></a></li>
				</s:iterator>
			</ul>
		</li>
	</ul>	
</div>

