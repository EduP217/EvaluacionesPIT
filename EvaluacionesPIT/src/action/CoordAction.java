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
public class CoordAction extends ActionSupport{

	private List<PersonaDTO> lstPersona = null;
	private PersonaDTO persona;
	private int codigo;
	private String mensaje;
	private String mensajeError;
	private String apellido,nombre,dni,fechanac,telefono,celular,estado;
	
	@Action(value="/m_coordi",results={
			@Result(name="ok",type="tiles",location="m_coordi")
	})
	public String listarCoordinadores(){
		lstPersona = new PersonaService().listarPersonas(4);
		return "ok";
	}
	
	@Action(value="/regCoord",results={
			@Result(name="grabo",type="tiles",location="m_coordi"),
			@Result(name="error",type="tiles",location="m_coordi")
	})
	public String registrarCoordinador(){
		if(persona.getDni().length()!=8){
			mensajeError = "El DNI debe tener 8 caracteres";
			listarCoordinadores();
			return "error";
		}
		UsuarioDTO objUsu = new LoginService().buscarUsuario(persona.getDni());
		if(objUsu!=null){
			mensajeError = "Ya existe un usuario registrado con el DNI "+ persona.getDni();
			listarCoordinadores();
			return "error";
		} else {
			objUsu = new UsuarioDTO();	
			objUsu.setUsuario(persona.getDni());
			objUsu.setClave("123456");
			objUsu.setUrlFoto("avatar-user.png");
			objUsu.setIdperfil(4);			
		}
		new LoginService().registrarUsuario(objUsu);
		UsuarioDTO idUsuario = new LoginService().IniciarSesion(objUsu);
		if(idUsuario==null){
			mensajeError = "Error al registrar Usuario";
			listarCoordinadores();
			return "error";
		}
		persona.setIdusuario(idUsuario.getCodigo());
		new PersonaService().registrarPersona(persona,4);
		mensaje = "Se registró correctamente";
		listarCoordinadores();
		return "grabo";
	}
	
	@Action(value="/updCoord",results={
			@Result(name="grabo",type="tiles",location="m_coordi"),
			@Result(name="error",type="tiles",location="m_coordi")
	})
	public String updateProfesor(){
		UsuarioDTO objUsu = new LoginService().buscarUsuario(persona.getDni());
		if(objUsu==null){
			mensajeError = "Error al encontrar usuario";
			listarCoordinadores();
			return "error";
		}
		objUsu.setEstado(persona.getEstado());
		new LoginService().modificarUsuario(objUsu);
		new PersonaService().modificarPersona(persona,4);
		mensaje = "Se actualizaron los datos correctamente";
		listarCoordinadores();
		return "grabo";
	}
	
	@Action(value="/dropCoord",results={
			@Result(name="grabo",type="tiles",location="m_coordi"),
			@Result(name="error",type="tiles",location="m_coordi")
	})
	public String deleteProfesor(){
		UsuarioDTO objUsu = new LoginService().buscarUsuario(dni);
		if(objUsu==null){
			mensajeError = "Error al encontrar usuario";
			listarCoordinadores();
			return "error";
		}
		objUsu.setEstado("0");
		new LoginService().modificarUsuario(objUsu);	
		mensaje = "Se dió de baja correctamente";	
		listarCoordinadores();
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
