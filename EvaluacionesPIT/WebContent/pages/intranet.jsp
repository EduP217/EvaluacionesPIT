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
.panel-group .panel .panel-heading .panel-title a{
	font-family: 'Gloria Hallelujah', cursive;
	color:black;
}
</style>
<h2><center>LISTADO DE CURSOS</center></h2>

<div class="panel-group" id="accordion">
<s:iterator value="#session.keyCursos">
	<div class="panel panel-default">
		<div class="panel-heading">
        	<h4 class="panel-title">
          		<a data-toggle="collapse" data-parent="#accordion" href="#<s:property value="codigo"/>">
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
        				<td>SECCION</td>
        				<td><s:property value="nomseccion"/></td>
        			</tr>
        			<tr>
        				<td colspan="2">
        					<s:form action="cargarEvalua">
        						<input name="codCurso" value="<s:property value="codigo"/>" hidden="hidden" />
        						<s:submit value="DESARROLLAR EVALUACIÓN"/>
        					</s:form>        					
        				</td>
        			</tr>
        		</table>
        	</div>
      	</div>
    </div>   
</s:iterator>
</div>
