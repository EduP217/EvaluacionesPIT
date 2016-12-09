package action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import beans.CarreraDTO;
import beans.CicloDTO;
import beans.CursoDTO;
import beans.ExamenDTO;
import beans.SeccionDTO;
import services.CursoService;
import services.ExamenService;
import services.PersonaService;
import services.SeccionService;

@ParentPackage("pit")
public class ExamenAction extends ActionSupport{
	
	private List<CarreraDTO> lstCarreraExa;
	private List<CicloDTO> lstCicloExa;
	
	private CursoDTO curso;
	private CarreraDTO carrera;
	private CicloDTO ciclo;
	private String[] secciones;
	private String codigo,codcarrera,codciclo,codcurso,codexamen;
	private String fecini,fecfin,duracion;
	
	private Map<String, Object> userdata = new HashMap<String, Object>();
	private Map<String, Object> sesion = ActionContext.getContext().getSession();
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");	
	
	@Action(value="/t_examen",results={
			@Result(name="ok",type="tiles",location="t_examen")
	})
	public String cargarRegistro(){
		lstCarreraExa = new CursoService().listarCarrera();
		lstCicloExa = new CursoService().listarCiclo();
		sesion.put("keylstCurso", new CursoService().listarCurso());
		sesion.put("selCiclo",-1);
		return "ok";
	}
		
	@Action(value="/buscCursos",results={
			@Result(name="ok",type="tiles",location="t_examen")
	})	
	public String buscarCursos(){
		lstCarreraExa = new CursoService().listarCarrera();
		lstCicloExa = new CursoService().listarCiclo();
		sesion.put("keylstCurso", new CursoService().listarCursoxCiclo(Integer.parseInt(codciclo)));
		sesion.put("selCiclo",codciclo);
		sesion.put("keylstSeccion", new SeccionService().listarSeccion2(Integer.parseInt(codciclo)));		
		return "ok";
	}	

	@Action(value="/regExamen",results={
			@Result(name="ok",type="tiles",location="t_examen")
	})	
	public String regExamen() throws ParseException{
		ExamenDTO examen = new ExamenDTO();
		examen.setFecini(sdf.parse(fecini));
		examen.setFecfin(sdf.parse(fecfin));
		examen.setDuracion(Integer.parseInt(duracion));
		examen.setEstado("1");
		new ExamenService().registrarExamen(examen);
		int codigo = new ExamenService().buscarCodExamen();
		sesion.put("codExamen",""+codigo);
		sesion.put("fecInicio",""+fecini);
		sesion.put("fecFinal",""+fecfin);
		sesion.put("numDurac",""+duracion);
		buscarCursos();
		return "ok";
	}
	/*--------------------------------------------------------------------------*/
	//		DATOS DE LAS PREGUNTAS Y OPCIONES
	/*--------------------------------------------------------------------------*/
	
	private String cp1,cp2,cp3,cp4,cp5,cp6,cp7,cp8,cp9,cp10;
	private String op1,op2,op3,op4,op5,op6,op7,op8,op9,op10,op11,op12,op13,op14,op15,op16,op17,op18,op19,op20,
					op21,op22,op23,op24,op25,op26,op27,op28,op29,op30,op31,op32,op33,op34,op35,op36,op37,op38,op39,op40;
	private String Enunciado1,Enunciado2,Enunciado3,Enunciado4,Enunciado5,Enunciado6,Enunciado7,Enunciado8,Enunciado9,Enunciado10;
	private String mensaje;
	private String mensajeError;
	
	@Action(value="/regPreguntas",results={
			@Result(name="ok",type="tiles",location="t_examen")
	})	
	public String regPreguntas(){
		mensaje = "Cod:"+codcurso+"-"+Enunciado1+" "+cp1+"-"+op1+","+op2+","+op3+","+op4;
		cargarRegistro();
		return "ok";
	}
	
	public CursoDTO getCurso() {
		return curso;
	}

	public void setCurso(CursoDTO curso) {
		this.curso = curso;
	}

	public String getCodcarrera() {
		return codcarrera;
	}

	public void setCodcarrera(String codcarrera) {
		this.codcarrera = codcarrera;
	}
	
	public String getCodciclo() {
		return codciclo;
	}

	public void setCodciclo(String codciclo) {
		this.codciclo = codciclo;
	}

	public CarreraDTO getCarrera() {
		return carrera;
	}

	public void setCarrera(CarreraDTO carrera) {
		this.carrera = carrera;
	}

