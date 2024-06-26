package edu.ucam.tags;

import java.util.Hashtable;

import edu.ucam.pojos.User;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.BodyTagSupport;

public class ListarAdmin extends BodyTagSupport{
	
	private String usuario = "";

	public void setTipo(String usuario) {
		this.usuario = usuario;
	}
	
	@Override
	public int doStartTag() throws JspException {
		
		if(!"".equals(usuario)) {
			
			Hashtable<String, User> users = (Hashtable<String, User>) pageContext.getServletContext().getAttribute("users");
			
			try {
				
				if(users != null) {
					
					// Recorre toda la hashtable y muestra los campos Usuario y contraseña
					for(User user: users.values()) {
						if(usuario.equals(user.getUsuario())) {
							
							pageContext.getOut().println("<br> Usuario: "+user.getUsuario()+". Contraseña: "+user.getContrasena()+".");
						}
					}		
				}else {
					
					// Si no hay ningún admin, muestra error
					pageContext.getOut().println("Atributo usuario vacío");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return EVAL_BODY_INCLUDE;
	}

}
