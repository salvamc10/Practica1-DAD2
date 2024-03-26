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
         // TODO Auto-generated method stub
    	
    	System.out.println("Inicializando el contexto");
    	
    	Hashtable<String, User> users = new Hashtable<String, User>();
    	
    	users.put("1", new User("1", "admin"));
    	
    	sce.getServletContext().setAttribute("users", users);
    	
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }
	
}
