<%@page import="edu.ucam.pojos.Asignatura"%>
<%@page import="edu.ucam.pojos.Turno"%>
<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insertar Asignatura en un Turno</title>
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
    <div class="form-sectio|n">
    	<h1>Insertar Asignatura a Turno</h1>
        <form action="Control" method="post">
            <input type="hidden" name="idaccion" value="AsignaturaAddTurno">
            <div class="input-group">
                <label for="idAsignatura">Asignatura:</label>
                <input type="text" id="idAsignatura" name="idAsignatura">
            </div>
            <div class="input-group">
                <label for="idTurno">Turno:</label>
                <input type="text" id="idTurno" name="idTurno">
            </div>
            <button type="submit" class="submit-button">Añadir Asignatura a Turno</button>
        </form>
    </div>
	<%
        Hashtable<String, Turno> turnos = (Hashtable<String, Turno>) request.getServletContext().getAttribute("turnos");
		Hashtable<String, Asignatura> asignaturas = (Hashtable<String, Asignatura>) request.getServletContext().getAttribute("asignaturas");

        for (Turno turno : turnos.values()) {
    %>
    <h2>Turno: <%= turno.getNombreTurno() %></h2>
    <ul>
        <% 
            for (String idAsignaturaAsignada : turno.getAsignaturas().keySet() ) {
                Asignatura asignaturaAsignada = turno.getAsignaturas().get(idAsignaturaAsignada);
        %>
        <li>Asignatura asignada: <%= asignaturaAsignada.getNombreAsignatura() %></li>
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