<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<style>
.tableta{	
	font-family: 'Gloria Hallelujah', cursive;	
	font-size:18px;
	text-shadow: -2px -2px 1px #fff, 2px 2px 1px #fff, -2px 2px 1px #fff, 2px -2px 1px #fff;
}
.mod-tableta{
	font-family: 'Gloria Hallelujah', cursive;	
	font-size:18px;
}
h2{
	font-family: 'Gloria Hallelujah', cursive;
	text-shadow: -2px -2px 1px #fff, 2px 2px 1px #fff, -2px 2px 1px #fff, 2px -2px 1px #fff;
}
.table.nonborder th,.table.nonborder td{
	border: 0px !important;
}
</style>
<script type="text/javascript">
function llenarUpdate(cod,ape,nom,dni,fec,tlf,cel,est){
	$('#codProf').val(cod);
	$('#apeProf').val(ape);
	$('#nomProf').val(nom);
	$('#dniProf').val(dni);
	$('#fecProf').val(fec);
	$('#tlfProf').val(tlf);
	$('#celProf').val(cel);
	$('#estProf').val(est);
}
function llenarEliminar(cod,ape,nom,dni,fec,tlf,cel,est){
	$('#codProf2').val(dni);
	$('#apeProf2').text(ape);
	$('#nomProf2').text(nom);
	$('#dniProf2').text(dni);
	$('#fecProf2').text(fec);
	$('#tlfProf2').text(tlf);
	$('#celProf2').text(cel);
	if(est==0){
		est = 'Inactivo';
	} else {
		est = 'Activo';
	}
	$('#estProf2').text(est);
	$('#codDrop').val(cod);
}
$(document).ready( function() {	
	$('#btnCrear').click(function(){
		$('#a').val('');
		$('#b').val('');
		$('#c').val('');
		$('#d').val('');
		$('#e').val('');
		$('#f').val('');
	});
	$('.fecha').datepicker({
		format: "dd-mm-yyyy",
	    maxViewMode: 3,
	    language: "es",
	    autoclose:true,
	    orientation: "bottom auto"
	});
	$('#idRegistrarDocente').bootstrapValidator({
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
                    },
                    regexp: {
                        regexp: /^[^0-9]+$/,
                        message: 'Este campo solo puede contener letras'
                    }
                }
            },
            numeros: {
            	selector: '.digit',
            	validators: {
                    notEmpty: {
                        message: 'Este campo es OBLIGATORIO'
                    },
                    digits: {
                        message: 'Este campo solo puede contener números'
                    }
                }
            },
            dni: {
            	selector: '#c',
            	validators: {
                    notEmpty: {
                        message: 'Este campo es OBLIGATORIO'
                    },
                    digits: {
                        message: 'Este campo solo puede contener números'
                    },
                    stringLength: {
                        min: 8,
                        max: 8,
                        message: 'El DNI no puede ser menor a 8 dígitos'
                    }
                }
            }
        }
    });
	$('#idModificarDocente').bootstrapValidator({
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
                    },
                    regexp: {
                        regexp: /^[^0-9]+$/,
                        message: 'Este campo solo puede contener letras'
                    }
                }
            },
            numeros: {
            	selector: '.digit',
            	validators: {
                    notEmpty: {
                        message: 'Este campo es OBLIGATORIO'
                    },
                    digits: {
                        message: 'Este campo solo puede contener números'
                    }
                }
            },
            dni: {
            	selector: '#dniProf',
            	validators: {
                    notEmpty: {
                        message: 'Este campo es OBLIGATORIO'
                    },
                    digits: {
                        message: 'Este campo solo puede contener números'
                    },
                    stringLength: {
                        min: 8,
                        max: 8,
                        message: 'El DNI no puede ser menor a 8 dígitos'
                    }
                }
            }
        }
    });
});
</script>
<h2><center>MANTENIMIENTO DE ALUMNOS</center></h2>
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
<br/>
<a data-toggle="modal" href="#modal_crear" id="btnCrear">
	<span><img alt="" src="${pageContext.request.contextPath}/img/iconos/create2.png" width="35px"/></span>
</a>
<table class="table table-bordered tableta">
	<thead>
		<tr>
			<th>Apellido</th>
			<th>Nombre</th>
			<th>DNI</th>
			<th>Fecha Nac.</th>
			<th>Tel. Fijo</th>
			<th>Celular</th>
			<th>Estado</th>
			<th></th>
		</tr>
	</thead>
	<tbody>		
	<s:iterator value="lstPersona">
		<tr>
			<td><s:property value="apellido" /></td>
			<td><s:property value="nombre" /></td>
			<td><s:property value="dni" /></td>
			<td><s:property value="fechanac" /></td>
			<td><s:property value="telefono" /></td>
			<td><s:property value="celular" /></td>
		<s:set var="est_val"><s:property value="estado" /></s:set>
		<s:if test="#est_val == 0">
			<td style="color: red;">Inactivo</td>
		</s:if><s:else>
			<td>Activo</td>
		</s:else>
			<td>
				<a 	data-toggle="modal" href="#modal_modificar" 
					onclick="llenarUpdate(
									'<s:property value="codigo"/>',
									'<s:property value="apellido"/>',
									'<s:property value="nombre"/>',
									'<s:property value="dni" />',
									'<s:property value="fechanac" />',
									'<s:property value="telefono" />',
									'<s:property value="celular" />',
									'<s:property value="estado" />'
									)">
					<span><img alt="" src="${pageContext.request.contextPath}/img/iconos/modificar4.png" width="35px" /></span>				
				</a>
				<a 	data-toggle="modal" href="#modal_matricula" 
					onclick="llenarMatricula(
									'<s:property value="codigo"/>',
									)">
					<span><img alt="" src="${pageContext.request.contextPath}/img/iconos/detalles2.png" width="35px" /></span>				
				</a>
				<a 	data-toggle="modal" href="#modal_eliminar"
					onclick="llenarEliminar(
									'<s:property value="codigo"/>',
									'<s:property value="apellido"/>',
									'<s:property value="nombre"/>',
									'<s:property value="dni" />',
									'<s:property value="fechanac" />',
									'<s:property value="telefono" />',
									'<s:property value="celular" />',
									'<s:property value="estado" />'
									)">
					<span><img alt="" src="${pageContext.request.contextPath}/img/iconos/eliminar.png" width="30px" /></span>
				</a>
			</td>			
		</tr>
	</s:iterator>
		<tr>
			<td colspan="8"></td>
		</tr>
	</tbody>
