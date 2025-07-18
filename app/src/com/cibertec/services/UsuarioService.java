package com.cibertec.services;

import java.util.List;

import com.cibertec.beans.PersonaDTO;
import com.cibertec.beans.EnlaceDTO;
import com.cibertec.beans.UsuarioDTO;
import com.cibertec.dao.DAOFactory;
import com.cibertec.dao.UsuarioDAO;
import com.cibertec.utils.Constantes;

public class UsuarioService {
	
	DAOFactory fabrica = DAOFactory.factory();
	UsuarioDAO dao = fabrica.usuarioDAO();
	
	public UsuarioDTO IniciarSesion(String usuario, String clave) {
		return dao.IniciarSesion(usuario, clave);
	}
	public void modificarDatosDeUsuario(UsuarioDTO usuario) {
		dao.modificarDatosDeUsuario(usuario);
	}
	/*public List<EnlaceDTO> MostrarEnlacesUsuario(int codigo) {
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
	*/
}
