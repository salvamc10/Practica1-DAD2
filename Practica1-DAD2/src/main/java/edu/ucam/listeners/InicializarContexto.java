package edu.ucam.listeners;

import java.util.Hashtable;

import edu.ucam.pojos.User;
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
        // Método llamado al inicializarse el contexto del servlet

        // Imprimir mensaje de inicialización del contexto
        System.out.println("Inicializando el contexto");
        
        // Crear una Hashtable para almacenar usuarios (clave: id, valor: User)
        Hashtable<String, User> users = new Hashtable<String, User>();
        
        // Agregar un usuario de ejemplo a la Hashtable
        users.put("1", new User("1", "admin"));
        
        // Asignar la Hashtable de usuarios al contexto del servlet
        sce.getServletContext().setAttribute("users", users);
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }
	
}
