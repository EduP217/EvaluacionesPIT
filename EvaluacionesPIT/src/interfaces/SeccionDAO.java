package interfaces;

import java.util.List;

import beans.CarreraDTO;
import beans.CicloDTO;
import beans.CursoDTO;
import beans.PersonaDTO;
import beans.SeccionDTO;

public interface SeccionDAO {
		
	public List<SeccionDTO> listarSecciones();
	public List<CursoDTO> listarCursoxSeccion(int seccion);
	public SeccionDTO buscarSeccion(int seccion);
	public int registrarSeccion(SeccionDTO obj);
	public int modificarSeccion(SeccionDTO obj);
	public int eliminarSeccion(int codigo);
	
}
