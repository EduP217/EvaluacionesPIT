package action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import beans.CicloDTO;
import beans.CursoDTO;
import beans.DetalleCurSeccionDTO;
import beans.DetalleSeccionAlum;
import beans.PersonaDTO;
import beans.SeccionDTO;
import beans.UsuarioDTO;
import services.CursoService;
import services.LoginService;
import services.PersonaService;
import services.SeccionService;

@ParentPackage("pit")
public class AlumnoAction extends ActionSupport{

	Map<String,Object> numListar = new HashMap<String,Object>();
	private List<PersonaDTO> lista = new PersonaService().listarP(2);
	private List<PersonaDTO> lstPersona = null;
	private List<SeccionDTO> lstSeccionAlum;
	private PersonaDTO persona;
	private int codigo;
	private String mensaje;
	private String mensajeError;
	private String apellido,nombre,dni,fechanac,telefono,celular,estado,codAlumno,codSeccionAlum;
	private int cantpaginas,numpagina,pagselect;
	
	@Action(value="/m_alumno",results={
			@Result(name="ok",type="tiles",location="m_alumno")
	})
	public String listarAlumnos(){
		numpagina = 0;
		pagselect = 1;
		numListar.put("perfil", 2);
		numListar.put("numpag", numpagina);
		lstPersona = new PersonaService().listarPersonas(numListar);
		lstSeccionAlum = new SeccionService().listarSecciones();
		cantpaginas = (int) Math.ceil(lista.size()/5)+1;
		return "ok";
	}
	@Action(value="/PagAlm",results={
			@Result(name="ok",type="tiles",location="m_alumno")
	})
	public String Pag(){
		pagselect = numpagina;
		numListar.put("perfil", 2);
		numListar.put("numpag", (numpagina-1)*5);
		lstPersona = new PersonaService().listarPersonas(numListar);
		cantpaginas = (int) Math.ceil(lista.size()/5)+1;
		return "ok";
	}
	
	@Action(value="/regAlum",results={
			@Result(name="grabo",type="tiles",location="m_alumno"),
			@Result(name="error",type="tiles",location="m_alumno")
	})
	public String registrarAlumno(){
		if(persona.getDni().length()!=8){
			mensajeError = "El DNI debe tener 8 caracteres";
			listarAlumnos();
			return "error";
		}
		UsuarioDTO objUsu = new LoginService().buscarUsuario(persona.getDni());
		if(objUsu!=null){
			mensajeError = "Ya existe un usuario registrado con el DNI "+ persona.getDni();
			listarAlumnos();
			return "error";
		} else {
			objUsu = new UsuarioDTO();	
			objUsu.setUsuario(persona.getDni());
			objUsu.setClave("123456");
			objUsu.setUrlFoto("avatar-user.png");
			objUsu.setIdperfil(2);		
		}
		new LoginService().registrarUsuario(objUsu);
		UsuarioDTO idUsuario = new LoginService().IniciarSesion(objUsu);
		if(idUsuario==null){
			mensajeError = "Error al registrar Usuario";
			listarAlumnos();
			return "error";
		}
		persona.setIdusuario(idUsuario.getCodigo());
		new PersonaService().registrarPersona(persona,2);
		mensaje = "Se registró correctamente";
		listarAlumnos();
		return "grabo";
	}
	
	@Action(value="/updAlum",results={
			@Result(name="grabo",type="tiles",location="m_alumno"),
			@Result(name="error",type="tiles",location="m_alumno")
	})
	public String updateAlumno(){
		UsuarioDTO objUsu = new LoginService().buscarUsuario(persona.getDni());
		if(objUsu==null){
			mensajeError = "Error al encontrar usuario";
			listarAlumnos();
			return "error";
		}
		objUsu.setEstado(persona.getEstado());
		new LoginService().modificarUsuario(objUsu);
		new PersonaService().modificarPersona(persona,2);
		mensaje = "Se actualizaron los datos correctamente";
		listarAlumnos();
		return "grabo";
	}
	
	@Action(value="/dropAlum",results={
			@Result(name="grabo",type="tiles",location="m_alumno"),
			@Result(name="error",type="tiles",location="m_alumno")
	})
	public String deleteProfesor(){
		UsuarioDTO objUsu = new LoginService().buscarUsuario(dni);
		if(objUsu==null){
			mensajeError = "Error al encontrar usuario";
			listarAlumnos();
			return "error";
		}
		objUsu.setEstado("0");
		new LoginService().modificarUsuario(objUsu);	
		mensaje = "Se dió de baja correctamente";	
		listarAlumnos();
		return "grabo";
	}
	
