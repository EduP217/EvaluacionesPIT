package com.cibertec.action;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.cibertec.beans.EnlaceDTO;
import com.cibertec.beans.FileBean;
import com.cibertec.beans.PerfilBean;
import com.cibertec.beans.UsuarioDTO;
import com.cibertec.services.EnlaceService;
import com.cibertec.services.PersonaService;
import com.cibertec.services.UsuarioService;
import com.cibertec.utils.SesionUtils;
import com.cibertec.utils.StorageUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


@ParentPackage("pit")
public class PerfilAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	private static final Logger logger = Logger.getLogger(PerfilAction.class);
	
	private Map<String,Object> sesion;
	
	private static final String STORAGE_DIR = "C:/pit/uploads/users/";
	//private static final String STORAGE_DIR = "/var/miapp/uploads/users/";
	
	private int personaPerfil;
	
	private UsuarioDTO datosDeUsuario;
	
	private FileBean avatarDeUsuario;
	
	public int getPersonaPerfil() {
		return personaPerfil;
	}

	public void setPersonaPerfil(int personaPerfil) {
		this.personaPerfil = personaPerfil;
	}

	public PerfilAction() {
		sesion = ActionContext.getContext().getSession();
	}

	public UsuarioDTO getDatosDeUsuario() {
		return datosDeUsuario;
	}

	public void setDatosDeUsuario(UsuarioDTO datosDeUsuario) {
		this.datosDeUsuario = datosDeUsuario;
	}

	public FileBean getAvatarDeUsuario() {
		return avatarDeUsuario;
	}

	public void setAvatarDeUsuario(FileBean avatarDeUsuario) {
		this.avatarDeUsuario = avatarDeUsuario;
	}
	
	@Action(value = "cambiar-perfil",results = {
			@Result(name = SUCCESS, type = "tiles", location = "t_intranet"),
			@Result(name = ERROR, type = "tiles", location = "t_intranet")
	})
	public String CambiarPerfil() {
		UsuarioDTO user = (UsuarioDTO) sesion.get("user");
		
		if(user == null  || user.getPersona() == null || user.getPersona().getPerfiles() == null){
			return ERROR;
		}
		
		List<PerfilBean> userPerfiles = user.getPersona().getPerfiles();
		
		PerfilBean perfilActive = SesionUtils.encontrarPerfilActivo(userPerfiles);
		
		if(perfilActive == null) {
			return ERROR;
		}
		
		perfilActive.setActive(0);
		perfilActive.setEnlaces(null);
		
		PerfilBean newPerfilActive = SesionUtils.encontrarPerfilPorId(userPerfiles, personaPerfil);
		
		if(newPerfilActive == null) {
			return ERROR;
		}
		
		List<EnlaceDTO> enlaces = new EnlaceService().listarEnlacesDePerfil(personaPerfil);
		enlaces = SesionUtils.establecerJerarquiaDeEnlaces(enlaces);

		newPerfilActive.setEnlaces(enlaces);
		newPerfilActive.setActive(1);
			
		sesion.put("perfil", newPerfilActive);
		
		return SUCCESS;
	}
	
	@Action(value = "configuracion-cuenta", results = {
			@Result(name = SUCCESS, type = "tiles", location = "t_configuracion_cuenta")
	})
	public String mostrarConfiguracionCuenta() {
	    return SUCCESS;
	}
	
	@Action(value = "guardar-configuracion-cuenta", results = {
			@Result(name = SUCCESS, type = "tiles", location = "t_configuracion_cuenta"),
			@Result(name = ERROR, type = "tiles", location = "t_configuracion_cuenta")
	})
	public String guardarConfiguracionCuenta() {
		try {
			if (datosDeUsuario == null) {
				logger.error("No existen los datos del usuario.");
				return ERROR;				
			}
			
			UsuarioDTO user = (UsuarioDTO) sesion.get("user");
			user.setUsuario(datosDeUsuario.getUsuario());
			user.getPersona().setApellidos(datosDeUsuario.getPersona().getApellidos());
			user.getPersona().setNombres(datosDeUsuario.getPersona().getNombres());
			user.getPersona().setFechaNacimiento(datosDeUsuario.getPersona().getFechaNacimiento());
			user.getPersona().setTelefono(datosDeUsuario.getPersona().getTelefono());
			
			if (avatarDeUsuario != null) {
				String avatarURL = user.getPersona().getIdentificador() + "." + StorageUtils.getFileExtension(avatarDeUsuario.getFileFileName());
				File destinationFile = new File(STORAGE_DIR, avatarURL);
				FileUtils.copyFile(avatarDeUsuario.getFile(), destinationFile);
				
				user.setImagenURL("/storage/users/" + avatarURL);
			}
			
			UsuarioService usuarioService = new UsuarioService();
			usuarioService.modificarDatosDeUsuario(user);
			
			PersonaService personaService = new PersonaService();
			personaService.modificarDatosDePersona(user.getPersona());
			
		    return SUCCESS;
		} catch (Exception e) {
			logger.error(e);
			return ERROR;
		}
	}
}
