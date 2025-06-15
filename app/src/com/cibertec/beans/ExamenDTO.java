package com.cibertec.beans;

import java.time.LocalDate;
import java.util.List;

public class ExamenDTO {
	
	private int examenId;
	private int cursoId;
	private int estadoId;
	private String codigo;
	private String tipo;
	private String duracion;
	private int minimoPuntaje;
	private int maximoPuntaje;
	private LocalDate fechaInicio;
	private LocalDate fechaFinal;
	private LocalDate fechaCreacion;
	private LocalDate fechaActualizacion;
	
	private List<PreguntaDTO> preguntas;
	private CursoDTO curso;
	private EstadoBean estado;
	
	public int getExamenId() {
		return examenId;
	}
	public void setExamenId(int examenId) {
		this.examenId = examenId;
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
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getDuracion() {
		return duracion;
	}
	public void setDuracion(String duracion) {
		this.duracion = duracion;
	}
	public int getMinimoPuntaje() {
		return minimoPuntaje;
	}
	public void setMinimoPuntaje(int minimoPuntaje) {
		this.minimoPuntaje = minimoPuntaje;
	}
	public int getMaximoPuntaje() {
		return maximoPuntaje;
	}
	public void setMaximoPuntaje(int maximoPuntaje) {
		this.maximoPuntaje = maximoPuntaje;
	}
	public LocalDate getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(LocalDate fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public LocalDate getFechaFinal() {
		return fechaFinal;
	}
	public void setFechaFinal(LocalDate fechaFinal) {
		this.fechaFinal = fechaFinal;
	}
	public LocalDate getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(LocalDate fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public LocalDate getFechaActualizacion() {
		return fechaActualizacion;
	}
	public void setFechaActualizacion(LocalDate fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
	public List<PreguntaDTO> getPreguntas() {
		return preguntas;
	}
	public void setPreguntas(List<PreguntaDTO> preguntas) {
		this.preguntas = preguntas;
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
