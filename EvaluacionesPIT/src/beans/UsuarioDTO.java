package beans;

import java.io.File;

public class UsuarioDTO {
	
	private int codigo;
	private String usuario;
	private String clave;
	private String urlFoto;
	private File Foto;
	private byte[] FotoBytes;
	private String FotoContentType;
	private String FotoFileName;
	private String estado;	
	private int idperfil;
	private String perfil;
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}	
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getClave() {
		return clave;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getPerfil() {
		return perfil;
	}
	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}
	public String getUrlFoto() {
		return urlFoto;
	}
	public void setUrlFoto(String urlFoto) {
		this.urlFoto = urlFoto;
	}
	public int getIdperfil() {
		return idperfil;
	}
	public void setIdperfil(int idperfil) {
		this.idperfil = idperfil;
	}
	public File getFoto() {
		return Foto;
	}
	public void setFoto(File foto) {
		Foto = foto;
	}
	public byte[] getFotoBytes() {
		return FotoBytes;
	}
	public void setFotoBytes(byte[] fotoBytes) {
		FotoBytes = fotoBytes;
	}
	public String getFotoContentType() {
		return FotoContentType;
	}
	public void setFotoContentType(String fotoContentType) {
		FotoContentType = fotoContentType;
	}
	public String getFotoFileName() {
		return FotoFileName;
	}
	public void setFotoFileName(String fotoFileName) {
		FotoFileName = fotoFileName;
	}	
	
}