</table>

<div id="modal_crear" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">DATOS DEL ALUMNO</h4>
			</div>
			<div class="modal-body">
				<s:form id="idRegistrarDocente" method="post" action="regAlum">
					<table class="table nonborder mod-tableta">
						<tr>
							<td>Apellido</td>
							<td><div class="form-group"><s:textfield name="persona.apellido" cssClass="form-control datos" id="a"/></div></td>
						</tr>
						<tr>
							<td>Nombre</td>
							<td><div class="form-group"><s:textfield name="persona.nombre" cssClass="form-control datos" id="b"/></div></td>
						</tr>
						<tr>
							<td>DNI</td>
							<td><div class="form-group"><s:textfield name="persona.dni" cssClass="form-control" id="c"/></div></td>
						</tr>
						<tr>
							<td>Fecha de Nacimiento</td>
							<td><div class="form-group">
								<input type="text" name="persona.fechanac" Class="form-control fecha" readonly="readonly" id="d"/></div></td>
						</tr>
						<tr>
							<td>Telefono fijo</td>
							<td><div class="form-group"><s:textfield name="persona.telefono" cssClass="form-control digit" id="e"/></div></td>
						</tr>
						<tr>
							<td>Celular</td>
							<td><div class="form-group"><s:textfield name="persona.celular" cssClass="form-control digit" id="f"/></div></td>
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

<div id="modal_modificar" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">DATOS DEL ALUMNO</h4>
			</div>
			<div class="modal-body">
				<s:form id="idModificarDocente" method="post" action="updAlum">
					<input name="persona.codigo" id="codProf" hidden="true"/>
					<table class="table nonborder mod-tableta">
						<tr>
							<td>Apellido</td>
							<td><div class="form-group"><s:textfield name="persona.apellido" cssClass="form-control datos" id="apeProf" /></div></td>
						</tr>
						<tr>
							<td>Nombre</td>
							<td><div class="form-group"><s:textfield name="persona.nombre" cssClass="form-control datos" id="nomProf" /></div></td>
						</tr>
						<tr>
							<td>DNI</td>
							<td><div class="form-group"><s:textfield name="persona.dni" cssClass="form-control" id="dniProf" readonly="true" /></div></td>
						</tr>
						<tr>
							<td>Fecha de Nacimiento</td>
							<td><div class="form-group">
								<input type="text" name="persona.fechanac" id="fecProf" Class="form-control fecha" readonly="readonly" /></div></td>
						</tr>
						<tr>
							<td>Telefono fijo</td>
							<td><div class="form-group"><s:textfield name="persona.telefono" cssClass="form-control digit" id="tlfProf" /></div></td>
						</tr>
						<tr>
							<td>Celular</td>
							<td><div class="form-group"><s:textfield name="persona.celular" cssClass="form-control digit" id="celProf" /></div></td>
						</tr>
						<tr>
							<td>Estado</td>
							<td>
								<select name="persona.estado" id="estProf" Class="form-control">
									<option value="1">Activo</option>
									<option value="0">Inactivo</option>
								</select>
							</td>
						</tr>
					</table>
					<button type="submit" class="btn btn-primary btn-block">Modificar</button>
				</s:form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<div id="modal_eliminar" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">¿ESTA SEGURO DE ELIMINAR EL REGISTRO?</h4>
			</div>
			<div class="modal-body">
				<s:form action="dropAlum">
					<input name="dni" id="codProf2" hidden="true" />
					<table class="table nonborder mod-tableta">
						<tr>
							<td>Apellido:</td>
							<td><s:label id="apeProf2"/></td>
						</tr>
						<tr>
							<td>Nombre:</td>
							<td><s:label id="nomProf2"/></td>
						</tr>
						<tr>
							<td>DNI:</td>
							<td><s:label id="dniProf2"/></td>
						</tr>
						<tr>
							<td>Fecha de Nacimiento:</td>
							<td><s:label id="fecProf2"/></td>
						</tr>
						<tr>
							<td>Telefono fijo:</td>
							<td><s:label id="tlfProf2"/></td>
						</tr>
						<tr>
							<td>Celular:</td>
							<td><s:label id="celProf2"/></td>
						</tr>
						<tr>
							<td>Estado:</td>
							<td><s:label id="estProf2"/></td>
						</tr>
					</table>
					<button type="submit" class="btn btn-primary btn-block">Eliminar</button>
				</s:form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<div id="modal_modificar" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">¿SELECCIONE LOS CURSOS DE MATRICULA?</h4>
			</div>
			<div class="modal-body">
				<s:form action="">
					<input name="codigo" id="codUsuario" hidden="true" />
					<table class="table nonborder mod-tableta">
						<tr>
							<td>Ciclo:</td>
							<td></td>
						</tr>
						<tr>
							<td>Curso:</td>
							<td></td>
						</tr>
						<tr>
							<td>Seccion:</td>
							<td></td>
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

