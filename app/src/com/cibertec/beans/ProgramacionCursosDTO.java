package com.cibertec.beans;

public class ProgramacionCursosDTO {

	private int programacionId;
	private int docenteId;
	private int cursoId;
	private String codigo;
	private String ciclo;
	private String semestre;
	private String turno;
	
	private PersonaDTO docente;
	private CursoDTO curso;
	
	public int getProgramacionId() {
		return programacionId;
	}
	public void setProgramacionId(int programacionId) {
		this.programacionId = programacionId;
	}
	public int getDocenteId() {
		return docenteId;
	}
	public void setDocenteId(int docenteId) {
		this.docenteId = docenteId;
	}
	public int getCursoId() {
		return cursoId;
	}
	public void setCursoId(int cursoId) {
		this.cursoId = cursoId;
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
	public String getTurno() {
		return turno;
	}
	public void setTurno(String turno) {
		this.turno = turno;
	}
	public PersonaDTO getDocente() {
		return docente;
	}
	public void setDocente(PersonaDTO docente) {
		this.docente = docente;
	}
	public CursoDTO getCurso() {
		return curso;
	}
	public void setCurso(CursoDTO curso) {
		this.curso = curso;
	}
	
}
