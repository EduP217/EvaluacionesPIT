package interfaces;

import java.util.List;

import beans.PersonaDTO;
import beans.EnlaceDTO;
import beans.UsuarioDTO;

public interface UsuarioDAO {

	public UsuarioDTO IniciarSesion(UsuarioDTO obj);
	public List<EnlaceDTO> MostrarEnlacesUsuario(int codigo);
	public PersonaDTO datosUsuario(int codigo, int perfil);
	public UsuarioDTO buscarUsuario(String usuario);
	public int registrarUsuario(UsuarioDTO obj);
	public int modificarUsuario(UsuarioDTO obj);
	
}
