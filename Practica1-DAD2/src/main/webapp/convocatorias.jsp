<%@ page import="java.util.Hashtable" %>
<%@ page import="edu.ucam.pojos.Convocatoria" %>
<%@ page import="edu.ucam.pojos.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>CRUD de Convocatorias</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        line-height: 1.6; /* Para mayor legibilidad */
    }
    
    header {
        background-color: #007bff;
        color: white;
        padding: 15px 20px;
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

    .content {
        max-width: 800px;
        margin: 30px auto;
        padding: 20px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

    .content h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    .form-section {
        padding: 20px;
        border-radius: 10px;
    }

    .form-section h2 {
        text-align: center;
        color: #007bff;
        margin-bottom: 20px;
    }

    .input-group {
        margin-bottom: 20px;
    }

    .input-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .input-group input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
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
        margin-top: 20px;
    }

    th, td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        text-align: left;
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
        gap: 20px;
    }

    .edit-button {
        background-color: #28a745;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .edit-button:hover {
        background-color: #218838;
    }

    .delete-button {
        background-color: #dc3545;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .delete-button:hover {
        background-color: #c82333;
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

<div class="content">
    <h1>CRUD de Convocatorias</h1>

    <!-- Formulario para insertar una nueva convocatoria -->
    <div class="form-section">
        <h2>Insertar nueva convocatoria</h2>
        <form action="Control" method="post">
            <input type="hidden" name="idaccion" value="InsertarConvocatoria">
            <div class="input-group">
                <label for="id">ID:</label>
      			<input type="text" id="id" name="id" required>
            </div>
            <div class="input-group">
                <label for="nombre">Nombre:</label>
      			<input type="text" id="nombre" name="nombre" required>
            </div>
            <button type="submit" class="submit-button">Insertar Convocatoria</button>
        </form>
    </div>

    <%
    if (request.getServletContext().getAttribute("convocatorias") != null) {
        Hashtable<String, Convocatoria> convocatorias = (Hashtable<String, Convocatoria>) request.getServletContext().getAttribute("convocatorias");
    %>
    <!-- Tabla de listado de usuarios -->
    <h2>Listado de convocatorias</h2>
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
            for (Convocatoria convocatoria : convocatorias.values()) {
            %>
            <tr>
                <td><%= convocatoria.getId() %></td>
                <td><%= convocatoria.getNombre() %></td>
                <td class="action-buttons">
                    <form action="Control" method="post">
                        <input type="hidden" name="idaccion" value="BorrarConvocatoria">
                        <input type="hidden" name="id" value="<%= convocatoria.getId() %>">
                        <button type="submit" class="delete-button">Borrar</button>
                    </form>
                    <form action="Control" method="post">
                        <input type="hidden" name="idaccion" value="ModAsignatura">
                        <input type="hidden" name="id" value="<%= convocatoria.getId() %>">
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
    <p>No hay asignaturas registrados.</p>
    <% 
    } 
    %>
</div>

</body>
</html>
