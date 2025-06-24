package com.cibertec.dao.mysql;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cibertec.beans.EnlaceDTO;
import com.cibertec.dao.DAOExecutor;
import com.cibertec.dao.EnlaceDAO;

public class MySQLEnlaceDAO implements EnlaceDAO {

	@Override
	public List<EnlaceDTO> listarEnlacesDePerfil(int perfilId) {
		Map<String, Object> params = new HashMap<>();
		params.put("perfilId", perfilId);
		
		return DAOExecutor.retrieve(session -> 
			session.selectList("SQL_ListarEnlacesDePerfil", params)
		);
	}

}
