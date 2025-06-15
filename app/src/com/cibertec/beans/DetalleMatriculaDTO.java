package com.cibertec.beans;

public class DetalleMatriculaDTO {

	private int detalleMatriculaId;
	private int matriculaId;
	private int programacionId;
	private int estadoId;
	
	public int getDetalleMatriculaId() {
		return detalleMatriculaId;
	}
	public void setDetalleMatriculaId(int detalleMatriculaId) {
		this.detalleMatriculaId = detalleMatriculaId;
	}
	public int getMatriculaId() {
		return matriculaId;
	}
	public void setMatriculaId(int matriculaId) {
		this.matriculaId = matriculaId;
	}
	public int getProgramacionId() {
		return programacionId;
	}
	public void setProgramacionId(int programacionId) {
		this.programacionId = programacionId;
	}
	public int getEstadoId() {
		return estadoId;
	}
	public void setEstadoId(int estadoId) {
		this.estadoId = estadoId;
	}
	
}
