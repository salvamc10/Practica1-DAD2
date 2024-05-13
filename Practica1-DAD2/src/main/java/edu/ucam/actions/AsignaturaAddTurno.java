package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.Asignatura;
import edu.ucam.pojos.Turno;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AsignaturaAddTurno extends Action {

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
        String idAsignatura =  (request.getParameter("idAsignatura") != null && !request.getParameter("idAsignatura").isEmpty())?request.getParameter("idAsignatura"):"nada";
        String idTurno =  (request.getParameter("idTurno") != null && !request.getParameter("idTurno").isEmpty())?request.getParameter("idTurno"):"nada";
        
		//Creamos un objeto Asignatura
		Asignatura asignatura = new Asignatura();
		
		//Cogemos las listas de las asignaturas y de las convocatorias para ver si existe la asignatura y el turno
		Hashtable<String, Asignatura> asignaturas = (Hashtable<String, Asignatura>) request.getServletContext().getAttribute("asignaturas");
		Hashtable<String, Turno> turnos = (Hashtable<String, Turno>) request.getServletContext().getAttribute("turnos");
		
		//comprobamos que la asignatura existe
		if(asignaturas.containsKey(idAsignatura)) {
			asignatura = asignaturas.get(idAsignatura);
			
			//Comprobamos que el turno existe
			if((idTurno!= null) && (turnos.containsKey(idTurno))) {
				Turno turno = turnos.get(idTurno);
				
				//Comprobamos que la asignatura no pertenece a ningun turno
				if(!asignatura.isPerteneceTurno()) {
					asignatura.setPerteneceTurno(true);
					asignatura.setIdTurno(turno.getIdTurno()); //comprobamos que asignatura pertenece a un turno
					turno.getAsignaturas().put(idAsignatura, asignatura); //La asignatura se añade a la lista de asignaturas del turno
					System.out.println("La Asignatura: " + asignatura.getNombreAsignatura() + ", ha sido añadida al turno: " + turno.getNombreTurno());
				}
				else {
					//La asignatura ya pertenece a un turno
					System.out.println("La asignatura ya pertenece a un turno");
				}
			}
			else {
				System.out.println("El turno no existe");
			}
		}
		else {
			System.out.println("La asignatura no existe");
		}
		
		return "/WEB-INF/jsp/asignaturaAddTurno.jsp";
	}
}
