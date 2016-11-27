package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import beans.CursoDTO;
import beans.SeccionDTO;
import interfaces.SeccionDAO;

public class MySqlSeccionDAO implements SeccionDAO {
	
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
	public List<CursoDTO> listarCursoxSeccion(int seccion) {
		List<CursoDTO> data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=sesion.selectList("SQL_CursoxSeccion",seccion);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public SeccionDTO buscarSeccion(int seccion) {
		return null;
	}

	@Override
	public int registrarSeccion(SeccionDTO obj) {
		return 0;
	}

	@Override
	public int modificarSeccion(SeccionDTO obj) {
		return 0;
	}

	@Override
	public int eliminarSeccion(int codigo) {
		return 0;
	}

	@Override
	public List<SeccionDTO> listarSecciones() {
		List<SeccionDTO> data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=sesion.selectList("SQL_Secciones");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

}
