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
			request.getServletContext().setAttribute("convocatorias", new Hashtable<String, Convocatoria>());
		}
		
		// Obtener el Hashtable de asignaturas del contexto del servlet
		Hashtable<String, Convocatoria> convocatorias = (Hashtable<String, Convocatoria>) request.getServletContext().getAttribute("convocatorias");
		Convocatoria convocatoria = new Convocatoria(request.getParameter("id"), request.getParameter("nombre"));
		convocatorias.replace(convocatoria.getId(), convocatoria);
				
		// Volvemos a la jsp de convocatorias
		return "convocatorias.jsp";
	}

}
