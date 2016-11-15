package action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import beans.AdministradorDTO;
import beans.DocenteDTO;
import beans.EnlaceDTO;
import beans.EstudianteDTO;
import beans.UsuarioDTO;
import services.LoginService;

@ParentPackage("pit")
public class SesionAction extends ActionSupport{
	
	private String usuario,clave;
	private Map<String,Object> sesion = ActionContext.getContext().getSession();
	private UsuarioDTO obj = null;
	
	@Action(value="/IniciarSesion",results={
			@Result(name="ok",type="tiles",location="t_intranet"),
			@Result(name="error",type="tiles",location="t_login")
	})
	
	public String IniciarSesion(){
		obj = new UsuarioDTO();
		obj.setUsuario(usuario);
		obj.setClave(clave);
		UsuarioDTO usuario = new LoginService().IniciarSesion(obj);
		
		if(usuario==null){
			return "error";
		} else {
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
			
			sesion.put("keyUsuario", usuario);
			sesion.put("keyPermisosM", mantenimiento);
			sesion.put("keyPermisosC", consultas);
			sesion.put("keyPermisosT", registros);
			
			switch(usuario.getIdperfil()){
			case 1:
				AdministradorDTO admin = new LoginService().datosUsuario(usuario.getCodigo());
				sesion.put("keyDatosUsuario", admin);
				break;
			case 2:
				EstudianteDTO alumno = new LoginService().datosUsuario3(usuario.getCodigo());
				sesion.put("keyDatosUsuario", alumno);
				break;
			case 3:
				DocenteDTO docente = new LoginService().datosUsuario2(usuario.getCodigo());
				sesion.put("keyDatosUsuario", docente);
				break;
			case 4:
				DocenteDTO docenteCoordinador = new LoginService().datosUsuario2(usuario.getCodigo());
				sesion.put("keyDatosUsuario", docenteCoordinador);
				break;
			}
			
			return "ok";
		}
	}
	
	@Action(value="/CerrarSesion",results={
			@Result(name="ok",type="tiles",location="t_login")
	})
	
	public String CerrarSesion(){
		SessionMap sesionActual = (SessionMap) ActionContext.getContext().getSession();
		sesionActual.invalidate();
		return "ok";
	}
	
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

	
	
}
