package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GestionConvocatorias extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
<<<<<<< Updated upstream
		// TODO Auto-generated method stub
		return "convocatorias.jsp";
=======
		
		// Nos dirige a la jsp de convocatorias
		return "/WEB-INF/jsp/convocatorias.jsp";
>>>>>>> Stashed changes
	}

}
