<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<style>
.table{	
	font-family: 'Gloria Hallelujah', cursive;	
}
h2{
	font-family: 'Gloria Hallelujah', cursive;
}
</style>
<h2><center>MANTENIMIENTO DE PROFESORES</center></h2>
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
			<td>Eliminar</td>
		</tr>
	</s:iterator>
	</tbody>
</table>
	