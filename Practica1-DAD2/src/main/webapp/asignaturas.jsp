<%@ page import="java.util.Hashtable" %>
<%@ page import="edu.ucam.pojos.Asignatura" %>
<%@ page import="edu.ucam.pojos.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>CRUD de Asignaturas</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
  }
  
  header {
    background-color: #007bff;
    color: white;
    padding: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  
  .logout-button {
    background-color: #dc3545;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 10px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  
  .logout-button:hover {
    background-color: #c82333;
  }
  
  .panel {
    max-width: 600px;
    margin: 30px auto;
    padding: 25px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
  }

  .panel h1 {
    text-align: center;
    color: #333;
  }

  .input-field {
    display: flex;
    flex-direction: column;
    margin-bottom: 15px;
  }

  .input-field label {
    font-weight: bold;
    margin-bottom: 5px;
  }

  .input-field input {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
  }

  .submit-button {
    padding: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .submit-button:hover {
    background-color: #0056b3;
  }

  table {
    width: 100%;
    border-collapse: collapse;
  }

  th, td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }

  th {
    background-color: #007bff;
    color: white;
  }

  tr:hover {
    background-color: #f2f2f2;
  }

  .action-buttons {
    display: flex;
    gap: 10px;
  }

  .action-buttons button {
    padding: 8px;
    border-radius: 5px;
    border: none;
    color: white;
    cursor: pointer;
  }

  .edit-button {
    background-color: #28a745;
  }

  .edit-button:hover {
    background-color: #218838;
  }

  .delete-button {
    background-color: #dc3545;
  }

  .delete-button:hover {
    background-color: #c82333;
  }

  .no-asignaturas {
    text-align: center;
    color: #555;
    margin-top: 20px;
  }
</style>
</head>
<body>

<header>
  <div>Bienvenido</div>
  <form action="Control" method="post">
    <input type="hidden" name="idaccion" value="Logout">
    <button type="submit" class="logout-button">Cerrar sesión</button>
  </form>
</header>

<div class="panel">
  <h1>CRUD de Asignaturas</h1>
  
  <!-- Formulario para insertar una nueva asignatura -->
  <form action="Control" method="post">
    <input type="hidden" name="idaccion" value="InsertarAsignatura">
    <h2>Insertar nueva asignatura</h2>
    <div class="input-field">
      <label for="id">ID:</label>
      <input type="text" id="id" name="id" required>
    </div>
    <div class="input-field">
      <label for="nombre">Nombre:</label>
      <input type="text" id="nombre" name="nombre" required>
    </div>
    <button type="submit" class="submit-button">Insertar asignatura</button>
  </form>
  
  <!-- Tabla de listado de asignaturas -->
  <%
    if (request.getServletContext().getAttribute("asignaturas") != null) {
      Hashtable<String, Asignatura> asignaturas = (Hashtable<String, Asignatura>) request.getServletContext().getAttribute("asignaturas");
  %>
  <h2>Listado de asignaturas</h2>
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody>
      <% 
      for (Asignatura asignatura : asignaturas.values()) { 
      %>
      <tr>
        <td><%= asignatura.getId() %></td>
        <td><%= asignatura.getNombre() %></td>
        <td class="action-buttons">
          <form action="Control" method="post">
            <input type="hidden" name="idaccion" value="BorrarAsignatura">
            <input type="hidden" name="id" value="<%= asignatura.getId() %>">
            <button type="submit" class="delete-button">Borrar</button>
          </form>
          <form action="Control" method="post">
            <input type="hidden" name="idaccion" value="ModAsignatura">
            <input type="hidden" name="id" value="<%= asignatura.getId() %>">
            <button type="submit" class="edit-button">Editar</button>
          </form>
        </td>
      </tr>
      <% 
      } 
      %>
    </tbody>
  </table>
  <% 
  } else { 
  %>
  <div class="no-asignaturas">No hay asignaturas registradas.</div>
  <% 
  } 
  %>
</div>

</body>
</html>
