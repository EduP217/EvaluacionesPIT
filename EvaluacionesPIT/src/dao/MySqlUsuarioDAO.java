package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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

}