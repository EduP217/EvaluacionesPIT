package interfaces;

import java.util.List;

import beans.CarreraDTO;
import beans.CicloDTO;
import beans.CursoDTO;
import beans.DetalleCurSeccionDTO;
import beans.DetalleSeccionAlum;
import beans.PersonaDTO;
import beans.SeccionDTO;

public interface SeccionDAO {
		
	public List<SeccionDTO> listarSecciones();
	public List<CursoDTO> listarCursoxSeccion(int seccion);
	public SeccionDTO buscarSeccion(int seccion);
	public SeccionDTO buscarSeccion2(SeccionDTO obj);
	public DetalleCurSeccionDTO buscarSeccion3(DetalleCurSeccionDTO obj);
	public List<DetalleCurSeccionDTO> listarSeccion4(int codCurso);
	public List<SeccionDTO> listarSeccion2(int codCiclo);
	public int registrarSeccion(SeccionDTO obj);
	public int modificarSeccion(SeccionDTO obj);
	public int eliminarCursoSeccion(DetalleCurSeccionDTO obj);
	public int registrarDetalle(DetalleCurSeccionDTO obj);
	public int registrarDetalleUsuario(DetalleSeccionAlum obj);
	public int updateDetalleUsuario(DetalleSeccionAlum obj);
	public DetalleSeccionAlum buscarDetalle(DetalleSeccionAlum xobj);
}
