package edu.ucam.listeners;

import java.util.Hashtable;

import edu.ucam.pojos.User;
import edu.ucam.pojos.Asignatura;
import edu.ucam.pojos.Convocatoria;
import edu.ucam.pojos.Turno;
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
        
        // Creamos las Hashtable para cada CRUD
        Hashtable<String, User> users = new Hashtable<String, User>(); 
        Hashtable<String, Convocatoria> convocatorias = new Hashtable<String, Convocatoria>(); 
        Hashtable<String, Turno> turnos = new Hashtable<String, Turno>();
        Hashtable<String, Asignatura> asignaturas = new Hashtable<String, Asignatura>();
        
        // Añadirmos 2 usuarios, 1 asignatura, 1 convocatoria
        users.put("admin", new User("admin", "admin"));    
        users.put("salva", new User("salva", "salva"));
        convocatorias.put("1", new Convocatoria("1", "Ordinaria"));
        turnos.put("1", new Turno("1", "Mañana"));
        asignaturas.put("1", new Asignatura("1", "Matematicas"));
        
        // Asignar las Hashtable al contexto del servlet
        sce.getServletContext().setAttribute("users", users);
        sce.getServletContext().setAttribute("convocatorias", convocatorias);
        sce.getServletContext().setAttribute("turnos", turnos);
        sce.getServletContext().setAttribute("asignaturas", asignaturas);
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }
	
}
