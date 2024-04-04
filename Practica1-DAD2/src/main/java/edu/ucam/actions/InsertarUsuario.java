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

        // Obtener la Hashtable de usuarios del contexto del servlet
        Hashtable<String, User> users = (Hashtable<String, User>) request.getServletContext().getAttribute("users");
        
        // Verificar si ya existe un usuario con el mismo nombre
        User user = users.get(usuario);
        
        // Si no existe un usuario con el mismo nombre y los campos de usuario y contraseña no están vacíos
        if(user == null && !usuario.isEmpty() && !contrasena.isEmpty()) {
            
            // Crear un nuevo usuario con los datos proporcionados
            user = new User(usuario, contrasena);
            
            // Agregar el nuevo usuario a la Hashtable
            users.put(usuario, user);
            
            // Imprimir un mensaje en la consola indicando que el usuario ha sido insertado
            System.out.println("Usuario insertado");
            
        } else {
            // Imprimir un mensaje en la consola indicando que el usuario no fue insertado debido a un usuario existente o datos incorrectos
            System.out.println("Usuario no insertado. Usuario ya existente o datos mal introducidos");
        }
        
        // Redirigir a la página "usuarios.jsp" después de insertar el usuario
        return "usuarios.jsp";    
    }

}