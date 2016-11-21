package interfaces;

import java.util.List;

import beans.PersonaDTO;

public interface PersonaDAO {
	
	public List<PersonaDTO> listarPersonas(int perfil);
	public int registrarPersona(PersonaDTO obj);
	public int modificarPersona(PersonaDTO obj);
}
