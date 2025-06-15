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

import com.cibertec.beans.CarreraBean;
import com.cibertec.beans.CursoDTO;
import com.cibertec.beans.EnlaceDTO;
import com.cibertec.dao.CursoDAO;
import com.cibertec.dao.DAOExecutor;

public class MySQLCursoDAO implements CursoDAO {
	
	@Override
	public List<CursoDTO> listarCursos() {
		return DAOExecutor.retrieve(session -> 
			(List<CursoDTO>) session.selectList("SQL_Cursos")
		);
	}
	
	@Override
	public List<CursoDTO> filtrarCursosByPersona(int personaId, int estadoId) {
		Map<String, Object> params = new HashMap<>();
		params.put("personaId", personaId);
		params.put("estadoId", estadoId);
		
		return DAOExecutor.retrieve(session -> 
			(List<CursoDTO>) session.selectList("SQL_Filtrar_CursosByPersona", params)
		);
	}

	/*@Override
	public List<CarreraBean> listarCarrera() {
		List<CarreraBean> data=null;
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
	public List<CursoDTO> listarCursoPaginacion(int numpag) {
		List<CursoDTO> data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=sesion.selectList("SQL_Cursos_Pag",numpag);
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

	@Override
	public List<CursoDTO> listarCursoxSeccion(int codigo) {
		List<CursoDTO> data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=sesion.selectList("SQL_Cursos_x_Secc",codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}*/

}
