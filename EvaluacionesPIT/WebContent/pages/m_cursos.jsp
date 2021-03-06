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
ul.pagination {
    display: inline-block;
    padding: 0;
    margin: 0;
}

ul.pagination li {display: inline;}

ul.pagination li a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
}

ul.pagination li a.active {
    background-color: #4CAF50;
    color: white;
}

ul.pagination li a:hover:not(.active) {background-color: #ddd;}
</style>
<script type="text/javascript">
function llenarUpdate(codigo,codcarrera,codciclo,nomcurso){	
	$('#codCurso').val(codigo);
	$('#idcarrera').val(codcarrera);
	$('#idciclo').val(codciclo);
	$('#idnombre').val(nomcurso);
}
function llenarEliminar(cod,carrera,ciclo,nom){
	$('#codcurso2').val(cod);
	$('#idcarrera2').text(carrera);
	$('#idciclo2').text(ciclo);
	$('#curso2').text(nom);
}
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
                    },
                    regexp: {
                        regexp: /^[^0-9]+$/,
                        message: 'Este campo solo puede contener letras'
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
                    },
                    regexp: {
                        regexp: /^[^0-9]+$/,
                        message: 'Este campo solo puede contener letras'
                    }
                }
            }
        }
    });
});
</script>
<h2><center>MANTENIMIENTO DE CURSOS</center></h2>
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
<br/>
<a data-toggle="modal" href="#modal_crear" id="btnCrear">
	<span><img alt="" src="${pageContext.request.contextPath}/img/iconos/create2.png" width="35px"/></span>
</a>
<table class="table table-bordered tableta">
	<thead>
		<tr>
			<th>Carrera</th>
			<th>Ciclo</th>
			<th>Nombre</th>
			<th></th>
		</tr>
	</thead>
	<tbody>		
	<s:iterator value="lstMantCurso">
		<tr>
			<td><s:property value="carrera" /></td>
			<td><s:property value="ciclo" /></td>
			<td><s:property value="nombre" /></td>
			<td>
				<a 	data-toggle="modal" href="#modal_modificar" 
					onclick="llenarUpdate(
									<s:property value="codigo"/>,
									<s:property value="codcarrera"/>,
									<s:property value="codciclo"/>,
									'<s:property value="nombre"/>'
									)">
					<span><img alt="" src="${pageContext.request.contextPath}/img/iconos/modificar4.png" width="35px" /></span>				
				</a>
				<a 	data-toggle="modal" href="#modal_eliminar"
					onclick="llenarEliminar(
									<s:property value="codigo"/>,
									'<s:property value="carrera"/>',
									'<s:property value="ciclo"/>',
									'<s:property value="nombre"/>'
									)">
					<span><img alt="" src="${pageContext.request.contextPath}/img/iconos/eliminar.png" width="30px" /></span>
				</a>
			</td>			
		</tr>
	</s:iterator>
	</tbody>
</table>

<ul class="pagination">
	<s:set var="pag_val"><s:property value="cantpaginas" /></s:set>
	<s:set var="pag_sel"><s:property value="pagselect" /></s:set>
	<s:if test="#pag_val == 1">
		<li><a class="active" href="#"><s:property value="cantpaginas"/></a></li>
	</s:if>
	<s:else>
		<s:iterator var="i" begin="1" end="#pag_val">
			<s:set var="pag_run">${i}</s:set>
			<s:if test="#pag_run==1">
				<s:if test="#pag_sel > 1">
					<li><a href="pagcurso?numpagina=${i}">�</a></li>
				</s:if>
			</s:if>
			<s:if test="#pag_run==#pag_sel">
  				<li><a class="active" href="pagcurso?numpagina=${i}">${i}</a></li>				
			</s:if>
			<s:else>
  				<li><a href="pagcurso?numpagina=${i}">${i}</a></li>		
			</s:else>
			<s:if test="#pag_run==#pag_val">
				<s:if test="#pag_sel < #pag_val">
  					<li><a href="pagcurso?numpagina=${i}">�</a></li>
  				</s:if>
			</s:if>
		</s:iterator>
	</s:else>
</ul>		

<div id="modal_crear" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">DATOS DEL CURSO</h4>
			</div>
			<div class="modal-body">
				<s:form id="idRegistrarCurso" method="post" action="regCurso">
					<table class="table nonborder mod-tableta">
						<tr>
							<td>Carrera</td>
							<td><div class="form-group">
								<s:select 
									name="codcarrera"
									list="lstMantCarrera"
									listKey="codigo"
									listValue="datos" cssClass="form-control"/>
								</div></td>
						</tr>
						<tr>
							<td>Ciclo</td>
							<td><div class="form-group">							
								<s:select 
									name="codciclo"
									list="lstMantCiclo"
									listKey="codigo"
									listValue="datos" cssClass="form-control"/>								
								</div>
							</td>
						</tr>
						<tr>
							<td>Curso</td>
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

<div id="modal_modificar" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">DATOS DEL CURSO</h4>
			</div>
			<div class="modal-body">
				<s:form id="idModificarCurso" method="post" action="updCurso">
					<input name="codigo" id="codCurso" hidden="true" />
					<table class="table nonborder mod-tableta">
						<tr>
							<td>Carrera</td>
							<td><div class="form-group">
									<s:select 
									name="codcarrera"
									id="idcarrera"
									list="lstMantCarrera"
									listKey="codigo"
									listValue="datos" cssClass="form-control"/>
								</div>
							</td>
						</tr>
						<tr>
							<td>Ciclo</td>
							<td><div class="form-group">
									<s:select 
									name="codciclo"
									id="idciclo"
									list="lstMantCiclo"
									listKey="codigo"
									listValue="datos"
									headerKey="-1" cssClass="form-control"/>
								</div>
							</td>
						</tr>
						<tr>
							<td>Curso</td>
							<td><div class="form-group">
									<s:textfield name="nombre" cssClass="form-control datos" id="idnombre" />
								</div>
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
				<h4 class="modal-title">�ESTA SEGURO DE ELIMINAR EL REGISTRO?</h4>
			</div>
			<div class="modal-body">
				<s:form action="dropCurso">
					<input name="codigo" id="codcurso2" hidden="true" />
					<table class="table nonborder mod-tableta">
						<tr>
							<td>Carrera:</td>
							<td><s:label id="idcarrera2"/></td>
						</tr>
						<tr>
							<td>Ciclo:</td>
							<td><s:label id="idciclo2"/></td>
						</tr>
						<tr>
							<td>Curso:</td>
							<td><s:label id="curso2"/></td>
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



