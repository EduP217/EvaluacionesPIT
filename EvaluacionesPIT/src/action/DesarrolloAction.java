package action;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import services.CursoService;
import services.ExamenService;

@ParentPackage("pit")
public class DesarrolloAction extends ActionSupport{
	
	private Map<String, Object> sesion = ActionContext.getContext().getSession();
	private String codCurso;
	
	@Action(value="/cargarEvalua",results={
			@Result(name="ok",type="tiles",location="t_desarrollo")
	})
	public String cargarEvalua(){
		sesion.put("keyExamenEvalua",new ExamenService().buscarExamenxCurso(Integer.parseInt(codCurso)));
		return "ok";
	}
	
	public String getCodCurso() {
		return codCurso;
	}
	public void setCodCurso(String codCurso) {
		this.codCurso = codCurso;
	}
	
}
