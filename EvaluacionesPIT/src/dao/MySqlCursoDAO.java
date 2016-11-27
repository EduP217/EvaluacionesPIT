package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import beans.CarreraDTO;
import beans.CicloDTO;
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
	public List<CursoDTO> listarCursoxCiclo(int idciclo) {
		List<CursoDTO> data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=sesion.selectList("SQL_CursosxCiclo",idciclo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
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

	@Override
	public List<CarreraDTO> listarCarrera() {
		List<CarreraDTO> data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=sesion.selectList("SQL_Carrera");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public List<CicloDTO> listarCiclo() {
		List<CicloDTO> data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=sesion.selectList("SQL_Ciclo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public List<CursoDTO> listarCurso() {
		List<CursoDTO> data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=sesion.selectList("SQL_Cursos");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public CursoDTO buscarCurso(CursoDTO beanCurso, int condicion) {
		CursoDTO bean=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			if(condicion<1){
				bean=(CursoDTO) sesion.selectOne("SQL_FOUND_Cursos",beanCurso);
			} else {
				bean=(CursoDTO) sesion.selectOne("SQL_FOUND_Cursos_II",condicion);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	@Override
	public int registrarCurso(CursoDTO obj) {
		int result = -1;
		SqlSession session =  sqlMapper.openSession();
		try {
			result = session.insert("SQL_REG_Curso", obj);
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
	public int modificarCurso(CursoDTO obj) {
		int result = -1;
		SqlSession session =  sqlMapper.openSession();
		try {
			result = session.insert("SQL_UPD_Curso", obj);
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
	public int eliminarCurso(int codigo) {
		int result = -1;
		SqlSession session =  sqlMapper.openSession();
		try {
			result = session.insert("SQL_DROP_Curso", codigo);
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
