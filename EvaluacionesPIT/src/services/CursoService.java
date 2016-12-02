package services;

import java.util.List;

import beans.CarreraDTO;
import beans.CicloDTO;
import beans.CursoDTO;
import dao.DAOFactory;
import interfaces.CursoDAO;
import utils.Constantes;

public class CursoService {
	
	DAOFactory fabrica = DAOFactory.getDAOFactory(Constantes.ORIGEN_DATOS);
	CursoDAO dao = fabrica.getCursoDAO();
	
	public List<CursoDTO> listarCursoxCiclo(int ciclo) {
		return dao.listarCursoxCiclo(ciclo);
	}
	public List<CursoDTO> listarCursos(int idusuario) {
		return dao.listarCursos(idusuario);
	}
	public List<CarreraDTO> listarCarrera() {
		return dao.listarCarrera();
	}
	public List<CicloDTO> listarCiclo() {
		return dao.listarCiclo();
	}
	public List<CursoDTO> listarCurso() {
		return dao.listarCurso();
	}
	public List<CursoDTO> listarCursoPaginacion(int numpag) {
		return dao.listarCursoPaginacion(numpag);
	}
	public CursoDTO buscarCurso(CursoDTO beanCurso, int condicion) {
		return dao.buscarCurso(beanCurso,condicion);
	}
	public int registrarCurso(CursoDTO obj) {
		return dao.registrarCurso(obj);
	}
	public int modificarCurso(CursoDTO obj) {
		return dao.modificarCurso(obj);
	}
	public int eliminarCurso(int codigo) {
		return dao.eliminarCurso(codigo);
	}
}
