package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.Asignatura;
import edu.ucam.pojos.Convocatoria;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditarConvocatoria extends Action{

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		// Verificar si el atributo "convocatorias" está presente en el contexto del servlet
		if(request.getServletContext().getAttribute("convocatorias") == null) {
			// Si no está presente, crear un nuevo Hashtable y establecerla como atributo del contexto del servlet
			request.getServletContext().setAttribute("convocatorias", new Hashtable<String, Convocatoria>());
		}
		
		// Obtener el Hashtable de asignaturas del contexto del servlet
		Hashtable<String, Convocatoria> convocatorias = (Hashtable<String, Convocatoria>) request.getServletContext().getAttribute("convocatorias");
				
		// Crear un nuevo objeto Asignatura utilizando los parámetros del formulario
		Convocatoria convocatoria = new Convocatoria(request.getParameter("id"), request.getParameter("nombre"));
				
		// Reemplazar la asignatura existente con el mismo id de asignatura en el Hashtable
		convocatorias.replace(convocatoria.getId(), convocatoria);
				
		// Volvemos a la jsp de convocatorias
		return "convocatorias.jsp";
	}

}
