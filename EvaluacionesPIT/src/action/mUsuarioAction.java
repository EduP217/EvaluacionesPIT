package action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import beans.PersonaDTO;
import services.PersonaService;

@ParentPackage("pit")
public class mUsuarioAction extends ActionSupport{

	private List<PersonaDTO> lstPersona = null;
	
	@Action(value="/m_profesor",results={
			@Result(name="ok",type="tiles",location="m_profesor")
	})
	public String listarProfesores(){
		lstPersona = new PersonaService().listarPersonas(3);
		return "ok";
	}
	
	public List<PersonaDTO> getLstPersona() {
		return lstPersona;
	}
	public void setLstPersona(List<PersonaDTO> lstPersona) {
		this.lstPersona = lstPersona;
	}
	
}
