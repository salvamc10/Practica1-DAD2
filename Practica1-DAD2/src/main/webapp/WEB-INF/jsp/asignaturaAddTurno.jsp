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


</head>
<body>

<h1>Insertar Asignatura a Turno</h1>

<br>
<form action="Control">
<input type="hidden" name="idaccion" value="AsignaturaAddTurno">
Asignatura <input type="text" name="idAsignatura"><br>
Turno <input type="text" name="idTurno"><br>
<input type ="submit" value="Añadir Asignatura a Turno">
</form>

<%
	Hashtable<String, Turno> turnos = (Hashtable<String, Turno>) request.getServletContext().getAttribute("turnos"); 
	Hashtable<String, Asignatura> asignaturas = (Hashtable<String, Asignatura>) request.getServletContext().getAttribute("asignaturas");

%>

<table>
  <thead>
    <tr>
      <th> 
      		<h2>Turnos</h2>
      		<%
      			for(Turno turno : turnos.values()){
      				out.println(turno.getIdTurno());%><br><%
      			}
      		%>
	  </th>
      <th>
      		<h2>Asignaturas</h2>
      		<%
      			for(Asignatura asignatura : asignaturas.values()){
      				out.println(asignatura.getIdAsignatura());%><br><%
      			}
      		%>
      </th>
     </tr>
    </thead>
</table>

</body>
</html>