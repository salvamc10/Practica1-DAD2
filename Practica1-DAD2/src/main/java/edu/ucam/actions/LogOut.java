package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogOut extends Action{

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {

		// Elimina el atributo "user" de la sesión actual
        request.getSession().removeAttribute("user");
        // Retorna la página de inicio de sesión
        return "index.jsp";
        
	}

}
