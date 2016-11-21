package action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import beans.PersonaDTO;
import beans.UsuarioDTO;
import services.LoginService;
import services.PersonaService;

@ParentPackage("pit")
public class mUsuarioAction extends ActionSupport{

	private List<PersonaDTO> lstPersona = null;
	private PersonaDTO persona;
	private int codigo;
	private String mensaje;
	private String mensajeError;
	private String apellido,nombre,dni,fechanac,telefono,celular,estado;
	
	@Action(value="/m_profesor",results={
			@Result(name="ok",type="tiles",location="m_profesor")
	})
	public String listarProfesores(){
		lstPersona = new PersonaService().listarPersonas(3);
		return "ok";
	}
	
	@Action(value="/regProf",results={
			@Result(name="grabo",type="tiles",location="m_profesor"),
			@Result(name="error",type="tiles",location="m_profesor")
	})
	public String registrarProfesor(){
		if(persona.getDni().length()!=7){
			mensajeError = "El DNI debe tener 7 caracteres";
			listarProfesores();
			return "error";
		}
		UsuarioDTO objUsu = new UsuarioDTO();
		objUsu.setUsuario(persona.getDni());
		objUsu.setClave("123456");
		objUsu.setUrlFoto("avatar-user.png");
		objUsu.setIdperfil(3);
		new LoginService().registrarUsuario(objUsu);
		UsuarioDTO idUsuario = new LoginService().IniciarSesion(objUsu);
		if(idUsuario==null){
			mensajeError = "Error al registrar Usuario";
			listarProfesores();
			return "error";
		}
		persona.setIdusuario(idUsuario.getCodigo());
		new PersonaService().registrarPersona(persona);
		mensaje = "Se registr� correctamente";
		listarProfesores();
		return "grabo";
	}
	
	@Action(value="/updProf",results={
			@Result(name="grabo",type="tiles",location="m_profesor"),
			@Result(name="error",type="tiles",location="m_profesor")
	})
	public String updateProfesor(){
		/*if(persona.getDni().length()!=7){
			mensajeError = "El DNI debe tener 7 caracteres";
			listarProfesores();
			return "error";
		}
		UsuarioDTO objUsu = new LoginService().buscarUsuario(dni);
		if(objUsu==null){
			mensajeError = "Error al encontrar usuario";
			listarProfesores();
			return "error";
		}
		objUsu.setEstado(estado);		
		new LoginService().modificarUsuario(objUsu);
		new PersonaService().modificarPersona(persona);*/
		mensaje = "Se actualizaron los datos correctamente"+
				  persona.getCodigo()+"-"+persona.getApellido()+"-"+persona.getNombre()+"-"+
				  persona.getDni()+"-"+persona.getFechanac()+"-"+persona.getTelefono()+"-"+persona.getCelular()+"-"+persona.getEstado();
		listarProfesores();
		return "grabo";
	}
	
	public List<PersonaDTO> getLstPersona() {
		return lstPersona;
	}
	public void setLstPersona(List<PersonaDTO> lstPersona) {
		this.lstPersona = lstPersona;
	}

	public PersonaDTO getPersona() {
		return persona;
	}

	public void setPersona(PersonaDTO persona) {
		this.persona = persona;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getFechanac() {
		return fechanac;
	}

	public void setFechanac(String fechanac) {
		this.fechanac = fechanac;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public String getMensajeError() {
		return mensajeError;
	}

	public void setMensajeError(String mensajeError) {
		this.mensajeError = mensajeError;
	}

	
}
