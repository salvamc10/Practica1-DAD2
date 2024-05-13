<%@ page import="java.util.Hashtable" %> 
<%@ page import="edu.ucam.pojos.User" %> 
<%@ taglib uri="mistags" prefix="listarAdmin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>CRUD de Usuarios</title>
    <link rel="stylesheet" href="css/estilos.css"/>
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
                <li>
                    <form action="Control" method="post">
                        <input type="hidden" name="idaccion" value="GestionTurnos">
                        <button type="submit">Turnos</button>
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

    <div class="admin-section">
        <h2>Listar Administradores</h2>
        <listarAdmin:listar tipo="admin"/>
    </div>
</body>
</html>