	/*@Action(value="/buscCursosAlum",results={
			@Result(name="ok",type="json",location="m_alumno")
	})
	public String buscCursosAlum(){	
		listarAlumnos();
		sesion.put("keylstCursoAlum", new CursoService().listarCursoxCiclo(Integer.parseInt(codCicloAlum)));
		return "ok";
	}*/
	
	@Action(value="/matriAlum",results={
			@Result(name="ok",type="tiles",location="m_alumno"),
			@Result(name="error",type="tiles",location="m_alumno")
	})
	public String matriAlum(){
		PersonaDTO objEstudiante = new PersonaService().buscarEstudiante(Integer.parseInt(codAlumno));
		//DetalleSeccionAlum beanData = new DetalleSeccionAlum();
		DetalleSeccionAlum beanData = new DetalleSeccionAlum();
		beanData.setIdseccion(Integer.parseInt(codSeccionAlum));
		beanData.setIdusuario(objEstudiante.getIdusuario());
		DetalleSeccionAlum objValid = new SeccionService().buscarDetalle(beanData);
		if(objValid==null){
			new SeccionService().registrarDetalleUsuario(beanData);
		} else {
			new SeccionService().updateDetalleUsuario(beanData);
		}
		/*List<DetalleCurSeccionDTO> data = new SeccionService().listarSeccion4(Integer.parseInt(codCursoAlum));
		PersonaDTO objEstudiante = new PersonaService().buscarEstudiante(Integer.parseInt(codAlumno));
		int codSeccion = 0;
		if(data==null){
			CursoDTO cur = new CursoService().buscarCurso(null,Integer.parseInt(codCursoAlum));
			List<SeccionDTO> listaSec = new SeccionService().listarSeccion2(cur.getCodciclo());
			//int numAleatorio=(int)Math.floor(Math.random()*(1-(listaSec.size()+1))+(listaSec.size()));
			if(listaSec.size()>1){
				codSeccion = listaSec.get(1).getCodigo();	
			} else {
				codSeccion = listaSec.get(0).getCodigo();
			}
		} else {
			for(DetalleCurSeccionDTO d:data){
				if(d.getCodusu()==0){
					codSeccion=d.getCodseccion();
				}
			}			
		}
		if(codSeccion!=0){
			DetalleCurSeccionDTO newDeta = new DetalleCurSeccionDTO();
			newDeta.setCodcur(Integer.parseInt(codCursoAlum));
			newDeta.setCodseccion(codSeccion);
			newDeta.setCodusu(objEstudiante.getIdusuario());
			newDeta.setEstado(1);
			int result = -1;
			if(data==null){
				result = new SeccionService().registrarDetalleUsuario(newDeta);
			} else {
				result = new SeccionService().updateDetalleUsuario(newDeta);
			}			
			if(result!=1){
				listarAlumnos();
				mensajeError="Error al registrar el curso.";
				return "error";
			}
		} else {
			mensajeError="Error al encontrar Seccion.";
			return "error";
		}*/
		listarAlumnos();
		mensaje = "El alumno se matriculó correctamente al curso";
		return "ok";
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

	public int getCantpaginas() {
		return cantpaginas;
	}

	public void setCantpaginas(int cantpaginas) {
		this.cantpaginas = cantpaginas;
	}

	public int getNumpagina() {
		return numpagina;
	}

	public void setNumpagina(int numpagina) {
		this.numpagina = numpagina;
	}
	public int getPagselect() {
		return pagselect;
	}
	public void setPagselect(int pagselect) {
		this.pagselect = pagselect;
	}
	public String getCodAlumno() {
		return codAlumno;
	}
	public void setCodAlumno(String codAlumno) {
		this.codAlumno = codAlumno;
	}
	public List<SeccionDTO> getLstSeccionAlum() {
		return lstSeccionAlum;
	}
	public void setLstSeccionAlum(List<SeccionDTO> lstSeccionAlum) {
		this.lstSeccionAlum = lstSeccionAlum;
	}
	public String getCodSeccionAlum() {
		return codSeccionAlum;
	}
	public void setCodSeccionAlum(String codSeccionAlum) {
		this.codSeccionAlum = codSeccionAlum;
	}
	
}
