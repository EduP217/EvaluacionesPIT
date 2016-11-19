package services;

import java.util.List;

import beans.PersonaDTO;
import dao.DAOFactory;
import interfaces.CursoDAO;
import interfaces.PersonaDAO;
import utils.Constantes;

public class PersonaService {
	DAOFactory fabrica = DAOFactory.getDAOFactory(Constantes.ORIGEN_DATOS);
	PersonaDAO dao = fabrica.getPersonaDAO();
	
	public List<PersonaDTO> listarPersonas(int perfil) {
		return dao.listarPersonas(perfil);
	}
}
