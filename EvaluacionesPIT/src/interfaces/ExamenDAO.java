package interfaces;

import beans.ExamenDTO;
import beans.OpcionesDTO;
import beans.PreguntaDTO;

public interface ExamenDAO {
	
	public int buscarCodExamen();
	public int registrarExamen(ExamenDTO beanExa);
	public int registrarPreguntas(PreguntaDTO beanPreg);
	public int registrarOpciones(OpcionesDTO beanOpc);

}
