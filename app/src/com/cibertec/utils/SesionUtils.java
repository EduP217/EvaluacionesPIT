package com.cibertec.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.cibertec.beans.EnlaceDTO;

public class SesionUtils {
	
	public static List<EnlaceDTO> establecerJerarquiaDeEnlaces(List<EnlaceDTO> enlaces) {
		List<EnlaceDTO> jerarquia = new ArrayList<>();

        for (EnlaceDTO enlace : enlaces) {
        	if (enlace.getEnlaceParentId() == null) {
                jerarquia.add(enlace);
                continue;
        	}
        	
            Optional<EnlaceDTO> parentFilter = jerarquia.stream().filter(e -> e.getEnlaceId() == enlace.getEnlaceParentId()).findFirst();
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

}
