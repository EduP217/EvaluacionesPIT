package services;

import java.util.List;
import java.util.Map;

import beans.PersonaDTO;
import dao.DAOFactory;
import interfaces.CursoDAO;
import interfaces.PersonaDAO;
import utils.Constantes;

public class PersonaService {
	DAOFactory fabrica = DAOFactory.getDAOFactory(Constantes.ORIGEN_DATOS);
	PersonaDAO dao = fabrica.getPersonaDAO();
	
	public List<PersonaDTO> listarP(int perfil) {
		return dao.listarP(perfil);
	}	
	public List<PersonaDTO> listarPersonas(Map<String, Object> numListar) {
		return dao.listarPersonas(numListar);
	}
	public int registrarPersona(PersonaDTO obj,int perfil) {
		return dao.registrarPersona(obj,perfil);
	}
	public int modificarPersona(PersonaDTO obj,int perfil) {
		return dao.modificarPersona(obj,perfil);
	}
}
