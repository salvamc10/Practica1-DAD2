package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.Asignatura;
import edu.ucam.pojos.Convocatoria;
import edu.ucam.pojos.Turno;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TurnoAddConvocatoria extends Action{

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		Turno turno = new Turno();
		
		String idTurno =  (request.getParameter("idTurno") != null && !request.getParameter("idTurno").isEmpty())?request.getParameter("idTurno"):"nada";
		String idConvocatoria =  (request.getParameter("idConvocatoria") != null && !request.getParameter("idConvocatoria").isEmpty())?request.getParameter("idConvocatoria"):"nada";

		Hashtable<String, Convocatoria> convocatorias = (Hashtable<String, Convocatoria>) request.getServletContext().getAttribute("convocatorias"); 
		Hashtable<String, Turno> turnos = (Hashtable<String, Turno>) request.getServletContext().getAttribute("turnos");
		
		if(turnos.containsKey(idTurno)) {
			turno = turnos.get(idTurno);
			
			if((idConvocatoria != null) && (convocatorias.containsKey(idConvocatoria))) {
				Convocatoria convocatoria = convocatorias.get(idConvocatoria);
					
				turno.setIdConvocatoria(convocatoria.getIdConvocatoria());
				convocatoria.getTurnos().put(idTurno, turno);
				System.out.println("El turno: " + turno.getNombreTurno() + " ha sido añadido a la convocatoria: " + convocatoria.getNombreConvocatoria());
					
			}else {
				System.out.println("La convocatoria no existe");
						
			}
		}else {
			System.out.println("El turno no existe");
			
		}
				
		return "/WEB-INF/jsp/turnoAddConvocatoria.jsp";
	}

}
