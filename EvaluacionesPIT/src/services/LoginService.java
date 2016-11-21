package services;

import java.util.List;

import beans.PersonaDTO;
import beans.EnlaceDTO;
import beans.UsuarioDTO;
import dao.DAOFactory;
import interfaces.UsuarioDAO;
import utils.Constantes;

public class LoginService {
	
	DAOFactory fabrica = DAOFactory.getDAOFactory(Constantes.ORIGEN_DATOS);
	UsuarioDAO dao = fabrica.getUsuarioDAO();
	
	public UsuarioDTO IniciarSesion(UsuarioDTO obj) {
		return dao.IniciarSesion(obj);
	}	
	public List<EnlaceDTO> MostrarEnlacesUsuario(int codigo) {
		return dao.MostrarEnlacesUsuario(codigo);
	}
	public PersonaDTO datosUsuario(int codigo,int perfil) {
		return dao.datosUsuario(codigo,perfil);
	}
	public int registrarUsuario(UsuarioDTO obj) {
		return dao.registrarUsuario(obj);
	}
	public UsuarioDTO buscarUsuario(String usuario) {
		return dao.buscarUsuario(usuario);
	}
	public int modificarUsuario(UsuarioDTO obj) {
		return dao.modificarUsuario(obj);
	}
}
