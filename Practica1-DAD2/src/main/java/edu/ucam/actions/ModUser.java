package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ModUser extends Action{

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		
		//llamamos a la jsp para cambiar la contraseña
		return "/WEB-INF/jsp/editarUsuario.jsp";
	}

}
