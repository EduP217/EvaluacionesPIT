package beans;

public class CursoDTO {
	private int codigo;
	private int codcarrera;
	private String carrera;
	private int codciclo;
	private String ciclo;
	private int codseccion;
	private String nomseccion;
	private String nombre;

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public int getCodcarrera() {
		return codcarrera;
	}

	public void setCodcarrera(int codcarrera) {
		this.codcarrera = codcarrera;
	}

	public String getCarrera() {
		return carrera;
	}

	public void setCarrera(String carrera) {
		this.carrera = carrera;
	}

	public int getCodciclo() {
		return codciclo;
	}

	public void setCodciclo(int codciclo) {
		this.codciclo = codciclo;
	}

	public String getCiclo() {
		return ciclo;
	}

	public void setCiclo(String ciclo) {
		this.ciclo = ciclo;
	}

	public int getCodseccion() {
		return codseccion;
	}

	public void setCodseccion(int codseccion) {
		this.codseccion = codseccion;
	}

	public String getNomseccion() {
		return nomseccion;
	}

	public void setNomseccion(String nomseccion) {
		this.nomseccion = nomseccion;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getDatos(){
		return nombre;
	}
	
}
