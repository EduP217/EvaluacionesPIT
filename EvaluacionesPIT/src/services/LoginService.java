package services;

import java.util.List;

import beans.AdministradorDTO;
import beans.DocenteDTO;
import beans.EnlaceDTO;
import beans.EstudianteDTO;
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
	public AdministradorDTO datosUsuario(int codigo) {
		return dao.datosUsuario(codigo);
	}
	public DocenteDTO datosUsuario2(int codigo) {
		return dao.datosUsuario2(codigo);
	}
	public EstudianteDTO datosUsuario3(int codigo) {
		return dao.datosUsuario3(codigo);
	}
}
