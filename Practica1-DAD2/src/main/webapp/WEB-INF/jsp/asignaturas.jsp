<%@ page import="java.util.Hashtable" %>
<%@ page import="edu.ucam.pojos.Asignatura" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>CRUD de Asignaturas</title>
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
        <h1>CRUD de Asignaturas</h1>

        <div class="form-section">
            <h2>Insertar nueva asignatura</h2>
            <form action="Control" method="post">
                <input type="hidden" name="idaccion" value="InsertarAsignatura">
                <div class="input-group">
                    <label for="idAsignatura">ID:</label>
                    <input type="text" id="idAsignatura" name="idAsignatura" required>
                </div>
                <div class="input-group">
                    <label for="nombreAsignatura">Nombre:</label>
                    <input type="text" id="nombreAsignatura" name="nombreAsignatura" required>
                </div>
                <button type="submit" class="submit-button">Insertar asignatura</button>
            </form>
        </div>

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
                    <td><%= asignatura.getIdAsignatura() %></td>
                    <td><%= asignatura.getNombreAsignatura() %></td>
                    <td class="action-buttons">
                        <form action="Control" method="post">
                            <input type="hidden" name="idaccion" value="BorrarAsignatura">
                            <input type="hidden" name="idAsignatura" value="<%= asignatura.getIdAsignatura() %>">
                            <button type="submit" class="delete-button">Borrar</button>
                        </form>
                        <form action="Control" method="post">
                            <input type="hidden" name="idaccion" value="ModAsignatura">
                            <input type="hidden" name="idAsignatura" value="<%= asignatura.getIdAsignatura() %>">
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