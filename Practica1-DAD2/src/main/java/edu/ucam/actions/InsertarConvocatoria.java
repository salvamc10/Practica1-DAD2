package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.Asignatura;
import edu.ucam.pojos.Convocatoria;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertarConvocatoria extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		//Obtener los parámetros del formulario de inserción de convocatorias
		String id = request.getParameter("id");
		String nombre = request.getParameter("nombre");
		
		// Obtener la Hashtable de convocatorias y verificar si ya existe una convocatoria con el mismo id
		Hashtable<String, Convocatoria> convocatorias = (Hashtable<String, Convocatoria>) request.getServletContext().getAttribute("convocatorias");
		Convocatoria convocatoria = convocatorias.get(id);
		
		// Si no existe una convocatoria con el mismo id y los campos del id y nombre no están vacíos
		if(convocatoria == null && !id.isEmpty() && !nombre.isEmpty()) {
			 
			// Crear una nueva convocatoria y agregar la nueva convocatoria a la Hashtable
			convocatoria = new Convocatoria(id, nombre);
			convocatorias.put(id, convocatoria);
			System.out.println("Convocatoria Insertada");
		}
		else {
			System.out.println("Convocatoria no insertada. Convocatoria ya existente o datos mal introducidos");
		}
		
		// Volvemos de nuevo a la jsp de convocatorias
		return "convocatorias.jsp";
	}

}
