package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.Asignatura;
import edu.ucam.pojos.Convocatoria;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BorrarConvocatoria extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		
		// Obtener la Hashtable de convocatorias y la convocatoria
        Hashtable<String, Convocatoria> convocatorias = (Hashtable<String, Convocatoria>) request.getServletContext().getAttribute("convocatorias");       
        Convocatoria convocatoria = convocatorias.get(id);
        
        // Verificar si la convocatoria existe y eliminarla
        if(convocatoria != null ) {            
            convocatorias.remove(id, convocatoria);
            System.out.println("Convocatoria Borrada");  
        }
        else {
        	System.out.println("ERROR");
        }
        
        // nos mantiene en la misma jsp
		return "/WEB-INF/jsp/convocatorias.jsp";
	}
	
}
