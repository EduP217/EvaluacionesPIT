package dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import beans.CursoDTO;
import beans.ExamenDTO;
import beans.OpcionesDTO;
import beans.PreguntaDTO;
import interfaces.ExamenDAO;

public class MySqlExamenDAO implements ExamenDAO {

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
	public int registrarOpciones(OpcionesDTO beanOpc) {
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

}
