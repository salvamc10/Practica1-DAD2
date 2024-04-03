<%@ page import="java.util.Hashtable" %>
<%@ page import="edu.ucam.pojos.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD de Usuarios</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
  }

  form, table {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    width: 100%;
    max-width: 600px;
  }

  h1 {
    text-align: center;
    color: #333;
  }

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
</style>
</head>
<body>

<h1>CRUD de Usuarios</h1>

<form action="Control?idaccion=InsertarUsuario" method="post">
  <h2>Insertar un nuevo usuario</h2>
  <label for="usuario">Usuario:</label>
  <input type="text" id="usuario" name="usuario">
  <br>
  <label for="contrasena">Contraseña:</label>
  <input type="text" id="contrasena" name="contrasena">
  <br>
  <input type="submit" value="Insertar usuario">
</form>

<%
  /* Mostrar datos */
  if(request.getServletContext().getAttribute("users") != null){
    Hashtable<String, User> users = (Hashtable<String, User>) request.getServletContext().getAttribute("users");
%>

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
        <a href="Control?idaccion=BorrarUsuario&usuario=<%= user.getUsuario() %>" class="delete-button">Borrar</a>
        <a href="Control?idaccion=EditarUsuario&user=<%= user.getUsuario() %>" class="edit-button">Editar</a>
      </td>
    </tr>
    <% } %>
  </tbody>
</table>

<% } else { %>
<p>No hay usuarios registrados.</p>
<% } %>

</body>
</html>
