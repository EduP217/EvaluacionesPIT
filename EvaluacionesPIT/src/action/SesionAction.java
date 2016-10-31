package action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import beans.EnlaceDTO;
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
		obj.setEmail(usuario);
		obj.setClave(clave);
		UsuarioDTO usuario = new LoginService().IniciarSesion(obj);
		
		if(usuario==null){
			return "error";
		} else {
			List<EnlaceDTO> enlaces = new LoginService().MostrarEnlacesUsuario(usuario.getCodigo());
			sesion.put("keyUsuario", usuario);
			sesion.put("keyPermisos", enlaces);
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
