package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import beans.CursoDTO;
import beans.DetalleCurSeccionDTO;
import beans.SeccionDTO;
import beans.UsuarioDTO;
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
		SeccionDTO data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=(SeccionDTO) sesion.selectOne("SQL_Found_Seccion",seccion);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public int registrarSeccion(SeccionDTO obj) {
		int result = -1;
		SqlSession session =  sqlMapper.openSession();
		try {
			result = session.insert("SQL_REG_Seccion", obj);
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
	public int modificarSeccion(SeccionDTO obj) {
		return 0;
	}

	@Override
	public int eliminarCursoSeccion(DetalleCurSeccionDTO obj) {
		int result = -1;
		SqlSession session =  sqlMapper.openSession();
		try {
			result = session.insert("SQL_DROP_CurSeccion",obj);
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

	@Override
	public SeccionDTO buscarSeccion2(SeccionDTO obj) {
		SeccionDTO data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=(SeccionDTO) sesion.selectOne("SQL_Found_Seccion_II",obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public DetalleCurSeccionDTO buscarSeccion3(DetalleCurSeccionDTO obj) {
		DetalleCurSeccionDTO data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			data=(DetalleCurSeccionDTO) sesion.selectOne("SQL_Found_Seccion_III",obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public int registrarDetalle(DetalleCurSeccionDTO obj) {
		int result = -1;
		SqlSession session =  sqlMapper.openSession();
		try {
			result = session.insert("SQL_REG_Deta_Seccion",obj);
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
