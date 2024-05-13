<%@page import="edu.ucam.pojos.Convocatoria"%>
<%@page import="edu.ucam.pojos.Turno"%>
<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Asignar un turno</title>
</head>
<body>
    <h1>Asignar un turno a una convocatoria</h1>
    <form action="Control">
        <input type="hidden" name="idaccion" VALUE="TurnoAddConvocatoria">
        Id Turno    <input type="text" name="idTurno"><br>
        Id Convocatoria    <input type="text" name="idConvocatoria"><br>
        <input type ="submit" value="Añadir Turno">
    </form>

    <%
        Hashtable<String, Convocatoria> convocatorias = (Hashtable<String, Convocatoria>) request.getServletContext().getAttribute("convocatorias"); 
        Hashtable<String, Turno> turnos = (Hashtable<String, Turno>) request.getServletContext().getAttribute("turnos");

        for (Convocatoria convocatoria : convocatorias.values()) {
    %>
    <h2>Convocatoria: <%= convocatoria.getIdConvocatoria() %></h2>
    <ul>
        <% 
            for (String idTurnoAsignado : convocatoria.getTurnos().keySet()) {
                Turno turnoAsignado = convocatoria.getTurnos().get(idTurnoAsignado);
        %>
        <li>Turno asignado: <%= turnoAsignado.getIdTurno() %></li>
        <% 
            }
        %>
    </ul>
    <% 
        }
    %>
</body>
</html>
