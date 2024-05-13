<%@page import="edu.ucam.pojos.Convocatoria"%>
<%@page import="edu.ucam.pojos.Turno"%>
<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Asignar un turno</title>
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
    <div class="form-section">
        <h1>Asignar un turno a una convocatoria</h1>
        <form action="Control" method="post">
            <input type="hidden" name="idaccion" value="TurnoAddConvocatoria">
            <div class="input-group">
                <label for="idTurno">Id Turno:</label>
                <input type="text" id="idTurno" name="idTurno" required>
            </div>
            <div class="input-group">
                <label for="idConvocatoria">Id Convocatoria:</label>
                <input type="text" id="idConvocatoria" name="idConvocatoria" required>
            </div>
            <button type="submit" class="submit-button">Añadir Turno</button>
        </form>
    </div>

    <%
        Hashtable<String, Convocatoria> convocatorias = (Hashtable<String, Convocatoria>) request.getServletContext().getAttribute("convocatorias"); 
        Hashtable<String, Turno> turnos = (Hashtable<String, Turno>) request.getServletContext().getAttribute("turnos");

        for (Convocatoria convocatoria : convocatorias.values()) {
    %>
    <h2>Convocatoria: <%= convocatoria.getNombreConvocatoria() %></h2>
    <ul>
        <% 
            for (String idTurnoAsignado : convocatoria.getTurnos().keySet()) {
                Turno turnoAsignado = convocatoria.getTurnos().get(idTurnoAsignado);
        %>
        <li>Turno asignado: <%= turnoAsignado.getNombreTurno() %></li>
        <% 
            }
        %>
    </ul>
    <% 
        }
    %>
</div>
</body>
</html>