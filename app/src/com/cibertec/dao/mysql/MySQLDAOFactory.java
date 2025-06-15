package com.cibertec.dao.mysql;

import com.cibertec.dao.CursoDAO;
import com.cibertec.dao.DAOFactory;
import com.cibertec.dao.UsuarioDAO;

public class MySQLDAOFactory extends DAOFactory {

	@Override
	public UsuarioDAO usuarioDAO() {
		return new MySQLUsuarioDAO();
	}

	@Override
	public CursoDAO cursoDAO() {		
		return new MySQLCursoDAO();
	}

	/*@Override
	public PersonaDAO getPersonaDAO() {
		return new PersonaDAOImpl();
	}

	@Override
	public SeccionDAO getSeccionDAO() {
		return new MySqlSeccionDAO();
	}

	@Override
	public ExamenDAO getExamenDAO() {
		return new ExamenDAOImpl();
	}*/

}
