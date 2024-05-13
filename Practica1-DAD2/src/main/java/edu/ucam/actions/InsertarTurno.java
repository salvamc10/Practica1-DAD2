package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.Turno;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertarTurno extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		String idTurno = request.getParameter("idTurno");
		String nombreTurno = request.getParameter("nombreTurno");
		
		Hashtable<String, Turno> turnos = (Hashtable<String, Turno>) request.getServletContext().getAttribute("turnos");
		
		// Verificar si ya existe un turno con el mismo id
		Turno turno = turnos.get(idTurno);
		
		// Si no existe un turno con el mismo id y los campos del id y nombre no están vacíos
		if(turno == null && !idTurno.isEmpty() && !nombreTurno.isEmpty()) {
			
			// Crear una nuevo turno con los datos proporcionados
			turno = new Turno(idTurno, nombreTurno);			
			turnos.put(idTurno, turno);		
			System.out.println("Turno Insertado");
		}
		else {
			System.out.println("Turno no insertado. Turno ya existente o datos mal introducidos");
		}
		
		// Volvemos de nuevo a la jsp de convocatorias
		return "/WEB-INF/jsp/turnos.jsp";
	}
}
