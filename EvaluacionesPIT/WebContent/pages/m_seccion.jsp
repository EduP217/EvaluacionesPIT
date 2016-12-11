<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<style>
.tableta{	
	font-family: 'Gloria Hallelujah', cursive;	
	/*font-family: 'Delius Unicase', cursive;*/
	font-size:18px;
	/*text-shadow: -2px -2px 1px #fff, 2px 2px 1px #fff, -2px 2px 1px #fff, 2px -2px 1px #fff;*/
}
.mod-tableta{
	font-family: 'Gloria Hallelujah', cursive;
	/*font-family: 'Delius Unicase', cursive;*/
	font-size:18px;
}
h2{
	font-family: 'Gloria Hallelujah', cursive;
	/*font-family: 'Delius Unicase', cursive;*/	
	/*text-shadow: -2px -2px 1px #fff, 2px 2px 1px #fff, -2px 2px 1px #fff, 2px -2px 1px #fff;*/
}
.table.nonborder th,.table.nonborder td{
	border: 0px !important;
}
</style>
<script type="text/javascript">
function modalCrear(){
	$('#modal_crear_II').modal();
}
$(document).ready( function() {	
	$('#idRegistrarSeccion').bootstrapValidator({
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
	  <strong>¡Éxito!</strong> <s:property value="mensaje"/>.
	</div>	
</s:if>
<s:if test="#msje_val != ''">
	<div class="alert alert-danger">
	  <strong>¡Error!</strong> <s:property value="mensajeError"/>.
	</div>
</s:if>	
</div>
<a data-toggle="modal" href="#modal_crear" id="btnCrear">
	<span><img alt="" src="${pageContext.request.contextPath}/img/iconos/create2.png" width="35px"/></span>
</a>

<table class="table nonborder mod-tableta">
	<td style="width: 250px;height: 500px;">
		<div class="panel-group" id="accordion" >
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
	<td style="width: 500px;height: 500px;">
		<div class="panel-group" id="accordion">
		<s:iterator value="lstCursoSec">
			<s:url id="idEliminar" action="dropCursoSecc">
				<s:param name="codcurso" value="codigo" />
				<s:param name="codigo" value="#session.keySeccion.codigo" />
			</s:url>
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
		        			<tr>
		        				<td></td>
		        				<td><s:a href="%{idEliminar}">
										<img src="${pageContext.request.contextPath}/img/iconos/eliminar.png" width="30px" title="Eliminar" />
									</s:a>
								</td>
		        			</tr>
		        		</table>
		        	</div>
		      	</div>
		    </div>   
		</s:iterator>
		<button class="btn btn-warning" style="float:right;" onclick="modalCrear()"><span class="glyphicon glyphicon-plus"></span></button>
		</div>
	</td>
</table>

<div id="modal_crear" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">REGISTRO DE SECCION</h4>
			</div>
			<div class="modal-body">
				<s:form id="idRegistrarSeccion" method="post" action="regSecc">
					<table class="table nonborder mod-tableta">						
						<tr>
							<td>Ciclo</td>
							<td><div class="form-group">							
								<s:select 
									name="codciclo"
									list="lstCiclos"
									listKey="codigo"
									listValue="datos" cssClass="form-control"/>						
								</div>
							</td>
						</tr>
						<tr>
							<td>Seccion</td>
							<td><div class="form-group"><s:textfield name="nombre" cssClass="form-control datos" id="c"/></div></td>
						</tr>
					</table>
					<button type="submit" class="btn btn-primary btn-block">Registrar</button>
				</s:form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<div id="modal_crear_II" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">ASIGNAR CURSO A SECCION</h4>
			</div>
			<div class="modal-body">
				<s:form id="idRegistrarCursoSeccion" method="post" action="regDetalle">
					<input name="codigo" id="codsecc" value="<s:property value="#session.keySeccion.codigo"/>" hidden="true"/>
					<table class="table nonborder mod-tableta">						
						<tr>
							<td>Seccion</td>
							<td><s:label id="nomsecc"><s:property value="#session.keySeccion.descripcion"/></s:label></td>
						</tr>						
						<tr>
							<td>Curso</td>
							<td>
								<div class="form-group">
								<select class="form-control" name="codcurso">
									<option value="-1">[ Seleccionar ]</option>
									<s:iterator value="lstCursos">
										<option value='<s:property value="codigo" />'><s:property value="nombre"/></option>
									</s:iterator>
								</select>										
								</div>
							</td>
						</tr>
					</table>
					<button type="submit" class="btn btn-primary btn-block">Registrar</button>
				</s:form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

