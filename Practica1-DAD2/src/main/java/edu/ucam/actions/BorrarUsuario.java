package edu.ucam.actions;

import java.util.Hashtable;

import edu.ucam.pojos.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BorrarUsuario extends Action{

    @Override
    public String doAction(HttpServletRequest request, HttpServletResponse response) {
        
        // Obtener el parámetro "usuario" del formulario
        String usuario = request.getParameter("usuario");

        // Obtener la Hashtable de usuarios del contexto del servlet
        Hashtable<String, User> users = (Hashtable<String, User>) request.getServletContext().getAttribute("users");
                
        // Obtener el usuario correspondiente al nombre de usuario proporcionado
        User user = users.get(usuario);
                
        // Verificar si el usuario existe
        if(user != null ) {
                
            // Si existe, eliminarlo de la Hashtable
            users.remove(usuario, user);
                    
            // Imprimir un mensaje en la consola indicando que el usuario ha sido borrado
            System.out.println("Usuario Borrado");
                    
        }
                
        // Redirigir a la página "usuarios.jsp" después de borrar el usuario
        return "usuarios.jsp";    
    }

}
