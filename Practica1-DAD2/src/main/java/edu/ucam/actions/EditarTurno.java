package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.Turno;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditarTurno extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		// Verificar si el atributo "turnos" está presente
		if(request.getServletContext().getAttribute("turnos") == null) {
			request.getServletContext().setAttribute("turnos", new Hashtable<String, Turno>());
		}
		
		// Obtener el Hashtable de turnos y crear un nuevo objeto Turno
		Hashtable<String, Turno> turnos = (Hashtable<String, Turno>) request.getServletContext().getAttribute("turnos");
		Turno turno = new Turno(request.getParameter("idTurno"), request.getParameter("nombreTurno"));
				
		// Reemplazar el turno existente con el mismo id de turno en el Hashtable
		turnos.replace(turno.getIdTurno(), turno);
				
		// Volvemos a la jsp de turnos
		return "/WEB-INF/jsp/turnos.jsp";
	}
}
