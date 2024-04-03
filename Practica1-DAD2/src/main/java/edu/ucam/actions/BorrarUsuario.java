package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BorrarUsuario extends Action{

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		// Obtener los parámetros del formulario de inicio de sesión
		String usuario = request.getParameter("usuario");

		// Obtener la Hashtable de usuarios del contexto del servlet
		Hashtable<String, User> users = (Hashtable<String, User>) request.getServletContext().getAttribute("users");
				
		User user = users.get(usuario);
				
		if(user != null ) {
				
			users.remove(usuario, user);
					
			System.out.println("Usuario Borrado");
					
		}
				
		return "usuarios.jsp";	
	}

}
