package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditarUsuario extends Action{

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		// Verificar si el atributo "users" está presente en el contexto del servlet
		if(request.getServletContext().getAttribute("users") == null) {
			// Si no está presente, crear un nuevo Hashtable y establecerlo como atributo del contexto del servlet
			request.getServletContext().setAttribute("users", new Hashtable<String, User>());
		}
		
		// Obtener el Hashtable de usuarios del contexto del servlet
		Hashtable<String, User> users = (Hashtable<String, User>) request.getServletContext().getAttribute("users");
		
		// Crear un nuevo objeto User utilizando los parámetros del formulario
		User user = new User(request.getParameter("usuario"), request.getParameter("contrasena"));
		
		// Reemplazar el usuario existente con el mismo nombre de usuario en el Hashtable
		users.replace(user.getUsuario(), user);
		
		// Retornar la página "usuarios.jsp" después de editar el usuario
		return "usuarios.jsp";
	}

}
