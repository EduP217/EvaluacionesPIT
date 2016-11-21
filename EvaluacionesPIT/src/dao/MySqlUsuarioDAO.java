package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import beans.PersonaDTO;
import beans.EnlaceDTO;
import beans.UsuarioDTO;
import interfaces.UsuarioDAO;

public class MySqlUsuarioDAO implements UsuarioDAO {

	SqlSessionFactory sqlMapper=null;
	String archivo="ConfiguracionIbatis.xml";
	{
		try {
			Reader r=Resources.getResourceAsReader(archivo);
			sqlMapper=new SqlSessionFactoryBuilder().build(r);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public UsuarioDTO IniciarSesion(UsuarioDTO obj) {
		UsuarioDTO data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=(UsuarioDTO) sesion.selectOne("SQL_Login",obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
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
	}

	@Override
	public int modificarUsuario(UsuarioDTO obj) {
		int result = -1;
		SqlSession session =  sqlMapper.openSession();
		try {
			result = session.insert("SQL_UPD_Usuario", obj);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally{
			session.close();
		}
		return result;
	}

}
