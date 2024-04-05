<%@ page import="java.util.Hashtable" %> 
<%@ page import="edu.ucam.pojos.User" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Panel de opciones</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    
    /* Estilos del encabezado */
    header {
        background-color: #007bff;
        color: #fff;
        padding: 10px;
        display: flex;
        justify-content: space-between; 
        align-items: center; 
    }

    .user-info {
        margin-right: 20px;
        margin-left: 20px;
    }

    .logout-button {
        background-color: #dc3545;
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 8px 15px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .logout-button:hover {
        background-color: #c82333;
        margin-right: 20px;
    }
    
    .panel {
        width: 300px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    
    .panel h2 {
        margin-bottom: 20px;
        color: #333;
    }
    
    .panel ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
    }
    
    .panel li {
        margin-bottom: 10px;
    }
    
    .panel a {
        display: block;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }
    
    .panel a:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>

<header>
    <div class="user-info">
        <%-- Obtener el nombre de usuario del primer usuario en la Hashtable --%>
        <% Hashtable<String, User> users = (Hashtable<String, User>) request.getServletContext().getAttribute("users");
           if(users != null && !users.isEmpty()) {
               // Obtener el primer usuario de la Hashtable
               String nombreUsuario = users.keySet().iterator().next();
        %>
        <span>Bienvenido, <%= nombreUsuario %></span>
        <% } %>
    </div>
    <form action="Control?idaccion=Logout" method="post">
        <button type="submit" class="logout-button">Cerrar sesión</button>
    </form>
</header>

<div class="panel">
    <h2>Seleccione una opción</h2>
    <ul>
        <li><a href="usuarios.jsp">CRUD de Usuarios</a></li>
        <li><a href="asignaturas.jsp">CRUD de Asignaturas</a></li>
    </ul>
</div>

</body>
</html>