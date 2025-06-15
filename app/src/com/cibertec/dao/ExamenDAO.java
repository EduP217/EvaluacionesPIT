package com.cibertec.dao;

//import com.cibertec.beans.DetalleExamenCursoDTO;
import com.cibertec.beans.ExamenDTO;
import com.cibertec.beans.PreguntaOpcionDTO;
import com.cibertec.beans.PreguntaDTO;

public interface ExamenDAO {
	
	public int buscarCodExamen();
	public int buscarCodPregunta();
	public int registrarExamen(ExamenDTO beanExa);
	//public int registrarDetalleExamen(DetalleExamenCursoDTO obj);
	public int registrarPreguntas(PreguntaDTO beanPreg);
	public int registrarOpciones(PreguntaOpcionDTO beanOpc);
	
	public ExamenDTO buscarExamenxCurso(int codigoCurso);
}
