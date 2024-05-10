package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogOut extends Action{

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {

		// Elimina el atributo "user" de la sesión actual y vuelve al login
        request.getSession().removeAttribute("user");
        return "/WEB-INF/jsp/index.jsp";
        
	}

}