	public CicloDTO getCiclo() {
		return ciclo;
	}

	public void setCiclo(CicloDTO ciclo) {
		this.ciclo = ciclo;
	}
	
	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}	

	public String[] getSecciones() {
		return secciones;
	}

	public void setSecciones(String[] secciones) {
		this.secciones = secciones;
	}

	public List<CarreraDTO> getLstCarreraExa() {
		return lstCarreraExa;
	}

	public void setLstCarreraExa(List<CarreraDTO> lstCarreraExa) {
		this.lstCarreraExa = lstCarreraExa;
	}

	public List<CicloDTO> getLstCicloExa() {
		return lstCicloExa;
	}

	public void setLstCicloExa(List<CicloDTO> lstCicloExa) {
		this.lstCicloExa = lstCicloExa;
	}

	public String getCp1() {
		return cp1;
	}

	public void setCp1(String cp1) {
		this.cp1 = cp1;
	}

	public String getCp2() {
		return cp2;
	}

	public void setCp2(String cp2) {
		this.cp2 = cp2;
	}

	public String getCp3() {
		return cp3;
	}

	public void setCp3(String cp3) {
		this.cp3 = cp3;
	}

	public String getCp4() {
		return cp4;
	}

	public void setCp4(String cp4) {
		this.cp4 = cp4;
	}

	public String getCp5() {
		return cp5;
	}

	public void setCp5(String cp5) {
		this.cp5 = cp5;
	}

	public String getCp6() {
		return cp6;
	}

	public void setCp6(String cp6) {
		this.cp6 = cp6;
	}

	public String getCp7() {
		return cp7;
	}

	public void setCp7(String cp7) {
		this.cp7 = cp7;
	}

	public String getCp8() {
		return cp8;
	}

	public void setCp8(String cp8) {
		this.cp8 = cp8;
	}

	public String getCp9() {
		return cp9;
	}

	public void setCp9(String cp9) {
		this.cp9 = cp9;
	}

	public String getCp10() {
		return cp10;
	}

	public void setCp10(String cp10) {
		this.cp10 = cp10;
	}

	public String getOp1() {
		return op1;
	}

	public void setOp1(String op1) {
		this.op1 = op1;
	}

	public String getOp2() {
		return op2;
	}

	public void setOp2(String op2) {
		this.op2 = op2;
	}

	public String getOp3() {
		return op3;
	}

	public void setOp3(String op3) {
		this.op3 = op3;
	}

	public String getOp4() {
		return op4;
	}

	public void setOp4(String op4) {
		this.op4 = op4;
	}

	public String getOp5() {
		return op5;
	}

	public void setOp5(String op5) {
		this.op5 = op5;
	}

	public String getOp6() {
		return op6;
	}

	public void setOp6(String op6) {
		this.op6 = op6;
	}

	public String getOp7() {
		return op7;
	}

	public void setOp7(String op7) {
		this.op7 = op7;
	}

	public String getOp8() {
		return op8;
	}

	public void setOp8(String op8) {
		this.op8 = op8;
	}

	public String getOp9() {
		return op9;
	}

	public void setOp9(String op9) {
		this.op9 = op9;
	}

	public String getOp10() {
		return op10;
	}

	public void setOp10(String op10) {
		this.op10 = op10;
	}

	public String getOp11() {
		return op11;
	}

	public void setOp11(String op11) {
		this.op11 = op11;
	}

	public String getOp12() {
		return op12;
	}

	public void setOp12(String op12) {
		this.op12 = op12;
	}

	public String getOp13() {
		return op13;
	}

	public void setOp13(String op13) {
		this.op13 = op13;
	}

	public String getOp14() {
		return op14;
	}

	public void setOp14(String op14) {
		this.op14 = op14;
	}

	public String getOp15() {
		return op15;
	}

	public void setOp15(String op15) {
		this.op15 = op15;
	}

	public String getOp16() {
		return op16;
	}

	public void setOp16(String op16) {
		this.op16 = op16;
	}

	public String getOp17() {
		return op17;
	}

	public void setOp17(String op17) {
		this.op17 = op17;
	}

	public String getOp18() {
		return op18;
	}

	public void setOp18(String op18) {
		this.op18 = op18;
	}

	public String getOp19() {
		return op19;
	}

	public void setOp19(String op19) {
		this.op19 = op19;
	}

	public String getOp20() {
		return op20;
	}

	public void setOp20(String op20) {
		this.op20 = op20;
	}

	public String getOp21() {
		return op21;
	}

	public void setOp21(String op21) {
		this.op21 = op21;
	}

	public String getOp22() {
		return op22;
	}

	public void setOp22(String op22) {
		this.op22 = op22;
	}

	public String getOp23() {
		return op23;
	}

	public void setOp23(String op23) {
		this.op23 = op23;
	}

	public String getOp24() {
		return op24;
	}

	public void setOp24(String op24) {
		this.op24 = op24;
	}

	public String getOp25() {
		return op25;
	}

	public void setOp25(String op25) {
		this.op25 = op25;
	}

	public String getOp26() {
		return op26;
	}

	public void setOp26(String op26) {
		this.op26 = op26;
	}

	public String getOp27() {
		return op27;
	}

	public void setOp27(String op27) {
		this.op27 = op27;
	}

	public String getOp28() {
		return op28;
	}

	public void setOp28(String op28) {
		this.op28 = op28;
	}

	public String getOp29() {
		return op29;
	}

	public void setOp29(String op29) {
		this.op29 = op29;
	}

	public String getOp30() {
		return op30;
	}

	public void setOp30(String op30) {
		this.op30 = op30;
	}

	public String getOp31() {
		return op31;
	}

	public void setOp31(String op31) {
		this.op31 = op31;
	}

	public String getOp32() {
		return op32;
	}

	public void setOp32(String op32) {
		this.op32 = op32;
	}

	public String getOp33() {
		return op33;
	}

	public void setOp33(String op33) {
		this.op33 = op33;
	}

	public String getOp34() {
		return op34;
	}

	public void setOp34(String op34) {
		this.op34 = op34;
	}

	public String getOp35() {
		return op35;
	}

	public void setOp35(String op35) {
		this.op35 = op35;
	}

	public String getOp36() {
		return op36;
	}

	public void setOp36(String op36) {
		this.op36 = op36;
	}

	public String getOp37() {
		return op37;
	}

	public void setOp37(String op37) {
		this.op37 = op37;
	}

	public String getOp38() {
		return op38;
	}

	public void setOp38(String op38) {
		this.op38 = op38;
	}

	public String getOp39() {
		return op39;
	}

	public void setOp39(String op39) {
		this.op39 = op39;
	}

	public String getOp40() {
		return op40;
	}

	public void setOp40(String op40) {
		this.op40 = op40;
	}

	public String getEnunciado1() {
		return Enunciado1;
	}

	public void setEnunciado1(String enunciado1) {
		Enunciado1 = enunciado1;
	}

	public String getEnunciado2() {
		return Enunciado2;
	}

	public void setEnunciado2(String enunciado2) {
		Enunciado2 = enunciado2;
	}

	public String getEnunciado3() {
		return Enunciado3;
	}

	public void setEnunciado3(String enunciado3) {
		Enunciado3 = enunciado3;
	}

	public String getEnunciado4() {
		return Enunciado4;
	}

	public void setEnunciado4(String enunciado4) {
		Enunciado4 = enunciado4;
	}

	public String getEnunciado5() {
		return Enunciado5;
	}

	public void setEnunciado5(String enunciado5) {
		Enunciado5 = enunciado5;
	}

	public String getEnunciado6() {
		return Enunciado6;
	}

	public void setEnunciado6(String enunciado6) {
		Enunciado6 = enunciado6;
	}

	public String getEnunciado7() {
		return Enunciado7;
	}

	public void setEnunciado7(String enunciado7) {
		Enunciado7 = enunciado7;
	}

	public String getEnunciado8() {
		return Enunciado8;
	}

	public void setEnunciado8(String enunciado8) {
		Enunciado8 = enunciado8;
	}

	public String getEnunciado9() {
		return Enunciado9;
	}

	public void setEnunciado9(String enunciado9) {
		Enunciado9 = enunciado9;
	}

	public String getEnunciado10() {
		return Enunciado10;
	}

	public void setEnunciado10(String enunciado10) {
		Enunciado10 = enunciado10;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public String getMensajeError() {
		return mensajeError;
	}

	public void setMensajeError(String mensajeError) {
		this.mensajeError = mensajeError;
	}

	public String getCodcurso() {
		return codcurso;
	}

	public void setCodcurso(String codcurso) {
		this.codcurso = codcurso;
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

	public String getDuracion() {
		return duracion;
	}

	public void setDuracion(String duracion) {
		this.duracion = duracion;
	}

	public String getCodexamen() {
		return codexamen;
	}

	public void setCodexamen(String codexamen) {
		this.codexamen = codexamen;
	}
	
}
