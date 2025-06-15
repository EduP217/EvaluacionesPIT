package com.cibertec.services;

import java.util.List;

import com.cibertec.beans.CarreraBean;
import com.cibertec.beans.CursoDTO;
import com.cibertec.dao.CursoDAO;
import com.cibertec.dao.DAOFactory;
import com.cibertec.utils.Constantes;

public class CursoService {
	
	DAOFactory fabrica = DAOFactory.factory();
	CursoDAO dao = fabrica.cursoDAO();

	public List<CursoDTO> listarCursos() {
		return dao.listarCursos();
	}
	public List<CursoDTO> filtrarCursosByPersona(int personaId, int estadoId) {
		return dao.filtrarCursosByPersona(personaId, estadoId);
	}
	/*public List<CursoDTO> listarCursoxCiclo(int ciclo) {
		return dao.listarCursoxCiclo(ciclo);
	}
	public List<CarreraBean> listarCarrera() {
		return dao.listarCarrera();
	}
	public List<CicloDTO> listarCiclo() {
		return dao.listarCiclo();
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
	public List<CursoDTO> listarCursoxSeccion(int codigo) {
		return dao.listarCursoxSeccion(codigo);
	}*/
}
