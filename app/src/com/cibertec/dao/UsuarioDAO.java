package com.cibertec.dao;

import java.util.List;

import com.cibertec.beans.PersonaDTO;
import com.cibertec.beans.EnlaceDTO;
import com.cibertec.beans.UsuarioDTO;

public interface UsuarioDAO {

	public UsuarioDTO IniciarSesion(String usuario, String clave);
	/*public List<EnlaceDTO> MostrarEnlacesUsuario(int codigo);
	public PersonaDTO datosUsuario(int codigo, int perfil);
	public UsuarioDTO buscarUsuario(String usuario);
	public int registrarUsuario(UsuarioDTO obj);
	public int modificarUsuario(UsuarioDTO obj);*/
	
}
