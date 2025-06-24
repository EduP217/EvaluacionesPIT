package com.cibertec.dao;

import java.util.List;

import com.cibertec.beans.EnlaceDTO;

public interface EnlaceDAO {
	
	public List<EnlaceDTO> listarEnlacesDePerfil(int perfilId);

}
