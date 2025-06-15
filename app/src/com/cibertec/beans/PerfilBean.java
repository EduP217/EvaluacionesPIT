package com.cibertec.beans;

import java.util.List;

public class PerfilBean {

	private int perfilId;
	private String perfil;
	
	private List<EnlaceDTO> enlaces;
	
	public int getPerfilId() {
		return perfilId;
	}
	public void setPerfilId(int perfilId) {
		this.perfilId = perfilId;
	}
	public String getPerfil() {
		return perfil;
	}
	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}
	public List<EnlaceDTO> getEnlaces() {
		return enlaces;
	}
	public void setEnlaces(List<EnlaceDTO> enlaces) {
		this.enlaces = enlaces;
	}
		
}
