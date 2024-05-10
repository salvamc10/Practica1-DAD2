package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.Asignatura;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditarAsignatura extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		// Verificar si el atributo "asignaturas" está presente en el contexto del servlet
		if(request.getServletContext().getAttribute("asignaturas") == null) {
			// Si no está presente, crear un nuevo Hashtable y establecerla como atributo del contexto del servlet
			request.getServletContext().setAttribute("asignaturas", new Hashtable<String, Asignatura>());
		}
		
		// Obtener el Hashtable de asignaturas del contexto del servlet
		Hashtable<String, Asignatura> asignaturas = (Hashtable<String, Asignatura>) request.getServletContext().getAttribute("asignaturas");
		
		// Crear un nuevo objeto Asignatura utilizando los parámetros del formulario
		Asignatura asignatura = new Asignatura(request.getParameter("id"), request.getParameter("nombre"));
		
		// Reemplazar la asignatura existente con el mismo id de asignatura en el Hashtable
		asignaturas.replace(asignatura.getIdAsignatura(), asignatura);
		
		// Retornar la página "asignaturas.jsp" después de editar el usuario
		return "/WEB-INF/jsp/asignaturas.jsp";
	}
}
