package com.cibertec.dao.mysql;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.cibertec.beans.CursoDTO;
//import com.cibertec.beans.DetalleExamenCursoDTO;
import com.cibertec.beans.ExamenDTO;
import com.cibertec.beans.PreguntaOpcionDTO;
import com.cibertec.dao.ExamenDAO;
import com.cibertec.beans.PreguntaDTO;

public class MySQLExamenDAO implements ExamenDAO {

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
	public int registrarExamen(ExamenDTO beanExa) {
		int result = -1;
		SqlSession session =  sqlMapper.openSession();
		try {
			result = session.insert("SQL_INS_EXA", beanExa);
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
	public int registrarPreguntas(PreguntaDTO beanPreg) {
		int result = -1;
		SqlSession session =  sqlMapper.openSession();
		try {
			result = session.insert("SQL_INS_PREG", beanPreg);
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
	public int registrarOpciones(PreguntaOpcionDTO beanOpc) {
		int result = -1;
		SqlSession session =  sqlMapper.openSession();
		try {
			result = session.insert("SQL_INS_OPCI", beanOpc);
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
	public int buscarCodExamen() {
		int codigo=0;
		SqlSession sesion=sqlMapper.openSession();
		try {
			codigo=(int) sesion.selectOne("SQL_LAST_EXA");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return codigo;
	}
	@Override
	public int buscarCodPregunta() {
		int codigo=0;
		SqlSession sesion=sqlMapper.openSession();
		try {
			codigo=(int) sesion.selectOne("SQL_LAST_PREG");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return codigo;
	}

	/*@Override
	public int registrarDetalleExamen(DetalleExamenCursoDTO obj) {
		int result = -1;
		SqlSession session =  sqlMapper.openSession();
		try {
			result = session.insert("SQL_INS_DETA_EXA", obj);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally{
			session.close();
		}
		return result;
	}*/

	@Override
	public ExamenDTO buscarExamenxCurso(int codigoCurso) {
		ExamenDTO bean=null;
		SqlSession session =  sqlMapper.openSession();
		try {
			bean = (ExamenDTO) session.selectOne("SQL_EXA_CUR", codigoCurso);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally{
			session.close();
		}
		return bean;
	}
}
