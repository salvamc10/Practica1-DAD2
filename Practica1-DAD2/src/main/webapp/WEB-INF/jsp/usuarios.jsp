<%@ page import="java.util.Hashtable" %> 
<%@ page import="edu.ucam.pojos.User" %> 
<%@ taglib uri="mistags" prefix="listarAdmin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">

<title>CRUD de Usuarios</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        line-height: 1.6;
    }
    
    header {
        background-color: #007bff;
        color: #fff;
        padding: 12px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    nav ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }

    nav ul li {
        display: inline-block;
        margin-right: 20px;
    }

    nav ul li:last-child {
        margin-right: 0;
    }

    nav ul li button {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        cursor: pointer;
    }

    nav ul li button:hover {
        background-color: #0056b3;
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
    
    .admin-section {
        margin-top: 40px;
        padding: 20px;
        border-radius: 10px;
        background-color: white;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    }

    .admin-section h2 {
        text-align: center;
        color: #333;
    }
</style>

</head>

<body>

<header>
	Bienvenido
    <nav>
        <ul>
            <li>
               <form action="Control" method="post">
                   <input type="hidden" name="idaccion" value="GestionAsignaturas">
                   <button type="submit">Asignaturas</button>
               </form>
            </li>
            <li>
                <form action="Control" method="post">
                    <input type="hidden" name="idaccion" value="GestionConvocatorias">
                    <button type="submit">Convocatorias</button>
                </form>
            </li>            
        </ul>
    </nav>
    <form action="Control" method="post">
        <input type="hidden" name="idaccion" value="Logout">
    	<button type="submit" class="logout-button">Cerrar sesión</button>
	</form>
</header>

<div class="content">
    <h1>CRUD de Usuarios</h1>

    <!-- Formulario para insertar un nuevo usuario -->
    <div class="form-section">
        <h2>Insertar un nuevo usuario</h2>
        <form action="Control" method="post">
            <input type="hidden" name="idaccion" value="InsertarUsuario">
            <div class="input-group">
                <label for="usuario">Usuario:</label>
                <input type="text" id="usuario" name="usuario" required>
            </div>
            <div class="input-group">
                <label for="contrasena">Contraseña:</label>
                <input type="text" id="contrasena" name="contrasena" required>
            </div>
            <button type="submit" class="submit-button">Insertar usuario</button>
        </form>
    </div>

    <%
    if (request.getServletContext().getAttribute("users") != null) {
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
            <% 
            for (User user : users.values()) {
            %>
            <tr>
                <td><%= user.getUsuario() %></td>
                <td><%= user.getContrasena() %></td>
                <td class="action-buttons">
                    <form action="Control" method="post">
                        <input type="hidden" name="idaccion" value="BorrarUsuario">
                        <input type="hidden" name="usuario" value="<%= user.getUsuario() %>">
                        <button type="submit" class="delete-button">Borrar</button>
                    </form>
                    <form action="Control" method="post">
                        <input type="hidden" name="idaccion" value="ModUser">
                        <input type="hidden" name="usuario" value="<%= user.getUsuario() %>">
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
    <p>No hay usuarios registrados.</p>
    <% 
    } 
    %>
</div>

<!-- Sección para listar administradores -->
<div class="admin-section">
    <h2>Listar Administradores</h2>
    <listarAdmin:listar tipo="admin"/>
</div>

</body>
</html>
