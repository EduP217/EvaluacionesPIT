package com.cibertec.dao.mysql;

import com.cibertec.dao.CursoDAO;
import com.cibertec.dao.DAOFactory;
import com.cibertec.dao.EnlaceDAO;
import com.cibertec.dao.PersonaDAO;
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

	@Override
	public PersonaDAO personaDAO() {
		return new MySQLPersonaDAO();
	}

	@Override
	public EnlaceDAO enlaceDAO() {
		return new MySQLEnlaceDAO();
	}

	/*@Override
	public SeccionDAO getSeccionDAO() {
		return new MySqlSeccionDAO();
	}

	@Override
	public ExamenDAO getExamenDAO() {
		return new ExamenDAOImpl();
	}*/

}
