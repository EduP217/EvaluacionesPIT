package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import beans.UsuarioDTO;
import services.LoginService;
import utils.Constantes;

@ParentPackage("pit")
public class DatosAction extends ActionSupport implements ServletRequestAware{
	private UsuarioDTO objUsuario;
	private File avatar;
	private String usuario;
	private int codigo;
	
	private HttpServletRequest servletRequest;
	
	@Action(value="/modAvatar",results={
			@Result(name="ok",type="tiles",location="t_intranet")
	})
	public String modAvatar() throws IOException{
		File f = objUsuario.getFoto();
		String url = objUsuario.getUsuario()+".png";
		UsuarioDTO usu = new LoginService().buscarUsuario(objUsuario.getUsuario());
		usu.setUrlFoto(url);
		new LoginService().modificarUsuario(usu);
		String destPath = servletRequest.getSession().getServletContext().getRealPath("/");
		File destFile = new File(destPath,url);
		FileUtils.copyFile(f, destFile);
		System.out.println(destPath+url);
		return "ok";
	}
	
	public UsuarioDTO getObjUsuario() {
		return objUsuario;
	}
	public void setObjUsuario(UsuarioDTO objUsuario) {
		this.objUsuario = objUsuario;
	}
	public File getAvatar() {
		return avatar;
	}
	public void setAvatar(File avatar) {
		this.avatar = avatar;
	}
	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.servletRequest = arg0;
	}
			
}
