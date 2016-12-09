package services;

import beans.ExamenDTO;
import beans.OpcionesDTO;
import beans.PreguntaDTO;
import dao.DAOFactory;
import interfaces.CursoDAO;
import interfaces.ExamenDAO;
import utils.Constantes;

public class ExamenService {
	
	DAOFactory fabrica = DAOFactory.getDAOFactory(Constantes.ORIGEN_DATOS);
	ExamenDAO dao = fabrica.getExamenDAO();
	
	public int registrarExamen(ExamenDTO beanExa) {		
		return dao.registrarExamen(beanExa);
	}

	public int registrarPreguntas(PreguntaDTO beanPreg) {		
		return dao.registrarPreguntas(beanPreg);
	}

	public int registrarOpciones(OpcionesDTO beanOpc) {		
		return dao.registrarOpciones(beanOpc);
	}
	public int buscarCodExamen() {
		return dao.buscarCodExamen();
	}
}
