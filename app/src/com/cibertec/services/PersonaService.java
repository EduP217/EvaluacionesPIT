package com.cibertec.services;

import java.util.List;
import java.util.Map;

import com.cibertec.beans.PersonaDTO;
import com.cibertec.dao.CursoDAO;
import com.cibertec.dao.DAOFactory;
import com.cibertec.dao.PersonaDAO;
import com.cibertec.utils.Constantes;

public class PersonaService {
	/*DAOFactory fabrica = DAOFactory.getDAOFactory(Constantes.ORIGEN_DATOS);
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
	public PersonaDTO buscarEstudiante(int cod) {
		return dao.buscarEstudiante(cod);
	}*/
}
