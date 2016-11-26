package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import beans.PersonaDTO;
import interfaces.PersonaDAO;

public class MySqlPersonaDAO implements PersonaDAO {

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
	public List<PersonaDTO> listarPersonas(int perfil) {
		List<PersonaDTO> data=null;
		SqlSession sesion=sqlMapper.openSession();
		try {
			switch (perfil) {
			case 1:
				data=sesion.selectList("SQL_Admin",perfil);
				break;
			case 2:
				data=sesion.selectList("SQL_Alumnos",perfil);
				break;
			case 3:
				data=sesion.selectList("SQL_Docente",perfil);
				break;
			case 4:
				data=sesion.selectList("SQL_Docente",perfil);
				break;				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public int registrarPersona(PersonaDTO obj,int perfil) {
		int result = -1;
		SqlSession session =  sqlMapper.openSession();
		try {
			switch (perfil) {
			case 1:
				result = session.insert("SQL_REG_Admin", obj);
				session.commit();				
				break;
			case 2:
				result = session.insert("SQL_REG_Alumn", obj);
				session.commit();
				break;
			case 3:		
				result = session.insert("SQL_REG_Prof", obj);
				session.commit();				
				break;
			case 4:
				result = session.insert("SQL_REG_Prof", obj);
				session.commit();
				break;	
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally{
			session.close();
		}
		return result;
	}

	@Override
	public int modificarPersona(PersonaDTO obj,int perfil) {
		int result = -1;
		SqlSession session =  sqlMapper.openSession();
		try {
			switch (perfil) {
			case 1:
				result = session.insert("SQL_UPD_Admin", obj);
				session.commit();				
				break;
			case 2:
				result = session.insert("SQL_UPD_Alumn", obj);
				session.commit();
				break;
			case 3:		
				result = session.insert("SQL_UPD_Prof", obj);
				session.commit();				
				break;
			case 4:
				result = session.insert("SQL_UPD_Prof", obj);
				session.commit();
				break;	
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally{
			session.close();
		}
		return result;
	}

}
