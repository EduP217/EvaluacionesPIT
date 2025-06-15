package com.cibertec.beans;

public class PreguntaDTO {
	
	private int preguntaId;
	private int cursoId;
	private int estadoId;
	private String pregunta;
	private String tipo;
	private String nivel;
	private int puntaje;
	
	private CursoDTO curso;
	private EstadoBean estado;
	
	public int getPreguntaId() {
		return preguntaId;
	}
	public void setPreguntaId(int preguntaId) {
		this.preguntaId = preguntaId;
	}
	public int getCursoId() {
		return cursoId;
	}
	public void setCursoId(int cursoId) {
		this.cursoId = cursoId;
	}
	public int getEstadoId() {
		return estadoId;
	}
	public void setEstadoId(int estadoId) {
		this.estadoId = estadoId;
	}
	public String getPregunta() {
		return pregunta;
	}
	public void setPregunta(String pregunta) {
		this.pregunta = pregunta;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getNivel() {
		return nivel;
	}
	public void setNivel(String nivel) {
		this.nivel = nivel;
	}
	public int getPuntaje() {
		return puntaje;
	}
	public void setPuntaje(int puntaje) {
		this.puntaje = puntaje;
	}
	public CursoDTO getCurso() {
		return curso;
	}
	public void setCurso(CursoDTO curso) {
		this.curso = curso;
	}
	public EstadoBean getEstado() {
		return estado;
	}
	public void setEstado(EstadoBean estado) {
		this.estado = estado;
	}
	
}
