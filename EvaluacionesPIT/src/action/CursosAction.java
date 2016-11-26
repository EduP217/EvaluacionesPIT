package action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

import beans.CarreraDTO;
import beans.CicloDTO;
import beans.CursoDTO;
import beans.UsuarioDTO;
import services.CursoService;
import services.LoginService;
import services.PersonaService;

@ParentPackage("pit")
public class CursosAction extends ActionSupport{
	private List<CursoDTO> lstMantCurso;
	private List<CarreraDTO> lstMantCarrera;
	private List<CicloDTO> lstMantCiclo;
	
	private CursoDTO Mancurso;
	private CarreraDTO Mancarrera;
	private CicloDTO Manciclo;
	private String mensaje;
	private String mensajeError;
	private int codigo,codcarrera,codciclo;
	private String nombre;
	
	@Action(value="/m_curso",results={
			@Result(name="ok",type="tiles",location="m_curso")
	})
	public String listarCursos(){
		lstMantCurso = new CursoService().listarCurso();
		lstMantCiclo = new CursoService().listarCiclo();
		lstMantCarrera = new CursoService().listarCarrera();
		return "ok";
	}
	
	@Action(value="/regCurso",results={
			@Result(name="grabo",type="tiles",location="m_curso"),
			@Result(name="error",type="tiles",location="m_curso")
	})
	public String registrarCurso(){
		CursoDTO bean = new CursoDTO();
		bean.setCodcarrera(codcarrera);
		bean.setCodciclo(codciclo);
		bean.setNombre(nombre);
		CursoDTO objCur = new CursoService().buscarCurso(bean);
		if(objCur!=null){
			mensajeError = "El curso "+ objCur.getNombre() +" ya se encuentra registrado para ese ciclo.";
			listarCursos();
			return "error";
		}
		new CursoService().registrarCurso(bean);
		mensaje = "El curso "+ bean.getNombre() +" se registró correctamente";
		listarCursos();
		return "grabo";
	}
	
	@Action(value="/updCurso",results={
			@Result(name="grabo",type="tiles",location="m_curso"),
			@Result(name="error",type="tiles",location="m_curso")
	})
	public String updateCurso(){
		CursoDTO objCur = new CursoService().buscarCurso(Mancurso);
		if(objCur==null){
			mensajeError = "Error al encontrar el curso "+ Mancurso.getCodigo();
			listarCursos();
			return "error";
		}		
		objCur.setCodcarrera(Mancurso.getCodcarrera());
		objCur.setCodciclo(Mancurso.getCodciclo());
		objCur.setNombre(Mancurso.getNombre());
		//new CursoService().modificarCurso(objCur);
		mensaje = "Se actualizaron los datos del curso correctamente "+objCur.getCodcarrera()+" "+objCur.getCodciclo()+" "+objCur.getNombre();
		listarCursos();
		return "grabo";
	}
	
	@Action(value="/dropCurso",results={
			@Result(name="grabo",type="tiles",location="m_curso"),
			@Result(name="error",type="tiles",location="m_curso")
	})
	public String deleteCurso(){
		CursoDTO objCur = new CursoService().buscarCurso(Mancurso);
		if(objCur==null){
			mensajeError = "Error al encontrar el curso";
			listarCursos();
			return "error";
		}
		new CursoService().eliminarCurso(Mancurso);	
		mensaje = "El curso se eliminó correctamente";	
		listarCursos();
		return "grabo";
	}
	
	
	public List<CursoDTO> getLstMantCurso() {
		return lstMantCurso;
	}
	public void setLstMantCurso(List<CursoDTO> lstMantCurso) {
		this.lstMantCurso = lstMantCurso;
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public int getCodcarrera() {
		return codcarrera;
	}
	public void setCodcarrera(int codcarrera) {
		this.codcarrera = codcarrera;
	}
	public int getCodciclo() {
		return codciclo;
	}
	public void setCodciclo(int codciclo) {
		this.codciclo = codciclo;
	}

	public List<CarreraDTO> getLstMantCarrera() {
		return lstMantCarrera;
	}

	public void setLstMantCarrera(List<CarreraDTO> lstMantCarrera) {
		this.lstMantCarrera = lstMantCarrera;
	}

	public List<CicloDTO> getLstMantCiclo() {
		return lstMantCiclo;
	}

	public void setLstMantCiclo(List<CicloDTO> lstMantCiclo) {
		this.lstMantCiclo = lstMantCiclo;
	}

	public CursoDTO getMancurso() {
		return Mancurso;
	}

	public void setMancurso(CursoDTO mancurso) {
		Mancurso = mancurso;
	}

	public CarreraDTO getMancarrera() {
		return Mancarrera;
	}

	public void setMancarrera(CarreraDTO mancarrera) {
		Mancarrera = mancarrera;
	}

	public CicloDTO getManciclo() {
		return Manciclo;
	}

	public void setManciclo(CicloDTO manciclo) {
		Manciclo = manciclo;
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
	
}
