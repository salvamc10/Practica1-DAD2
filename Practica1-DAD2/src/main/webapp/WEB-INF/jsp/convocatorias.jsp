<%@ page import="java.util.Hashtable" %>
<%@ page import="edu.ucam.pojos.Convocatoria" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>CRUD de Convocatorias</title>
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
    <h1>CRUD de Convocatorias</h1>

    <div class="form-section">
        <h2>Insertar nueva convocatoria</h2>
        <form action="Control" method="post">
            <input type="hidden" name="idaccion" value="InsertarConvocatoria">
            <div class="input-group">
                <label for="idConvocatoria">ID:</label>
                <input type="text" id="idConvocatoria" name="idConvocatoria" required>
            </div>
            <div class="input-group">
                <label for="nombreConvocatoria">Nombre:</label>
                <input type="text" id="nombreConvocatoria" name="nombreConvocatoria" required>
            </div>
            <button type="submit" class="submit-button">Insertar Convocatoria</button>
        </form>
    </div>

    <%
    if (request.getServletContext().getAttribute("convocatorias") != null) {
        Hashtable<String, Convocatoria> convocatorias = (Hashtable<String, Convocatoria>) request.getServletContext().getAttribute("convocatorias");
    %>

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
            <td><%= convocatoria.getIdConvocatoria() %></td>
            <td><%= convocatoria.getNombreConvocatoria() %></td>
            <td class="action-buttons">
                <form action="Control" method="post">
                    <input type="hidden" name="idaccion" value="BorrarConvocatoria">
                    <input type="hidden" name="idConvocatoria" value="<%= convocatoria.getIdConvocatoria() %>">
                    <button type="submit" class="delete-button">Borrar</button>
                </form>
                <form action="Control" method="post">
                    <input type="hidden" name="idaccion" value="ModConvocatoria">
                    <input type="hidden" name="idConvocatoria" value="<%= convocatoria.getIdConvocatoria() %>">
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
    <div class="form-section" style="text-align: center;">
    	<h2>Añadir turnos</h2>
        <form action="Control" method="post">
            <input type="hidden" name="idaccion" value="TurnoAddConvocatoria">
            <button type="submit" class="add-button">Añadir Turno</button>
        </form>
    </div>
</div>

</body>
</html>