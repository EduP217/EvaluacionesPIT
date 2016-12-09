package beans;

import java.util.Date;

public class ExamenDTO {
	private int codigo;
	private Date fecini;
	private Date fecfin;
	private Date fecreg;
	private int duracion;
	private String estado;
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	
	public Date getFecini() {
		return fecini;
	}
	public void setFecini(Date fecini) {
		this.fecini = fecini;
	}
	public Date getFecfin() {
		return fecfin;
	}
	public void setFecfin(Date fecfin) {
		this.fecfin = fecfin;
	}
	public Date getFecreg() {
		return fecreg;
	}
	public void setFecreg(Date fecreg) {
		this.fecreg = fecreg;
	}
	public int getDuracion() {
		return duracion;
	}
	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
}
