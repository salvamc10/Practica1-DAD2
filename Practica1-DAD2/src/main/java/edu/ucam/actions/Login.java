package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Hashtable;

import edu.ucam.pojos.User;

public class Login extends Action{

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		// Obtener los parámetros del formulario de inicio de sesión
		String usuario = request.getParameter("usuario");
		String contrasena = request.getParameter("contrasena");

		// Obtener la Hashtable de usuarios del contexto del servlet
		Hashtable<String, User> users = (Hashtable<String, User>) request.getServletContext().getAttribute("users");

		// Obtener el usuario de la Hashtable usando el nombre de usuario proporcionado
		User user = users.get(usuario);

		// Verificar si se encontró un usuario con el nombre proporcionado
		if (user != null) {
		    // Verificar si la contraseña coincide con la contraseña del usuario
		    if (user.getContrasena().equals(contrasena)) {
		    	
		    	// Verificar si el usuario es "admin"
		        if (user.getUsuario().equals("admin")) {
		        	// Si el usuario es "admin", redirigir al panel de administrador
		            return "panelAdmin.jsp";
		        } else {
		        	// Si no es "admin", redirigir al panel de usuario
		            return "panelUser.jsp";
		        }
		        
		    } else {
		    	// Si la contraseña no coincide, mostrar un mensaje de error y redirigir a la página "index.jsp"
		        request.setAttribute("MSG_ERROR", "Usuario/clave incorrectos");
		        return "index.jsp";
		    }
		    
		} else {
		    // Si no se encontró un usuario con el nombre proporcionado, mostrar un mensaje de error y redirigir a la página "index.jsp"
		    request.setAttribute("MSG_ERROR", "Usuario/clave incorrectos");
		    return "index.jsp";
		}
	}
}
