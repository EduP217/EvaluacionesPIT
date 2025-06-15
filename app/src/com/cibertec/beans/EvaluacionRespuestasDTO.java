package com.cibertec.beans;

public class EvaluacionRespuestasDTO {
	
	private int evaluacionId;
	private int preguntaId;
	private int opcionMarcadaId;
	
	private EvaluacionDTO evaluacion;
	private PreguntaDTO pregunta;
	private PreguntaOpcionDTO opcionMarcada;
	
	public int getEvaluacionId() {
		return evaluacionId;
	}
	public void setEvaluacionId(int evaluacionId) {
		this.evaluacionId = evaluacionId;
	}
	public int getPreguntaId() {
		return preguntaId;
	}
	public void setPreguntaId(int preguntaId) {
		this.preguntaId = preguntaId;
	}
	public int getOpcionMarcadaId() {
		return opcionMarcadaId;
	}
	public void setOpcionMarcadaId(int opcionMarcadaId) {
		this.opcionMarcadaId = opcionMarcadaId;
	}
	public EvaluacionDTO getEvaluacion() {
		return evaluacion;
	}
	public void setEvaluacion(EvaluacionDTO evaluacion) {
		this.evaluacion = evaluacion;
	}
	public PreguntaDTO getPregunta() {
		return pregunta;
	}
	public void setPregunta(PreguntaDTO pregunta) {
		this.pregunta = pregunta;
	}
	public PreguntaOpcionDTO getOpcionMarcada() {
		return opcionMarcada;
	}
	public void setOpcionMarcada(PreguntaOpcionDTO opcionMarcada) {
		this.opcionMarcada = opcionMarcada;
	}
	
}
