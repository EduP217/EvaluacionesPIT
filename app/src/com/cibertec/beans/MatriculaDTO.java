package com.cibertec.beans;

import java.time.LocalDateTime;

public class MatriculaDTO {

	private int matriculaId;
	private int carreraId;
	private int alumnoId;
	private int estadoId;
	private String codigo;
	private String ciclo;
	private String semestre;
	private LocalDateTime fechaMatricula;
	private LocalDateTime fechaPago;
	private LocalDateTime fechaCreacion;
	private LocalDateTime fechaActualizacion;
	
	private CarreraBean carrera;
	private PersonaDTO alumno;
	private EstadoBean estado;
	
	public int getMatriculaId() {
		return matriculaId;
	}
	public void setMatriculaId(int matriculaId) {
		this.matriculaId = matriculaId;
	}
	public int getCarreraId() {
		return carreraId;
	}
	public void setCarreraId(int carreraId) {
		this.carreraId = carreraId;
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
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getCiclo() {
		return ciclo;
	}
	public void setCiclo(String ciclo) {
		this.ciclo = ciclo;
	}
	public String getSemestre() {
		return semestre;
	}
	public void setSemestre(String semestre) {
		this.semestre = semestre;
	}
	public LocalDateTime getFechaMatricula() {
		return fechaMatricula;
	}
	public void setFechaMatricula(LocalDateTime fechaMatricula) {
		this.fechaMatricula = fechaMatricula;
	}
	public LocalDateTime getFechaPago() {
		return fechaPago;
	}
	public void setFechaPago(LocalDateTime fechaPago) {
		this.fechaPago = fechaPago;
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
	public CarreraBean getCarrera() {
		return carrera;
	}
	public void setCarrera(CarreraBean carrera) {
		this.carrera = carrera;
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
