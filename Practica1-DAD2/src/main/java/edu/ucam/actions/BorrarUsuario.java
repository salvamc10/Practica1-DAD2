package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BorrarUsuario extends Action{

    @Override
    public String doAction(HttpServletRequest request, HttpServletResponse response) {
        
        String usuario = request.getParameter("usuario");

        // Obtener la Hashtable de usuarios del contexto del servlet y el usuario
        Hashtable<String, User> users = (Hashtable<String, User>) request.getServletContext().getAttribute("users");
        User user = users.get(usuario);
                
        // Verificar si el usuario existe y eliminarlo
        if(user != null ) {           
            users.remove(usuario, user);             
            System.out.println("Usuario Borrado");                   
        }
                
        // Nos mantiene en la misma jsp
        return "/WEB-INF/jsp/usuarios.jsp";    
    }

}
