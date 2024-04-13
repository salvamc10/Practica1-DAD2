package edu.ucam.servlets;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Hashtable;

import edu.ucam.actions.Action;
import edu.ucam.actions.BorrarAsignatura;
import edu.ucam.actions.BorrarUsuario;
import edu.ucam.actions.EditarAsignatura;
import edu.ucam.actions.EditarUsuario;
import edu.ucam.actions.InsertarAsignatura;
import edu.ucam.actions.InsertarUsuario;
import edu.ucam.actions.LogOut;
import edu.ucam.actions.Login;
import edu.ucam.actions.ModAsignatura;
import edu.ucam.actions.ModUser;

/**
 * Servlet implementation class Control
 */
public class Control extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// Hashtable para mapear acciones a objetos Action
	private Hashtable<String, Action> actions;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Control() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
	public void init(ServletConfig config) throws ServletException {
	
    	// Si la Hashtable de acciones es nula, inicialízala y agrega acciones
        if (this.actions == null) {
            actions = new Hashtable<String, Action>();
            actions.put("Login", new Login());
            actions.put("Logout", new LogOut());
            actions.put("InsertarUsuario", new InsertarUsuario());
            actions.put("BorrarUsuario", new BorrarUsuario());
            actions.put("EditarUsuario", new EditarUsuario());
            actions.put("ModUser", new ModUser());
            actions.put("InsertarAsignatura", new InsertarAsignatura());
            actions.put("BorrarAsignatura", new BorrarAsignatura());
            actions.put("EditarAsignatura", new EditarAsignatura());
            actions.put("ModAsignatura", new ModAsignatura());
        }
        
        super.init();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String jsp;
        String accion = request.getParameter("idaccion");
        
        // Obtener la acción correspondiente según el parámetro "idaccion"
        Action action = actions.get(accion);
        
        // Ejecutar la acción y obtener la URL de la página resultante
        jsp = action.doAction(request, response);
        
        // Redirigir a la página correspondiente
        request.getRequestDispatcher(jsp).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
