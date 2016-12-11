package interfaces;

import beans.DetalleExamenCursoDTO;
import beans.ExamenDTO;
import beans.OpcionesDTO;
import beans.PreguntaDTO;

public interface ExamenDAO {
	
	public int buscarCodExamen();
	public int buscarCodPregunta();
	public int registrarExamen(ExamenDTO beanExa);
	public int registrarDetalleExamen(DetalleExamenCursoDTO obj);
	public int registrarPreguntas(PreguntaDTO beanPreg);
	public int registrarOpciones(OpcionesDTO beanOpc);
	
	public ExamenDTO buscarExamenxCurso(int codigoCurso);
}
