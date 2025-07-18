package com.cibertec.dao;

import java.util.List;

import com.cibertec.beans.PerfilBean;
import com.cibertec.beans.PersonaDTO;

public interface PersonaDAO {
	
	public List<PerfilBean> listarPerfilesDePersona(int personaId);
	public void modificarDatosDePersona(PersonaDTO persona);
	
	/*public List<PersonaDTO> listarP(int perfil);
	public List<PersonaDTO> listarPersonas(Map<String,Object> numListar);
	public int registrarPersona(PersonaDTO obj,int perfil);
	public int modificarPersona(PersonaDTO obj,int perfil);
	public PersonaDTO buscarEstudiante(int cod);*/
}
