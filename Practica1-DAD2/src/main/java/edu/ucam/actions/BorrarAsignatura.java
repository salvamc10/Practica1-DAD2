package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.Asignatura;
import edu.ucam.pojos.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BorrarAsignatura extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		String idAsignatura = request.getParameter("idAsignatura");
		
		// Obtener la Hashtable de asignaturas y la asignatura
        Hashtable<String, Asignatura> asignaturas = (Hashtable<String, Asignatura>) request.getServletContext().getAttribute("asignaturas");       
        Asignatura asignatura = asignaturas.get(idAsignatura);
        
        // Verificar si la asignatura existe y eliminarla
        if(asignatura != null ) {            
            asignaturas.remove(idAsignatura, asignatura);
            System.out.println("Asignatura Borrada");  
        }
        else {
        	System.out.println("ERROR");
        }
        
        // nos mantiene en la misma jsp
		return "/WEB-INF/jsp/asignaturas.jsp";
	}
}
