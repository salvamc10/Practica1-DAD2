package edu.ucam.actions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Hashtable;

import edu.ucam.pojos.User;

public class InsertarUsuario extends Action{

    @Override
    public String doAction(HttpServletRequest request, HttpServletResponse response) {
        
        // Obtener los parámetros del formulario de inserción de usuario
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        // Obtener la Hashtable de usuarios y verificar si ya existe un usuario con el mismo nombre
        Hashtable<String, User> users = (Hashtable<String, User>) request.getServletContext().getAttribute("users");     
        User user = users.get(usuario);
        
        // Si no existe un usuario con el mismo nombre y los campos de usuario y contraseña no están vacíos
        if(user == null && !usuario.isEmpty() && !contrasena.isEmpty()) {            
            // Crear un nuevo usuario y agregarlo
            user = new User(usuario, contrasena);
            users.put(usuario, user);
            System.out.println("Usuario insertado");
            
        } else {
            System.out.println("Usuario no insertado. Usuario ya existente o datos mal introducidos");
        }
        
        // Nos mantenemos en la jsp
        return "/WEB-INF/jsp/usuarios.jsp";    
    }

}