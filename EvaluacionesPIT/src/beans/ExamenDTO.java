package beans;

public class ExamenDTO {
	private int codigo;
	private String fecini;
	private String fecfin;
	private String fecreg;
	private int duracion;
	private String estado;
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getFecini() {
		return fecini;
	}
	public void setFecini(String fecini) {
		this.fecini = fecini;
	}
	public String getFecfin() {
		return fecfin;
	}
	public void setFecfin(String fecfin) {
		this.fecfin = fecfin;
	}
	public String getFecreg() {
		return fecreg;
	}
	public void setFecreg(String fecreg) {
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
