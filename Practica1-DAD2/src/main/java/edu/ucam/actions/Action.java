package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public abstract class Action {
	
	// Método abstracto que realiza una acción basada en la solicitud y devuelve un resultado
	public abstract String doAction(HttpServletRequest request, HttpServletResponse response);
	
}
