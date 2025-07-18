package com.cibertec.dao.mysql;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.cibertec.beans.PersonaDTO;
import com.cibertec.beans.EnlaceDTO;
import com.cibertec.beans.UsuarioDTO;
import com.cibertec.dao.DAOExecutor;
import com.cibertec.dao.UsuarioDAO;

public class MySQLUsuarioDAO implements UsuarioDAO {
	
	@Override
	public UsuarioDTO IniciarSesion(String usuario, String clave) {
		Map<String, Object> params = new HashMap<>();
		params.put("usuario", usuario);
		params.put("clave", clave);
		
		return DAOExecutor.retrieve(session -> 
			(UsuarioDTO) session.selectOne("SQL_Login", params)
		);
	}

	@Override
	public void modificarDatosDeUsuario(UsuarioDTO usuario) {
		DAOExecutor.execute(session -> 
			session.update("SQL_ActualizarDatosDeUsuario", usuario)
		);
	}

	/*@Override
	public List<EnlaceDTO> MostrarEnlacesUsuario(int codigo) {
		List<EnlaceDTO> data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=sesion.selectList("SQL_EnlacesDeUsuario",codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public PersonaDTO datosUsuario(int codigo,int perfil) {
		PersonaDTO bean = null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			switch (perfil) {
			case 1:
				bean=(PersonaDTO) sesion.selectOne("SQL_DatosDeUsuario",codigo);
				break;
			case 2:
				bean=(PersonaDTO) sesion.selectOne("SQL_DatosDeUsuario2",codigo);
				break;
			case 3:
				bean=(PersonaDTO) sesion.selectOne("SQL_DatosDeUsuario3",codigo);
				break;
			case 4:
				bean=(PersonaDTO) sesion.selectOne("SQL_DatosDeUsuario3",codigo);
				break;				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	@Override
	public int registrarUsuario(UsuarioDTO obj) {
		int result = -1;
		SqlSession session =  sqlMapper.openSession();
		try {
			result = session.insert("SQL_REG_Usuario", obj);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally{
			session.close();
		}
		return result;
	}

	@Override
	public UsuarioDTO buscarUsuario(String usuario) {
		UsuarioDTO data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=(UsuarioDTO) sesion.selectOne("SQL_Found_Usuario",usuario);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}*/

}
