package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.Turno;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BorrarTurno extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		String idTurno = request.getParameter("idTurno");
		
		// Obtener la Hashtable de turnos y el turno
        Hashtable<String, Turno> turnos = (Hashtable<String, Turno>) request.getServletContext().getAttribute("turnos");       
        Turno turno = turnos.get(idTurno);
        
        // Verificar si el turno existe y eliminarla
        if(turno != null ) {            
            turnos.remove(idTurno, turno);
            System.out.println("Turno Borrado");  
        }
        else {
        	System.out.println("ERROR");
        }
        
        // nos mantiene en la misma jsp
		return "/WEB-INF/jsp/turnos.jsp";
	}
}
