package com.cibertec.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import com.cibertec.beans.PersonaDTO;
import com.cibertec.beans.CursoDTO;
import com.cibertec.beans.EnlaceDTO;
import com.cibertec.beans.UsuarioDTO;
import com.cibertec.services.CursoService;
import com.cibertec.services.LoginService;

@ParentPackage("pit")
@Namespace("/")
public class SesionAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	private Map<String,Object> sesion = ActionContext.getContext().getSession();
	private String usuario, clave;
	
	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	@Action(value = "iniciarSesion",results = {
		@Result(name = SUCCESS, type = "tiles", location = "t_intranet"),
		@Result(name = ERROR, type = "tiles", location = "t_login")
	})
	public String IniciarSesion(){
		UsuarioDTO user = new LoginService().IniciarSesion(usuario, clave);
		
		if(user == null){
			return ERROR;
		} else {
			/*PersonaDTO persona = new LoginService().datosUsuario(usuario.getCodigo(),usuario.getIdperfil());
			List<CursoDTO> cursos = new CursoService().listarCursos(usuario.getCodigo());
			List<EnlaceDTO> enlaces = new LoginService().MostrarEnlacesUsuario(usuario.getCodigo());
			List<EnlaceDTO> mantenimiento = new ArrayList<EnlaceDTO>();
			List<EnlaceDTO> consultas = new ArrayList<EnlaceDTO>();
			List<EnlaceDTO> registros = new ArrayList<EnlaceDTO>();
			
			for(EnlaceDTO bean:enlaces){
				if(bean.getEnlace().startsWith("m")){
					mantenimiento.add(bean);
				} else if(bean.getEnlace().startsWith("c")){
					consultas.add(bean);
				} else if(bean.getEnlace().startsWith("t")){
					registros.add(bean);
				} else {
					
				}
			}			
			if(usuario.getEstado().equals("1")){
				usuario.setEstado("Matriculado");
			} else {
				usuario.setEstado("No est� matriculado");
			}*/
			sesion.put("user", user);
			/*sesion.put("keyDatosUsuario", persona);
			sesion.put("keyCursos", cursos);
			sesion.put("keyPermisosM", mantenimiento);
			sesion.put("keyPermisosC", consultas);
			sesion.put("keyPermisosT", registros);*/
			
			return SUCCESS;
		}
	}
	
	@Action(value = "cerrarSesion", results={
		@Result(name = SUCCESS, type = "tiles", location = "t_login")
	})
	public String CerrarSesion(){
		SessionMap sesionActiva = (SessionMap) sesion;
		sesionActiva.invalidate();
		return SUCCESS;
	}
	
	@Action(value = "dashboard", results = {
	    @Result(name = SUCCESS, type = "tiles", location = "t_intranet"),
		@Result(name = ERROR, type = "tiles", location = "t_login")
	})
	public String dashboard() {
		UsuarioDTO user = (UsuarioDTO) sesion.get("user");
		
		if (user == null) {
			return ERROR;
		}
		
	    return SUCCESS;
	}
	
}
