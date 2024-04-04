package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogOut extends Action{

	@Override
	public String doAction(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("user");
		return "index.jsp";
	}

}
