package edu.ucam.tags;

<<<<<<< HEAD
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.BodyTagSupport;

import java.util.Hashtable;

import edu.ucam.pojos.User;
=======
import java.util.Hashtable;

import edu.ucam.pojos.User;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.BodyTagSupport;
>>>>>>> ListarEtiqueta

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
					
					for(User user: users.values()) {
						if(usuario.equals(user.getUsuario())) {
							
							pageContext.getOut().println("<br> Usuario: "+user.getUsuario()+". Contraseña: "+user.getContrasena()+".");
						}
					}		
				}else {
<<<<<<< HEAD
					pageContext.getOut().println("Atributo tipo vacío");
=======
					pageContext.getOut().println("Atributo usuario vacío");
>>>>>>> ListarEtiqueta
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return EVAL_BODY_INCLUDE;
	}

}
