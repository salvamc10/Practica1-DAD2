package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.Convocatoria;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertarConvocatoria extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		//Obtener los parámetros del formulario de inserción de convocatorias
		String idConvocatoria = request.getParameter("idConvocatoria");
		String nombreConvocatoria = request.getParameter("nombreConvocatoria");
		
		// Obtener la Hashtable de convocatorias del contexto del servlet
		Hashtable<String, Convocatoria> convocatorias = (Hashtable<String, Convocatoria>) request.getServletContext().getAttribute("convocatorias");
		
		// Verificar si ya existe una convocatoria con el mismo id
		Convocatoria convocatoria = convocatorias.get(idConvocatoria);
		
		// Si no existe una convocatoria con el mismo id y los campos del id y nombre no están vacíos
		if(convocatoria == null && !idConvocatoria.isEmpty() && !nombreConvocatoria.isEmpty()) {
			 
			// Crear una nueva convocatoria con los datos proporcionados
			convocatoria = new Convocatoria(idConvocatoria, nombreConvocatoria);
			
			// Agregar la nueva convocatoria a la Hashtable
			convocatorias.put(idConvocatoria, convocatoria);
			
			// Imprimir un mensaje en la consola indicando que la convocatoria ha sido insertada
			System.out.println("Convocatoria Insertada");
		}
		else {
			// Imprimir un mensaje en la consola indicando que la convocatoria no fue insertada debido a una convocatoria existente o datos incorrectos
			System.out.println("Convocatoria no insertada. Convocatoria ya existente o datos mal introducidos");
		}
		
		// Volvemos de nuevo a la jsp de convocatorias
		return "/WEB-INF/jsp/convocatorias.jsp";
	}

}