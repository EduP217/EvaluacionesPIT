package com.cibertec.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.cibertec.beans.EnlaceDTO;
import com.cibertec.beans.PerfilBean;

public class SesionUtils {
	
	public static List<EnlaceDTO> establecerJerarquiaDeEnlaces(List<EnlaceDTO> enlaces) {
		List<EnlaceDTO> jerarquia = new ArrayList<>();

        for (EnlaceDTO enlace : enlaces) {
        	if (enlace.getEnlaceParentId() == null) {
                jerarquia.add(enlace);
                continue;
        	}
        	
            Optional<EnlaceDTO> parentFilter = jerarquia.stream()
            		.filter(e -> e.getEnlaceId() == enlace.getEnlaceParentId())
            		.findFirst();
            if (parentFilter.isPresent()) {
            	EnlaceDTO parent = parentFilter.get();
            	if(parent.getSubEnlaces() == null) {
            		parent.setSubEnlaces(new ArrayList<>());
            	}
                parent.getSubEnlaces().add(enlace);
            }
        }

		return jerarquia;
	}
	
	public static PerfilBean encontrarPerfilActivo(List<PerfilBean> perfiles) {
		Optional<PerfilBean> perfilActive = perfiles.stream()
				.filter(pp -> pp.getActive() == 1)
				.findFirst();
		
		if(perfilActive.isPresent()) {
			return perfilActive.get();
		}
		
		return null;
	}
	
	public static PerfilBean encontrarPerfilPorId(List<PerfilBean> perfiles, int perfilId) {
		Optional<PerfilBean> perfilActive = perfiles.stream()
				.filter(pp -> pp.getPerfilId() == perfilId)
				.findFirst();
		
		if(perfilActive.isPresent()) {
			return perfilActive.get();
		}
		
		return null;
	}

}
