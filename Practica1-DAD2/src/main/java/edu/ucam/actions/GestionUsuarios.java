package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GestionUsuarios extends Action{

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		// nos lleva a la jsp usuarios
		return "/WEB-INF/jsp/usuarios.jsp";
	}

}
