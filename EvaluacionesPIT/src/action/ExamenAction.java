package action;

import java.util.HashMap;
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
import beans.SeccionDTO;
import services.CursoService;
import services.PersonaService;
import services.SeccionService;

@ParentPackage("pit")
public class ExamenAction extends ActionSupport{
	
	private List<CarreraDTO> lstCarreraExa;
	private List<CicloDTO> lstCicloExa;
	
	private CursoDTO curso;
	private CarreraDTO carrera;
	private CicloDTO ciclo;
	private String[] secciones;
	private String codigo,codcarrera,codciclo;
	
	private Map<String, Object> userdata = new HashMap<String, Object>();
	private Map<String, Object> sesion = ActionContext.getContext().getSession();
	
	@Action(value="/t_examen",results={
			@Result(name="ok",type="tiles",location="t_examen")
	})
	public String cargarRegistro(){
		lstCarreraExa = new CursoService().listarCarrera();
		lstCicloExa = new CursoService().listarCiclo();
		sesion.put("keylstCurso", new CursoService().listarCurso());
		sesion.put("selCiclo",-1);
		return "ok";
	}
		
	@Action(value="/buscCursos",results={
			@Result(name="ok",type="tiles",location="t_examen")
	})	
	public String buscarCursos(){
		lstCarreraExa = new CursoService().listarCarrera();
		lstCicloExa = new CursoService().listarCiclo();
		sesion.put("keylstCurso", new CursoService().listarCursoxCiclo(Integer.parseInt(codciclo)));
		sesion.put("selCiclo",codciclo);
		sesion.put("keylstSeccion", new SeccionService().listarSeccion2(Integer.parseInt(codciclo)));		
		return "ok";
	}	
	
	public CursoDTO getCurso() {
		return curso;
	}

	public void setCurso(CursoDTO curso) {
		this.curso = curso;
	}

	public String getCodcarrera() {
		return codcarrera;
	}

	public void setCodcarrera(String codcarrera) {
		this.codcarrera = codcarrera;
	}
	
	public String getCodciclo() {
		return codciclo;
	}

	public void setCodciclo(String codciclo) {
		this.codciclo = codciclo;
	}

	public CarreraDTO getCarrera() {
		return carrera;
	}

	public void setCarrera(CarreraDTO carrera) {
		this.carrera = carrera;
	}

	public CicloDTO getCiclo() {
		return ciclo;
	}

	public void setCiclo(CicloDTO ciclo) {
		this.ciclo = ciclo;
	}
	
	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}	

	public String[] getSecciones() {
		return secciones;
	}

	public void setSecciones(String[] secciones) {
		this.secciones = secciones;
	}

	public List<CarreraDTO> getLstCarreraExa() {
		return lstCarreraExa;
	}

	public void setLstCarreraExa(List<CarreraDTO> lstCarreraExa) {
		this.lstCarreraExa = lstCarreraExa;
	}

	public List<CicloDTO> getLstCicloExa() {
		return lstCicloExa;
	}

	public void setLstCicloExa(List<CicloDTO> lstCicloExa) {
		this.lstCicloExa = lstCicloExa;
	}
	
}
