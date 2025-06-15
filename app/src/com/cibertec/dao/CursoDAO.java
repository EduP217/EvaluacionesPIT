package com.cibertec.dao;

import java.util.List;

import com.cibertec.beans.CarreraBean;
import com.cibertec.beans.CursoDTO;
import com.cibertec.beans.PersonaDTO;

public interface CursoDAO {

	public List<CursoDTO> listarCursos();
	public List<CursoDTO> filtrarCursosByPersona(int personaId, int estadoId);	
	/*public List<CarreraBean> listarCarrera();
	public List<CicloDTO> listarCiclo();
	public List<CursoDTO> listarCursoPaginacion(int numpag);*/
	/*public List<CursoDTO> listarCursoxCiclo(int ciclo);
	public List<CursoDTO> listarCursoxSeccion(int codigo);
	public CursoDTO buscarCurso(CursoDTO beanCurso, int condicion);
	public int registrarCurso(CursoDTO obj);
	public int modificarCurso(CursoDTO obj);
	public int eliminarCurso(int codigo);*/
}
