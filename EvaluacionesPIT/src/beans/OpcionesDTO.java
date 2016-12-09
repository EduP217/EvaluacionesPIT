package beans;

public class OpcionesDTO {
	private int idopciones;
	private String descripcion;
	private int respuesta;
	private int idpregunta;
	
	public int getIdopciones() {
		return idopciones;
	}
	public void setIdopciones(int idopciones) {
		this.idopciones = idopciones;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getRespuesta() {
		return respuesta;
	}
	public void setRespuesta(int respuesta) {
		this.respuesta = respuesta;
	}
	public int getIdpregunta() {
		return idpregunta;
	}
	public void setIdpregunta(int idpregunta) {
		this.idpregunta = idpregunta;
	}	
}
