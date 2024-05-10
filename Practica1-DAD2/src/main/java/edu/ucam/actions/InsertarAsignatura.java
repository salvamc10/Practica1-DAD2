package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.Asignatura;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertarAsignatura extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		//Obtener los parámetros del formulario de inserción de asignaturas
		String id = request.getParameter("id");
		String nombre = request.getParameter("nombre");
		
		// Obtener la Hashtable de asignaturas y verificar si ya existe una asignatura con el mismo id
		Hashtable<String, Asignatura> asignaturas = (Hashtable<String, Asignatura>) request.getServletContext().getAttribute("asignaturas");
		Asignatura asignatura = asignaturas.get(id);
		
		// Si no existe una asignatura con el mismo id y los campos del id y nombre no están vacíos
		if(asignatura == null && !id.isEmpty() && !nombre.isEmpty()) {			 
			// Crear una nueva asignatura y agregarla
			asignatura = new Asignatura(id, nombre);
			asignaturas.put(id, asignatura);
			System.out.println("Asignatura Insertada");
		}
		else {
			System.out.println("Asignatura no insertada. Asignatura ya existente o datos mal introducidos");
		}
		
		// Nos mantenemos en la misma jsp
		return "asignaturas.jsp";
	}
}
