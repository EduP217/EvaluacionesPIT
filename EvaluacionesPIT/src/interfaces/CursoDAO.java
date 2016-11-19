package interfaces;

import java.util.List;

import beans.CursoDTO;

public interface CursoDAO {
	
	public List<CursoDTO> listarCursos(int idusuario);
	public List<CursoDTO> listarCursoXseccion(String seccion);

}
