package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GestionUsuarios extends Action{

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "usuarios.jsp";
	}

}
