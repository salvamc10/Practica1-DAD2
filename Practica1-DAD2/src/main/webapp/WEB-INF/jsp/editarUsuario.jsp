<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambiar Contraseña</title>
    <link rel="stylesheet" href="css/estilos.css"/>
</head>

<body>
    <div class="editar-form">
        <h2>Cambiar contraseña</h2>
        
        <form action="Control" method="post">
            <input type="hidden" name="idaccion" value="EditarUsuario">
            <input type="hidden" name="usuario" value="<%= request.getParameter("usuario") %>">
            <label for="contrasena">Nueva Contraseña:</label>
            <input type="text" id="contrasena" name="contrasena" required>
            <input type="submit" value="Actualizar contraseña">
        </form>
    </div>
</body>
</html>