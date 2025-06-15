package com.cibertec.beans;

import java.time.LocalDateTime;

public class EvaluacionDTO {

	private int evaluacionId;
	private int examenId;
	private int alumnoId;
	private int estadoId;
	private int respuestasCorrectas;
	private int respuestasIncorrectas;
	private int calificacion;
	private LocalDateTime fechaInicio;
	private LocalDateTime fechaFinal;
	private LocalDateTime fechaCreacion;
	private LocalDateTime fechaActualizacion;
	
	private ExamenDTO examen;
	private PersonaDTO alumno;
	private EstadoBean estado;
	
	public int getEvaluacionId() {
		return evaluacionId;
	}
	public void setEvaluacionId(int evaluacionId) {
		this.evaluacionId = evaluacionId;
	}
	public int getExamenId() {
		return examenId;
	}
	public void setExamenId(int examenId) {
		this.examenId = examenId;
	}
	public int getAlumnoId() {
		return alumnoId;
	}
	public void setAlumnoId(int alumnoId) {
		this.alumnoId = alumnoId;
	}
	public int getEstadoId() {
		return estadoId;
	}
	public void setEstadoId(int estadoId) {
		this.estadoId = estadoId;
	}
	public int getRespuestasCorrectas() {
		return respuestasCorrectas;
	}
	public void setRespuestasCorrectas(int respuestasCorrectas) {
		this.respuestasCorrectas = respuestasCorrectas;
	}
	public int getRespuestasIncorrectas() {
		return respuestasIncorrectas;
	}
	public void setRespuestasIncorrectas(int respuestasIncorrectas) {
		this.respuestasIncorrectas = respuestasIncorrectas;
	}
	public int getCalificacion() {
		return calificacion;
	}
	public void setCalificacion(int calificacion) {
		this.calificacion = calificacion;
	}
	public LocalDateTime getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(LocalDateTime fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public LocalDateTime getFechaFinal() {
		return fechaFinal;
	}
	public void setFechaFinal(LocalDateTime fechaFinal) {
		this.fechaFinal = fechaFinal;
	}
	public LocalDateTime getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(LocalDateTime fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public LocalDateTime getFechaActualizacion() {
		return fechaActualizacion;
	}
	public void setFechaActualizacion(LocalDateTime fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
	public ExamenDTO getExamen() {
		return examen;
	}
	public void setExamen(ExamenDTO examen) {
		this.examen = examen;
	}
	public PersonaDTO getAlumno() {
		return alumno;
	}
	public void setAlumno(PersonaDTO alumno) {
		this.alumno = alumno;
	}
	public EstadoBean getEstado() {
		return estado;
	}
	public void setEstado(EstadoBean estado) {
		this.estado = estado;
	}
	
}
