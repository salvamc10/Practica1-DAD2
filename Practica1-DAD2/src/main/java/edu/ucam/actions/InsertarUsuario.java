package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Hashtable;

import edu.ucam.pojos.User;

public class InsertarUsuario extends Action{

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		// Obtener los parámetros del formulario de inicio de sesión
		String usuario = request.getParameter("usuario");
		String contrasena = request.getParameter("contrasena");

		// Obtener la Hashtable de usuarios del contexto del servlet
		Hashtable<String, User> users = (Hashtable<String, User>) request.getServletContext().getAttribute("users");
		
		User user = users.get(usuario);
		
		if(user == null && usuario != "" && contrasena != "") {
			
			user = new User(usuario, contrasena);
			users.put(usuario, user);
			
			System.out.println("Usuario insertado");
			
		}else {
			System.out.println("Usuario no insertado. Usuario ya existente o datos mal introducidos");
		}
		
		return "usuarios.jsp";	
	}

}
