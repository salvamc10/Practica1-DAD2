<%@ page import="java.util.Hashtable" %> 
<%@ page import="edu.ucam.pojos.User" %> 
<%@ taglib uri="mistags" prefix="listarAdmin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD de Usuarios</title>
<style>
  /* Estilos globales para el cuerpo de la página */
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 20; 
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
  }
  
  /* Estilos del encabezado */
    header {
        background-color: #007bff;
        color: #fff;
        padding: 10px;
        display: flex;
        justify-content: space-between; 
        align-items: center; 
        width: 100%;
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
      margin-right: 20px;
  }

  .logout-button:hover {
      background-color: #c82333;
  }
    
  /* Estilos para el formulario y la tabla */
  form, table {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-top: 60px; 
    width: 100%;
    max-width: 600px;
  }

  /* Estilos para el título */
  h1 {
    text-align: center;
    color: #333;
    margin-top: 40px; 
  }

  /* Estilos para los campos de texto, contraseña y botones */
  input[type="text"],
  input[type="password"],
  input[type="submit"] {
    width: 100%; 
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-sizing: border-box; 
  }

  input[type="submit"] {
    margin-top: 10px; 
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #0056b3;
  }

  /* Estilos para la tabla */
  table {
    width: 100%;
    border-collapse: collapse;
  }

  th, td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
    text-align: left;
  }

  th {
    background-color: #007bff;
    color: #fff;
  }

  tr:hover {
    background-color: #f2f2f2;
  }

  /* Estilos para los botones de acción */
  .action-buttons {
    display: flex;
    align-items: center;
  }

  .action-buttons a {
    display: inline-block;
    padding: 5px 10px;
    margin-right: 5px;
    text-decoration: none;
    border-radius: 3px;
    cursor: pointer;
  }

  .edit-button {
    background-color: #28a745;
    color: #fff;
  }

  .edit-button:hover {
    background-color: #218838;
  }

  .delete-button {
    background-color: #dc3545;
    color: #fff;
  }

  .delete-button:hover {
    background-color: #c82333;
  }
  
  /* Estilos para las secciones de administración */
.admin-section {
    margin-top: 40px;
    width: 100%;
    max-width: 600px;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.section-title {
    text-align: center;
    color: #007bff;
    margin-bottom: 20px;
}

.admin-table {
    width: 100%;
    border-collapse: collapse;
}

.admin-table td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
    text-align: left;
}

/* Estilos para mejorar la visualización del componente listarAdmin */
.listarAdmin {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #f0f0f0;
    border: none;
    color: #333;
    font-family: Arial, sans-serif;
}
</style>
</head>
<body>

<header>
    <div class="user-info">
        <span>Bienvenido</span>
    </div>
    <form action="Control" method="post">
    	<input type="hidden" name="idaccion" value="Logout">
        <button type="submit" class="logout-button">Cerrar sesión</button>
    </form>
</header>

<h1>CRUD de Usuarios</h1>

<!-- Formulario para insertar un nuevo usuario -->
<form action="Control" method="post">
  <input type="hidden" name="idaccion" value="InsertarUsuario">
  <h2>Insertar un nuevo usuario</h2>
  <label for="usuario">Usuario:</label>
  <input type="text" id="usuario" name="usuario" required>
  <br>
  <label for="contrasena">Contraseña:</label>
  <input type="text" id="contrasena" name="contrasena" required>
  <br>
  <input type="submit" value="Insertar usuario">
</form>

<%
  /* Mostrar datos */
  if(request.getServletContext().getAttribute("users") != null){
    Hashtable<String, User> users = (Hashtable<String, User>) request.getServletContext().getAttribute("users");
%>

<!-- Tabla de listado de usuarios -->
<h2>Listado de usuarios</h2>
<table>
  <thead>
    <tr>
      <th>Usuario</th>
      <th>Contraseña</th>
      <th>Acciones</th>
    </tr>
  </thead>
  <tbody>
    <% for(User user : users.values()) { %>
    <tr>
      <td><%= user.getUsuario() %></td>
      <td><%= user.getContrasena() %></td>
      <td class="action-buttons">
    	<!-- Formulario para borrar un usuario -->
    	<form action="Control" method="post">
        	<input type="hidden" name="idaccion" value="BorrarUsuario">
        	<input type="hidden" name="usuario" value="<%= user.getUsuario() %>">
        	<button type="submit" class="delete-button">Borrar</button>
    	</form>
    	<!-- Formulario para editar un usuario -->
    	<form action="Control" method="post">
        	<input type="hidden" name="idaccion" value="ModUser">
        	<input type="hidden" name="usuario" value="<%= user.getUsuario() %>">
        	<button type="submit" class="edit-button">Editar</button>
    	</form>
	  </td>
    </tr>
    <% } %>
  </tbody>
</table>

<% } else { %>
<!-- Mensaje si no hay usuarios registrados -->
<p>No hay usuarios registrados.</p>
<% } %>

<!-- Sección para listar administradores -->
<section class="admin-section">
    <h2 class="section-title">Listar Administradores</h2>
    <table class="admin-table">
      <tbody>
      	<tr>
      		<td><listarAdmin:listar tipo="admin"/></td>
      	</tr>
      </tbody>
    </table>
</section>

</body>
</html>
