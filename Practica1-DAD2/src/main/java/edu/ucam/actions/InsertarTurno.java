package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.Turno;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertarTurno extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		//Obtener los parámetros del formulario de inserción de turnos
		String idTurno = request.getParameter("idTurno");
		String nombreTurno = request.getParameter("nombreTurno");
		
		// Obtener la Hashtable de turno del contexto del servlet
		Hashtable<String, Turno> turnos = (Hashtable<String, Turno>) request.getServletContext().getAttribute("turnos");
		
		// Verificar si ya existe un turno con el mismo id
		Turno turno = turnos.get(idTurno);
		
		// Si no existe un turno con el mismo id y los campos del id y nombre no están vacíos
		if(turno == null && !idTurno.isEmpty() && !nombreTurno.isEmpty()) {
			
			// Crear una nuevo turno con los datos proporcionados
			turno = new Turno(idTurno, nombreTurno);
			
			// Agregar la nuevo turno a la Hashtable
			turnos.put(idTurno, turno);
			
			// Imprimir un mensaje en la consola indicando que el turno ha sido insertado
			System.out.println("Turno Insertado");
		}
		else {
			// Imprimir un mensaje en la consola indicando que el turno no fue insertado debido a un turno existente o datos incorrectos
			System.out.println("Turno no insertado. Turno ya existente o datos mal introducidos");
		}
		
		// Volvemos de nuevo a la jsp de convocatorias
		return "/WEB-INF/jsp/turnos.jsp";
	}
}
