package action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import beans.CarreraDTO;
import beans.CicloDTO;
import beans.CursoDTO;
import beans.DetalleCurSeccionDTO;
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
	private List<CicloDTO> lstCiclos;
	private List<CursoDTO> lstCursos;
	
	private Map<String,Object> sesion = ActionContext.getContext().getSession();
	
	private String mensaje;
	private String mensajeError;
	private int codigo,codcurso,codciclo;
	private String nombre;
	
	@Action(value="/m_seccion",results={
			@Result(name="ok",type="tiles",location="m_seccion")
	})
	public String listarSecciones(){
		lstSeccion = new SeccionService().listarSecciones();
		lstCiclos = new CursoService().listarCiclo();
		lstCursos = new CursoService().listarCurso();
		return "ok";
	}
	
	@Action(value="/listarCursoSec",results={
			@Result(name="ok",type="tiles",location="m_seccion")
	})
	public String listarCursoSec(){
		lstSeccion = new SeccionService().listarSecciones();
		lstCiclos = new CursoService().listarCiclo();
		lstCursos = new CursoService().listarCurso();
		sesion.put("keySeccion", new SeccionService().buscarSeccion(codigo));
		lstCursoSec = new SeccionService().listarCursoxSeccion(codigo);
		return "ok";
	}
	
	@Action(value="/regSecc",results={
			@Result(name="grabo",type="tiles",location="m_seccion"),
			@Result(name="error",type="tiles",location="m_seccion")
	})
	public String registrarSeccion(){
		SeccionDTO bean = new SeccionDTO();
		bean.setCodciclo(codciclo);
		bean.setDescripcion(nombre);
		SeccionDTO objSec = new SeccionService().buscarSeccion2(bean);
		if(objSec!=null){
			mensajeError = "La seccion "+ objSec.getDescripcion() +" ya se encuentra registrado para ese ciclo.";
			listarSecciones();
			return "error";
		}
		new SeccionService().registrarSeccion(bean);
		mensaje = "La sección "+ bean.getDescripcion() +" se registró correctamente";
		listarSecciones();
		return "grabo";
	}
	
	@Action(value="/updCurso",results={
			@Result(name="grabo",type="tiles",location="m_seccion"),
			@Result(name="error",type="tiles",location="m_seccion")
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
	
	@Action(value="/dropCursoSecc",results={
			@Result(name="grabo",type="tiles",location="m_seccion"),
			@Result(name="error",type="tiles",location="m_seccion")
	})
	public String deleteCursoSec(){
		DetalleCurSeccionDTO bean = new DetalleCurSeccionDTO();
		bean.setCodcur(codcurso);
		bean.setCodseccion(codigo);
		int result = new SeccionService().eliminarCursoSeccion(bean);
		if(result!=1){
			mensajeError = "Error al encontrar el curso "+ codcurso+" "+codigo;
			listarSecciones();
			return "error";
		}
		mensaje = "El Curso se eliminó correctamente";	
		listarSecciones();
		return "grabo";
	}
	
	@Action(value="/regDetalle",results={
			@Result(name="grabo",type="tiles",location="m_seccion"),
			@Result(name="error",type="tiles",location="m_seccion")
	})
	public String registrarDetalle(){
		DetalleCurSeccionDTO bean = new DetalleCurSeccionDTO();
		bean.setCodcur(codcurso);
		bean.setCodseccion(codigo);
		DetalleCurSeccionDTO objDeta = new SeccionService().buscarSeccion3(bean);
		if(objDeta!=null){
			mensajeError = "El curso ya se encuentra registrado para esa seccion.";
			listarSecciones();
			return "error";
		}
		new SeccionService().registrarDetalle(bean);
		mensaje = "Se registraron los datos correctamente. ";
		listarSecciones();
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

	public List<CicloDTO> getLstCiclos() {
		return lstCiclos;
	}

	public void setLstCiclos(List<CicloDTO> lstCiclos) {
		this.lstCiclos = lstCiclos;
	}

	public int getCodciclo() {
		return codciclo;
	}

	public void setCodciclo(int codciclo) {
		this.codciclo = codciclo;
	}

	public List<CursoDTO> getLstCursos() {
		return lstCursos;
	}

	public void setLstCursos(List<CursoDTO> lstCursos) {
		this.lstCursos = lstCursos;
	}
	
}
