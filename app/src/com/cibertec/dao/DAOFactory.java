package com.cibertec.dao;

import com.cibertec.dao.mysql.MySQLDAOFactory;

public abstract class DAOFactory {
	
	public static final int MYSQL = 1;
    public static final int ORACLE = 2;
    public static final int DB2 = 3;
    public static final int SQLSERVER = 4;
    public static final int XML = 5;
    
    public abstract UsuarioDAO usuarioDAO();
    public abstract CursoDAO cursoDAO();
    /*public abstract PersonaDAO personaDAO();
    public abstract SeccionDAO seccionDAO();
    public abstract ExamenDAO examenDAO();*/
    
    public static DAOFactory factory(){
    	return new MySQLDAOFactory();
    }
	
}
