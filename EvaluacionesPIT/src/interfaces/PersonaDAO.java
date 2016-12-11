package interfaces;

import java.util.List;
import java.util.Map;

import beans.PersonaDTO;

public interface PersonaDAO {
	
	public List<PersonaDTO> listarP(int perfil);
	public List<PersonaDTO> listarPersonas(Map<String,Object> numListar);
	public int registrarPersona(PersonaDTO obj,int perfil);
	public int modificarPersona(PersonaDTO obj,int perfil);
	public PersonaDTO buscarEstudiante(int cod);
}
