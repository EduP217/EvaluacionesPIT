package action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

import beans.CarreraDTO;
import beans.CicloDTO;
import beans.CursoDTO;
import beans.SeccionDTO;
import beans.UsuarioDTO;
import services.CursoService;
import services.LoginService;
import services.PersonaService;
import services.SeccionService;

@ParentPackage("pit")
public class SeccionAction extends ActionSupport{
	private List<SeccionDTO> lstSeccion;
	private List<CursoDTO> lstCursoSec;
	
	private String mensaje;
	private String mensajeError;
	private int codigo,codcurso;
	private String nombre;
	
	@Action(value="/m_seccion",results={
			@Result(name="ok",type="tiles",location="m_seccion")
	})
	public String listarSecciones(){
		lstSeccion = new SeccionService().listarSecciones();
		return "ok";
	}
	
	@Action(value="/listarCursoSec",results={
			@Result(name="ok",type="tiles",location="m_seccion")
	})
	public String listarCursoSec(){
		lstSeccion = new SeccionService().listarSecciones();
		lstCursoSec = new SeccionService().listarCursoxSeccion(codigo);
		return "ok";
	}
	
	@Action(value="/regCurso",results={
			@Result(name="grabo",type="tiles",location="m_curso"),
			@Result(name="error",type="tiles",location="m_curso")
	})
	public String registrarCurso(){
		/*CursoDTO bean = new CursoDTO();
		bean.setCodcarrera(codcarrera);
		bean.setCodciclo(codciclo);
		bean.setNombre(nombre);
		CursoDTO objCur = new CursoService().buscarCurso(bean,0);
		if(objCur!=null){
			mensajeError = "El curso "+ objCur.getNombre() +" ya se encuentra registrado para ese ciclo.";
			listarCursos();
			return "error";
		}
		new CursoService().registrarCurso(bean);
		mensaje = "El curso "+ bean.getNombre() +" se registró correctamente";
		listarCursos();*/
		return "grabo";
	}
	
	@Action(value="/updCurso",results={
			@Result(name="grabo",type="tiles",location="m_curso"),
			@Result(name="error",type="tiles",location="m_curso")
	})
	public String updateCurso(){
		/*CursoDTO objCur = new CursoService().buscarCurso(new CursoDTO(),codigo);
		if(objCur==null){
			mensajeError = "Error al encontrar el curso "+ codigo;
			listarCursos();
			return "error";
		}		
		objCur.setCodcarrera(codcarrera);
		objCur.setCodciclo(codciclo);
		objCur.setNombre(nombre);
		CursoDTO objCur2 = new CursoService().buscarCurso(objCur,0);
		if(objCur2!=null){
			mensajeError = "El curso "+ objCur.getNombre() +" ya se encuentra registrado para ese ciclo.";
			listarCursos();
			return "error";
		}
		new CursoService().modificarCurso(objCur);
		mensaje = "Se actualizaron los datos del curso correctamente. ";
		listarCursos();*/
		return "grabo";
	}
	
	@Action(value="/dropCurso",results={
			@Result(name="grabo",type="tiles",location="m_curso"),
			@Result(name="error",type="tiles",location="m_curso")
	})
	public String deleteCurso(){
		/*int result = new CursoService().eliminarCurso(codigo);
		if(result!=1){
			mensajeError = "Error al encontrar el curso";
			listarCursos();
			return "error";
		}
		mensaje = "El curso se eliminó correctamente";	
		listarCursos();*/
		return "grabo";
	}
	
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public String getMensajeError() {
		return mensajeError;
	}

	public void setMensajeError(String mensajeError) {
		this.mensajeError = mensajeError;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<SeccionDTO> getLstSeccion() {
		return lstSeccion;
	}

	public void setLstSeccion(List<SeccionDTO> lstSeccion) {
		this.lstSeccion = lstSeccion;
	}

	public List<CursoDTO> getLstCursoSec() {
		return lstCursoSec;
	}

	public void setLstCursoSec(List<CursoDTO> lstCursoSec) {
		this.lstCursoSec = lstCursoSec;
	}

	public int getCodcurso() {
		return codcurso;
	}

	public void setCodcurso(int codcurso) {
		this.codcurso = codcurso;
	}
	
}
