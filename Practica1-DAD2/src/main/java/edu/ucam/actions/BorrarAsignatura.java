package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.Asignatura;
import edu.ucam.pojos.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BorrarAsignatura extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		//Obtener el parámetro "id" del formulario
		String id = request.getParameter("id");
		
		// Obtener la Hashtable de asignaturas del contexto del servlet
        Hashtable<String, Asignatura> asignaturas = (Hashtable<String, Asignatura>) request.getServletContext().getAttribute("asignaturas");
        
        // Obtener la asignatura correspondiente al id de asignatura proporcionado
        Asignatura asignatura = asignaturas.get(id);
        
        // Verificar si la asignatura existe
        if(asignatura != null ) {
            
            // Si existe, eliminarla de la Hashtable
            asignaturas.remove(id, asignatura);
                    
            // Imprimir un mensaje en la consola indicando que la asignatura ha sido borrada
            System.out.println("Asignatura Borrada");  
        }
        else {
        	System.out.println("ERROR");
        }
        
        // Redirigir a la página "asignaturas.jsp" después de borrar la asignatura
		return "asignaturas.jsp";
	}
}
