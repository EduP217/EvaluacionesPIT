package com.cibertec.services;

import java.util.List;

import com.cibertec.beans.EnlaceDTO;
import com.cibertec.dao.DAOFactory;
import com.cibertec.dao.EnlaceDAO;

public class EnlaceService {

	DAOFactory fabrica = DAOFactory.factory();
	EnlaceDAO dao = fabrica.enlaceDAO();
	
	public List<EnlaceDTO> listarEnlacesDePerfil(int perfilId){
		return dao.listarEnlacesDePerfil(perfilId);
	}
}
