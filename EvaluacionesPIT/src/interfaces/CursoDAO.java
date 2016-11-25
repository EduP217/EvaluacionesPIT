package interfaces;

import java.util.List;

import beans.CarreraDTO;
import beans.CicloDTO;
import beans.CursoDTO;

public interface CursoDAO {
	
	public List<CarreraDTO> listarCarrera();
	public List<CicloDTO> listarCiclo();
	public List<CursoDTO> listarCursos(int idusuario);	
	public List<CursoDTO> listarCursoxCiclo(int ciclo);

}
