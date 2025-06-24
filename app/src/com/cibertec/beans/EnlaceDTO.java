package com.cibertec.beans;

import java.util.List;

public class EnlaceDTO {
	
	private int enlaceId;
	private String enlace;
	private String rutaURL;
	private String icono;
	private Integer enlaceParentId;
	
	private List<EnlaceDTO> subEnlaces;
	
	public int getEnlaceId() {
		return enlaceId;
	}
	public void setEnlaceId(int enlaceId) {
		this.enlaceId = enlaceId;
	}
	public String getEnlace() {
		return enlace;
	}
	public void setEnlace(String enlace) {
		this.enlace = enlace;
	}
	public String getRutaURL() {
		return rutaURL;
	}
	public void setRutaURL(String rutaURL) {
		this.rutaURL = rutaURL;
	}
	public List<EnlaceDTO> getSubEnlaces() {
		return subEnlaces;
	}
	public String getIcono() {
		return icono;
	}
	public void setIcono(String icono) {
		this.icono = icono;
	}
	public Integer getEnlaceParentId() {
		return enlaceParentId;
	}
	public void setEnlaceParentId(Integer enlaceParentId) {
		this.enlaceParentId = enlaceParentId;
	}
	public void setSubEnlaces(List<EnlaceDTO> subEnlaces) {
		this.subEnlaces = subEnlaces;
	}
	
	@Override
	public String toString() {
		return "EnlaceDTO [enlaceId=" + enlaceId + ", enlace=" + enlace + ", rutaURL=" + rutaURL + ", icono=" + icono
				+ ", enlaceParentId=" + enlaceParentId + ", subEnlaces=" + subEnlaces + "]";
	}
		
}
