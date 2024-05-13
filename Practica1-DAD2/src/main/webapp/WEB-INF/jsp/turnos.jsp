<%@ page import="java.util.Hashtable" %>
<%@ page import="edu.ucam.pojos.Turno" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>CRUD de Turnos</title>
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
        <h1>CRUD de Turnos</h1>

        <div class="form-section">
            <h2>Insertar nuevo turno</h2>
            <form action="Control" method="post">
                <input type="hidden" name="idaccion" value="InsertarTurno">
                <div class="input-group">
                    <label for="idTurno">ID:</label>
                    <input type="text" id="idTurno" name="idTurno" required>
                </div>
                <div class="input-group">
                    <label for="nombreTurno">Nombre:</label>
                    <input type="text" id="nombreTurno" name="nombreTurno" required>
                </div>
                <button type="submit" class="submit-button">Insertar turno</button>
            </form>
        </div>

        <%
            if (request.getServletContext().getAttribute("turnos") != null) {
                Hashtable<String, Turno> turnos = (Hashtable<String, Turno>) request.getServletContext().getAttribute("turnos");
        %>

        <h2>Listado de turnos</h2>
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
                    for (Turno turno : turnos.values()) {
                %>
                <tr>
                    <td><%= turno.getIdTurno() %></td>
                    <td><%= turno.getNombreTurno() %></td>
                    <td class="action-buttons">
                        <form action="Control" method="post">
                            <input type="hidden" name="idaccion" value="BorrarTurno">
                            <input type="hidden" name="idTurno" value="<%= turno.getIdTurno() %>">
                            <button type="submit" class="delete-button">Borrar</button>
                        </form>
                        <form action="Control" method="post">
                            <input type="hidden" name="idaccion" value="ModTurno">
                            <input type="hidden" name="idTurno" value="<%= turno.getIdTurno() %>">
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
        <p>No hay turnos registrados.</p>
        <% 
            } 
        %>
        <div class="form-section" style="text-align: center;">
    	<h2>Asignar asignaturas al turno</h2>
        <form action="Control" method="post">
            <input type="hidden" name="idaccion" value="AsignaturaAddTurno">
            <button type="submit" class="add-button">Asignar Asignaturas</button>
        </form>
    </div>
</body>
</html>