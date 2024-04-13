package edu.ucam.listeners;

import java.util.Hashtable;

import edu.ucam.pojos.User;
import edu.ucam.pojos.Asignatura;
import edu.ucam.servlets.Control;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

/**
 * Application Lifecycle Listener implementation class InicializarContexto
 *
 */
public class InicializarContexto implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public InicializarContexto() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	
    	// Imprimir mensaje de inicialización del contexto
        System.out.println("Inicializando el contexto....");
        
        // Crear una Hashtable para almacenar usuarios (clave: nombre de usuario, valor: objeto User)
        Hashtable<String, User> users = new Hashtable<String, User>();
        
        // Crear una Hashtable para almacenar asignaturas
        Hashtable<String, Asignatura> asignaturas = new Hashtable<String, Asignatura>();
        
        // Agregar un usuario de ejemplo ("admin" con contraseña "admin") a la Hashtable
        users.put("admin", new User("admin", "admin"));
        
        // Agregar un usuario de ejemplo ("salva" con contraseña "salva") a la Hashtable
        users.put("salva", new User("salva", "salva"));
        
        // Agregar una asignatura de ejemplo ("1" con nombre "matemáticas") a la Hashtable
        asignaturas.put("1", new Asignatura("1", "Matematicas"));
        
        // Asignar la Hashtable de usuarios al contexto del servlet con el nombre "users"
        sce.getServletContext().setAttribute("users", users);
        
        //Asignar la Hashtable de asignaturas al contexto del servlet con el nombre "asignaturas"
        sce.getServletContext().setAttribute("asignaturas", asignaturas);
    	
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }
	
}
