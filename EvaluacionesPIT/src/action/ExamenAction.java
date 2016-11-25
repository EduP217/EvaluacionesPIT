package action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

import beans.CarreraDTO;
import beans.CicloDTO;
import beans.CursoDTO;
import services.CursoService;
import services.PersonaService;

@ParentPackage("pit")
public class ExamenAction extends ActionSupport{
	
	private List<CarreraDTO> lstCarrera;
	private List<CicloDTO> lstCiclo;
	private List<CursoDTO> lstCurso;
	
	private CursoDTO curso;
	private CarreraDTO carrera;
	private CicloDTO ciclo;
	private int codcarrera,codciclo;
	
	@Action(value="/t_examen",results={
			@Result(name="ok",type="tiles",location="t_examen")
	})
	public String cargarRegistro(){
		lstCarrera = new CursoService().listarCarrera();
		lstCiclo = new CursoService().listarCiclo();
		return "ok";
	}
	
	@Action(value="/listarCursos",results={
			@Result(name="listar",type="json")
	})
	public String listarCursos(){
		lstCurso = new CursoService().listarCursoxCiclo(curso.getCodciclo());
		return "listar";
	}
	
	public List<CarreraDTO> getLstCarrera() {
		return lstCarrera;
	}

	public void setLstCarrera(List<CarreraDTO> lstCarrera) {
		this.lstCarrera = lstCarrera;
	}

	public CursoDTO getCurso() {
		return curso;
	}

	public void setCurso(CursoDTO curso) {
		this.curso = curso;
	}

	public int getCodcarrera() {
		return codcarrera;
	}

	public void setCodcarrera(int codcarrera) {
		this.codcarrera = codcarrera;
	}

	public List<CicloDTO> getLstCiclo() {
		return lstCiclo;
	}

	public void setLstCiclo(List<CicloDTO> lstCiclo) {
		this.lstCiclo = lstCiclo;
	}

	public int getCodciclo() {
		return codciclo;
	}

	public void setCodciclo(int codciclo) {
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
	
}
