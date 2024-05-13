<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambiar nombre</title>
    <link rel="stylesheet" href="css/estilos.css"/>
</head>

<body>
    <div class="editar-form">
        <h2>Cambiar nombre de la asignatura</h2>
        
        <form action="Control" method="post">
            <input type="hidden" name="idaccion" value="EditarAsignatura">
            <input type="hidden" name="idAsignatura" value="<%= request.getParameter("idAsignatura") %>">
            <label for="nombre">Nuevo nombre de la asignatura:</label>
            <input type="text" id="nombreAsignatura" name="nombreAsignatura" required>
            <input type="submit" value="Cambiar nombre">
        </form>
    </div>
</body>
</html>