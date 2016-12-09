package dao;

import interfaces.CursoDAO;
import interfaces.ExamenDAO;
import interfaces.PersonaDAO;
import interfaces.SeccionDAO;
import interfaces.UsuarioDAO;

public class MySqlDAOFactory extends DAOFactory {

	@Override
	public UsuarioDAO getUsuarioDAO() {
		return new MySqlUsuarioDAO();
	}

	@Override
	public CursoDAO getCursoDAO() {		
		return new MySqlCursoDAO();
	}

	@Override
	public PersonaDAO getPersonaDAO() {
		return new MySqlPersonaDAO();
	}

	@Override
	public SeccionDAO getSeccionDAO() {
		return new MySqlSeccionDAO();
	}

	@Override
	public ExamenDAO getExamenDAO() {
		return new MySqlExamenDAO();
	}	

}
