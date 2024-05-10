package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GestionAsignaturas extends Action{

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		// Nos lleva a la jsp de asignaturas
		return "asignaturas.jsp";
	}

}
