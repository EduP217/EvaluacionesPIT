package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import beans.AdministradorDTO;
import beans.DocenteDTO;
import beans.EnlaceDTO;
import beans.EstudianteDTO;
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
	public AdministradorDTO datosUsuario(int codigo) {
		AdministradorDTO bean = null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			bean=(AdministradorDTO) sesion.selectOne("SQL_DatosDeUsuario",codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	@Override
	public DocenteDTO datosUsuario2(int codigo) {
		DocenteDTO bean = null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			bean=(DocenteDTO) sesion.selectOne("SQL_DatosDeUsuario2",codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	@Override
	public EstudianteDTO datosUsuario3(int codigo) {
		EstudianteDTO bean = null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			bean=(EstudianteDTO) sesion.selectOne("SQL_DatosDeUsuario3",codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

}
