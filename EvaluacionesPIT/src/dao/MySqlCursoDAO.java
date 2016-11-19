package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import beans.CursoDTO;
import beans.EnlaceDTO;
import interfaces.CursoDAO;

public class MySqlCursoDAO implements CursoDAO {

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
	public List<CursoDTO> listarCursoXseccion(String seccion) {		
		return null;
	}

	@Override
	public List<CursoDTO> listarCursos(int idusuario) {
		List<CursoDTO> data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=sesion.selectList("SQL_CursosxUsuario",idusuario);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

}
