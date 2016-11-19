package services;

import java.util.List;

import beans.CursoDTO;
import dao.DAOFactory;
import interfaces.CursoDAO;
import utils.Constantes;

public class CursoService {
	
	DAOFactory fabrica = DAOFactory.getDAOFactory(Constantes.ORIGEN_DATOS);
	CursoDAO dao = fabrica.getCursoDAO();
	
	public List<CursoDTO> listarCursoXseccion(String seccion) {
		return dao.listarCursoXseccion(seccion);
	}
	public List<CursoDTO> listarCursos(int idusuario) {
		return dao.listarCursos(idusuario);
	}
}
