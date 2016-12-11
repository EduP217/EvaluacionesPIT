package interfaces;

import java.util.List;

import beans.CarreraDTO;
import beans.CicloDTO;
import beans.CursoDTO;
import beans.PersonaDTO;

public interface CursoDAO {
	
	public List<CarreraDTO> listarCarrera();
	public List<CicloDTO> listarCiclo();
	public List<CursoDTO> listarCurso();
	public List<CursoDTO> listarCursoPaginacion(int numpag);
	public List<CursoDTO> listarCursos(int idusuario);	
	public List<CursoDTO> listarCursoxCiclo(int ciclo);
	public List<CursoDTO> listarCursoxSeccion(int codigo);
	public CursoDTO buscarCurso(CursoDTO beanCurso, int condicion);
	public int registrarCurso(CursoDTO obj);
	public int modificarCurso(CursoDTO obj);
	public int eliminarCurso(int codigo);
}
