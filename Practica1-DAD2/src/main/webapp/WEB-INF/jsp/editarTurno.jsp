<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambiar nombre turno</title>
    <link rel="stylesheet" href="css/estilos.css"/>
</head>

<body>
    <div class="editar-form">
        <h2>Cambiar nombre del turno</h2>
        
        <form action="Control" method="post">
            <input type="hidden" name="idaccion" value="EditarTurno">
            <input type="hidden" name="idTurno" value="<%= request.getParameter("idTurno") %>">
            <label for="nombreTurno">Nuevo nombre del turno:</label>
            <input type="text" id="nombreTurno" name="nombreTurno" required>
            <input type="submit" value="Cambiar nombre">
        </form>
    </div>
</body>
</html>