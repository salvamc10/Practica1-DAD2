package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditarUsuario extends Action{

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		if(request.getServletContext().getAttribute("users") == null) {
			request.getServletContext().setAttribute("users", new Hashtable<String, User>());
		}
		
		// Obtener el Hashtable de usuarios y crer un nuevo User para después reemplazar la contraseña
		Hashtable<String, User> users = (Hashtable<String, User>) request.getServletContext().getAttribute("users");
		User user = new User(request.getParameter("usuario"), request.getParameter("contrasena"));
		users.replace(user.getUsuario(), user);
		
		// Nos lleva a la JSP  de usuarios
		return "/WEB-INF/jsp/usuarios.jsp";
	}

}
