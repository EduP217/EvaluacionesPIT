<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<style>
.table{	
	font-family: 'Gloria Hallelujah', cursive;	
	font-size:18px;
	text-shadow: -2px -2px 1px #fff, 2px 2px 1px #fff, -2px 2px 1px #fff, 2px -2px 1px #fff;
}
h2{
	font-family: 'Gloria Hallelujah', cursive;
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
	$('#codProf2').val(cod);
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
}
</script>
<h2><center>MANTENIMIENTO DE PROFESORES</center></h2>
<br/>
<a data-toggle="modal" href="#modal_crear">
	<span><img alt="" src="${pageContext.request.contextPath}/img/iconos/create2.png" width="35px"/></span>
</a>
<table class="table table-bordered">
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
			<td><s:property value="estado" /></td>
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
	</tbody>
</table>

<div id="modal_crear" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">DATOS DE DOCENTE</h4>
			</div>
			<div class="modal-body">
				<s:form>
					<table class="table">
						<tr>
							<td>Apellido</td>
							<td><input type="text" name="apellido"></td>
						</tr>
						<tr>
							<td>Nombre</td>
							<td><input type="text" name="nombre"></td>
						</tr>
						<tr>
							<td>DNI</td>
							<td><input type="text" name="dni"></td>
						</tr>
						<tr>
							<td>Fecha de Nacimiento</td>
							<td><input type="text" name="fechanac"></td>
						</tr>
						<tr>
							<td>Telefono fijo</td>
							<td><input type="text" name="telefono"></td>
						</tr>
						<tr>
							<td>Celular</td>
							<td><input type="text" name="celular"></td>
						</tr>
					</table>
					<button type="submit" class="btn btn-primary" data-dismiss="modal">Registrar</button>
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
				<h4 class="modal-title">DATOS DE DOCENTE</h4>
			</div>
			<div class="modal-body">
				<s:form>
					<input name="codigo" id="codProf" hidden="true"/>
					<table class="table">
						<tr>
							<td>Apellido</td>
							<td><input type="text" name="apellido" id="apeProf" /></td>
						</tr>
						<tr>
							<td>Nombre</td>
							<td><input type="text" name="nombre" id="nomProf" /></td>
						</tr>
						<tr>
							<td>DNI</td>
							<td><input type="text" name="dni" id="dniProf" /></td>
						</tr>
						<tr>
							<td>Fecha de Nacimiento</td>
							<td><input type="text" name="fechanac" id="fecProf" /></td>
						</tr>
						<tr>
							<td>Telefono fijo</td>
							<td><input type="text" name="telefono" id="tlfProf" /></td>
						</tr>
						<tr>
							<td>Celular</td>
							<td><input type="text" name="celular" id="celProf" /></td>
						</tr>
						<tr>
							<td>Estado</td>
							<td><select name="estado" id="estProf">
									<option value="1">Activo</option>
									<option value="0">Inactivo</option>
							</select></td>
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
				<s:form>
					<input name="codigo" id="codProf2" hidden="true"/>
					<table class="table">
						<tr>
							<td>Apellido:</td>
							<td><label id="apeProf2"></label></td>
						</tr>
						<tr>
							<td>Nombre:</td>
							<td><label id="nomProf2"></label></td>
						</tr>
						<tr>
							<td>DNI:</td>
							<td><label id="dniProf2"></label></td>
						</tr>
						<tr>
							<td>Fecha de Nacimiento:</td>
							<td><label id="fecProf2"></label></td>
						</tr>
						<tr>
							<td>Telefono fijo:</td>
							<td><label id="tlfProf2"></label></td>
						</tr>
						<tr>
							<td>Celular:</td>
							<td><label id="celProf2"></label></td>
						</tr>
						<tr>
							<td>Estado:</td>
							<td><label id="estProf2"></label></td>
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



