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
		
		// Obtener la Hashtable de asignaturas del contexto del servlet
		Hashtable<String, Asignatura> asignaturas = (Hashtable<String, Asignatura>) request.getServletContext().getAttribute("asignaturas");
		 
		// Verificar si ya existe una asignatura con el mismo id
		Asignatura asignatura = asignaturas.get(id);
		
		// Si no existe una asignatura con el mismo id y los campos del id y nombre no están vacíos
		if(asignatura == null && !id.isEmpty() && !nombre.isEmpty()) {
			 
			// Crear una nueva asignatura con los datos proporcionados
			asignatura = new Asignatura(id, nombre);
			
			// Agregar la nueva asignatura a la Hashtable
			asignaturas.put(id, asignatura);
			
			// Imprimir un mensaje en la consola indicando que la asignatura ha sido insertada
			System.out.println("Asignatura Insertada");
		}
		else {
			// Imprimir un mensaje en la consola indicando que la asignatura no fue insertada debido a una asignatura existente o datos incorrectos
			System.out.println("Asignatura no insertada. Asignatura ya existente o datos mal introducidos");
		}
		
		// Redirigir a la página "asignaturas.jsp" después de insertar la asignatura
		return "asignaturas.jsp";
	}
}
