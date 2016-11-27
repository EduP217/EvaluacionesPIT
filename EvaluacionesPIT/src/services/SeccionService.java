package services;

import java.util.List;

import beans.CursoDTO;
import beans.SeccionDTO;
import dao.DAOFactory;
import interfaces.SeccionDAO;
import utils.Constantes;

public class SeccionService {
	
	DAOFactory fabrica = DAOFactory.getDAOFactory(Constantes.ORIGEN_DATOS);
	SeccionDAO dao = fabrica.getSeccionDAO();
		
	public List<CursoDTO> listarCursoxSeccion(int seccion) {
		return dao.listarCursoxSeccion(seccion);
	}

	public SeccionDTO buscarSeccion(int seccion) {
		return dao.buscarSeccion(seccion);
	}

	public int registrarSeccion(SeccionDTO obj) {
		return dao.registrarSeccion(obj);
	}

	public int modificarSeccion(SeccionDTO obj) {
		return dao.modificarSeccion(obj);
	}

	public int eliminarSeccion(int codigo) {
		return dao.eliminarSeccion(codigo);
	}

	public List<SeccionDTO> listarSecciones() {
		return dao.listarSecciones();
	}
}
