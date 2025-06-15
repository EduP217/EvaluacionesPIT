package com.cibertec.beans;

import java.time.LocalDate;
import java.util.List;

public class PersonaDTO {
	
	private int personaId;
	private String identificador;
	private String nombres;
	private String apellidos;
	private LocalDate fechaNacimiento;
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
	public LocalDate getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(LocalDate fechaNacimiento) {
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
	
}
