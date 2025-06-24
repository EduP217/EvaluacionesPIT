package com.cibertec.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("pit")
@Namespace("/configuracion")
public class ConfiguracionAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	@Action(value = "/", results = {
			@Result(name = SUCCESS, type = "tiles", location = "t_configuracion_persona")
	})
	public String configuracion() {
	    return SUCCESS;
	}
	
	@Action(value = "/save", results = {
			@Result(name = SUCCESS, type = "tiles", location = "t_configuracion_persona"),
			@Result(name = ERROR, type = "tiles", location = "t_configuracion_persona")
	})
	public String guardarConfiguracion() {
	    return SUCCESS;
	}
}
