<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<style>
.tableta{	
	font-family: 'Gloria Hallelujah', cursive;	
	/*font-family: 'Delius Unicase', cursive;*/
	font-size:18px;
	text-shadow: -2px -2px 1px #fff, 2px 2px 1px #fff, -2px 2px 1px #fff, 2px -2px 1px #fff;
}
.mod-tableta{
	font-family: 'Gloria Hallelujah', cursive;
	/*font-family: 'Delius Unicase', cursive;*/
	font-size:18px;
}
h2{
	font-family: 'Gloria Hallelujah', cursive;
	/*font-family: 'Delius Unicase', cursive;*/	
	text-shadow: -2px -2px 1px #fff, 2px 2px 1px #fff, -2px 2px 1px #fff, 2px -2px 1px #fff;
}
.table.nonborder th,.table.nonborder td{
	border: 0px !important;
}
</style>
<script type="text/javascript">
$(document).ready( function() {	
	$('#idRegistrarCurso').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	cadenas: {
                selector: '.datos',
                validators: {
                    notEmpty: {
                        message: 'Este campo es OBLIGATORIO'
                    }
                }
            }
        }
    });
	$('#idModificarCurso').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	cadenas: {
                selector: '.datos',
                validators: {
                    notEmpty: {
                        message: 'Este campo es OBLIGATORIO'
                    }
                }
            }
        }
    });
});
</script>
<h2><center>MANTENIMIENTO DE SECCIONES</center></h2>
<div id="divMensaje" style="text-align:center;">
<s:set var="msj_val"><s:property value="mensaje"/></s:set>
<s:set var="msje_val"><s:property value="mensajeError"/></s:set>
<s:if test="#msj_val != ''">
	<div class="alert alert-success">
	  <strong>��xito!</strong> <s:property value="mensaje"/>.
	</div>	
</s:if>
<s:if test="#msje_val != ''">
	<div class="alert alert-danger">
	  <strong>�Error!</strong> <s:property value="mensajeError"/>.
	</div>
</s:if>	
</div>
<a data-toggle="modal" href="#modal_crear" id="btnCrear">
	<span><img alt="" src="${pageContext.request.contextPath}/img/iconos/create2.png" width="35px"/></span>
</a>

<table class="table nonborder mod-tableta">
	<td>
		<div class="panel-group" id="accordion" style="width: 250px;height: 500px;">
			<s:iterator value="lstSeccion">
				<s:url id="idListar" action="listarCursoSec">
					<s:param name="codigo" value="codigo"/>
				</s:url>
				<div class="panel panel-primary">
					<div class="panel-heading">
		        		<h4 class="panel-title">
							<s:a href="%{idListar}"><s:property value="descripcion"/></s:a>
						</h4>
					</div>
				</div>
			</s:iterator>
		</div>
	</td>
	<td>
		<div class="panel-group" id="accordion" style="width: 500px;height: 500px;">
		<s:iterator value="lstCursoSec">
			<div class="panel panel-success">
				<div class="panel-heading">
		        	<h4 class="panel-title">
		          		<a data-toggle="collapse" data-parent="#accordion" href="#<s:property value="codigo"/>" style="color: black;">
		          			<s:property value="nombre"/>
		          		</a>
		        	</h4>
		      	</div>
		      	<div id="<s:property value="codigo"/>" class="panel-collapse collapse">
		        	<div class="panel-body">
		        		<table class="table">
		        			<tr>
		        				<td>CARRERA</td>
		        				<td><s:property value="carrera"/></td>
		        			</tr>
		        			<tr>
		        				<td>CICLO</td>
		        				<td><s:property value="ciclo"/></td>
		        			</tr>
		        			<tr>
		        				<td>NOMBRE</td>
		        				<td><s:property value="nombre"/></td>
		        			</tr>
		        		</table>
		        	</div>
		      	</div>
		    </div>   
		</s:iterator>
		</div>
	</td>
</table>


