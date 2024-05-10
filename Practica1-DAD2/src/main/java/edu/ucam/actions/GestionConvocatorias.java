package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GestionConvocatorias extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		// Nos dirige a la jsp de convocatorias
		return "convocatorias.jsp";
	}

}
