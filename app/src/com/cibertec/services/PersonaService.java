package com.cibertec.services;

import java.util.List;

import com.cibertec.beans.PerfilBean;
import com.cibertec.beans.PersonaDTO;
import com.cibertec.dao.DAOFactory;
import com.cibertec.dao.PersonaDAO;


public class PersonaService {
	
	DAOFactory fabrica = DAOFactory.factory();
	PersonaDAO dao = fabrica.personaDAO();
	
	public List<PerfilBean> listarPerfilesDePersona(int personaId) {
		return dao.listarPerfilesDePersona(personaId);
	}
	
	public void modificarDatosDePersona(PersonaDTO persona) {
		dao.modificarDatosDePersona(persona);
	}
	
	/*public List<PersonaDTO> listarP(int perfil) {
		return dao.listarP(perfil);
	}	
	public List<PersonaDTO> listarPersonas(Map<String, Object> numListar) {
		return dao.listarPersonas(numListar);
	}
	public int registrarPersona(PersonaDTO obj,int perfil) {
		return dao.registrarPersona(obj,perfil);
	}
	public PersonaDTO buscarEstudiante(int cod) {
		return dao.buscarEstudiante(cod);
	}*/
}
