package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ModTurno extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		// llamamos a la jsp para cambiar el turno
		return "/WEB-INF/jsp/editarTurno.jsp";
	}

}
