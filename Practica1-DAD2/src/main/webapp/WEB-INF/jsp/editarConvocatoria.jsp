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
        <h2>Cambiar nombre de la convocatoria</h2>
        
        <form action="Control" method="post">
            <input type="hidden" name="idaccion" value="EditarConvocatoria">
            <input type="hidden" name="idConvocatoria" value="<%= request.getParameter("idConvocatoria") %>">
            <label for="nombreConvocatoria">Nuevo nombre de la convocatoria:</label>
            <input type="text" id="nombreConvocatoria" name="nombreConvocatoria" required>
            <input type="submit" value="Cambiar nombre">
        </form>
    </div>
</body>
</html>