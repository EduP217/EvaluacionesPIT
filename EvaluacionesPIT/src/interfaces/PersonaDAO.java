package interfaces;

import java.util.List;

import beans.PersonaDTO;

public interface PersonaDAO {
	
	public List<PersonaDTO> listarPersonas(int perfil);
	
}
