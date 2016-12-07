package services;

import java.util.List;

import beans.CursoDTO;
import beans.DetalleCurSeccionDTO;
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

	public int eliminarCursoSeccion(DetalleCurSeccionDTO obj) {
		return dao.eliminarCursoSeccion(obj);
	}

	public List<SeccionDTO> listarSecciones() {
		return dao.listarSecciones();
	}
	public SeccionDTO buscarSeccion2(SeccionDTO obj) {
		return dao.buscarSeccion2(obj);
	}
	public DetalleCurSeccionDTO buscarSeccion3(DetalleCurSeccionDTO obj) {
		return dao.buscarSeccion3(obj);
	}
	public int registrarDetalle(DetalleCurSeccionDTO obj) {
		return dao.registrarDetalle(obj);
	}
	public List<SeccionDTO> listarSeccion2(int codCiclo) {
		return dao.listarSeccion2(codCiclo);
	}
}
