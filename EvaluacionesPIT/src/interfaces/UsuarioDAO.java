package interfaces;

import java.util.List;

import beans.AdministradorDTO;
import beans.DocenteDTO;
import beans.EnlaceDTO;
import beans.EstudianteDTO;
import beans.UsuarioDTO;

public interface UsuarioDAO {

	public UsuarioDTO IniciarSesion(UsuarioDTO obj);
	public List<EnlaceDTO> MostrarEnlacesUsuario(int codigo);
	public AdministradorDTO datosUsuario(int codigo);
	public DocenteDTO datosUsuario2(int codigo);
	public EstudianteDTO datosUsuario3(int codigo);
}
