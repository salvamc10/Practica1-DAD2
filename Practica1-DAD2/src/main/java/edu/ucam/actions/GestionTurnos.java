package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GestionTurnos extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		// Nos dirige a la jsp de turnos
		return "/WEB-INF/jsp/turnos.jsp";
	}
}
