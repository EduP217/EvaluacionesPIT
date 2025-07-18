package com.cibertec.beans;

import java.sql.Date;
import java.util.List;

public class PersonaDTO {
	
	private int personaId;
	private String identificador;
	private String nombres;
	private String apellidos;
	private String fechaNacimiento;
	private String telefono;
	
	private List<PerfilBean> perfiles;
	
	public int getPersonaId() {
		return personaId;
	}
	public void setPersonaId(int personaId) {
		this.personaId = personaId;
	}
	public String getIdentificador() {
		return identificador;
	}
	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public List<PerfilBean> getPerfiles() {
		return perfiles;
	}
	public void setPerfiles(List<PerfilBean> perfiles) {
		this.perfiles = perfiles;
	}
	
	@Override
	public String toString() {
		return "PersonaDTO [personaId=" + personaId + ", identificador=" + identificador + ", nombres=" + nombres
				+ ", apellidos=" + apellidos + ", fechaNacimiento=" + fechaNacimiento + ", telefono=" + telefono
				+ ", perfiles=" + perfiles + "]";
	}
	
}
