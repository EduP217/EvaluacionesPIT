package com.cibertec.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.cibertec.beans.EnlaceDTO;
import com.cibertec.beans.PerfilBean;
import com.cibertec.beans.UsuarioDTO;
import com.cibertec.services.EnlaceService;
import com.cibertec.utils.SesionUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("pit")
public class PerfilAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	private Map<String,Object> sesion;
	
	private int perfilSelectedId;

	public int getPerfilSelectedId() {
		return perfilSelectedId;
	}

	public void setPerfilSelectedId(int perfilSelectedId) {
		this.perfilSelectedId = perfilSelectedId;
	}
	
	public PerfilAction() {
		sesion = ActionContext.getContext().getSession();
	}

	@Action(value = "cambiarPerfil",results = {
			@Result(name = SUCCESS, type = "tiles", location = "t_intranet"),
			@Result(name = ERROR, type = "tiles", location = "t_intranet")
	})
	public String CambiarPerfil() {
		UsuarioDTO user = (UsuarioDTO) sesion.get("user");
		
		if(user == null  || user.getPersona() == null || user.getPersona().getPerfiles() == null){
			return ERROR;
		}
		
		List<PerfilBean> userPerfiles = user.getPersona().getPerfiles();
		
		/*PerfilBean perfilActive = userPerfiles.stream()
				.filter(pp -> pp != null && pp.getActive() == 1)
				.findFirst()
				.orElse(null);
		
		if(perfilActive == null) {
			return ERROR;
		}
		
		perfilActive.setActive(0);
		perfilActive.setEnlaces(null);
		
		PerfilBean newPerfilActive = user.getPersona().getPerfiles()
				.stream().filter(pp -> pp.getPerfilId() == perfilSelectedId).findFirst().orElse(null);
		
		if(newPerfilActive == null) {
			return ERROR;
		}
		
		List<EnlaceDTO> enlaces = new EnlaceService().listarEnlacesDePerfil(perfilSelectedId);
		enlaces = SesionUtils.establecerJerarquiaDeEnlaces(enlaces);

		newPerfilActive.setEnlaces(enlaces);
		newPerfilActive.setActive(1);
			
		sesion.put("perfil", newPerfilActive);*/
		
		return SUCCESS;
	}
}
