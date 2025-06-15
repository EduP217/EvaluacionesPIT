package com.cibertec.beans;

public class PreguntaOpcionDTO {
	
	private int opcionId;
	private int preguntaId;
	private String opcion;
	private String resultado;
	
	private PreguntaDTO pregunta;
	
	public int getOpcionId() {
		return opcionId;
	}
	public void setOpcionId(int opcionId) {
		this.opcionId = opcionId;
	}
	public int getPreguntaId() {
		return preguntaId;
	}
	public void setPreguntaId(int preguntaId) {
		this.preguntaId = preguntaId;
	}
	public String getOpcion() {
		return opcion;
	}
	public void setOpcion(String opcion) {
		this.opcion = opcion;
	}
	public String getResultado() {
		return resultado;
	}
	public void setResultado(String resultado) {
		this.resultado = resultado;
	}
	public PreguntaDTO getPregunta() {
		return pregunta;
	}
	public void setPregunta(PreguntaDTO pregunta) {
		this.pregunta = pregunta;
	}
	
}
