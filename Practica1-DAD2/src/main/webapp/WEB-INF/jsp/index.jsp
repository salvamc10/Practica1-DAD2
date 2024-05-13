<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Exámenes UCAM</title>
    <link rel="stylesheet" href="css/estilos.css"/>
</head>
<body>
    <div class="login-form">
        <form action="Control" method="post">
            <input type="hidden" name="idaccion" value="Login">
            <h1>Iniciar Sesión</h1>
            <label for="usuario">Usuario:</label>
            <input type="text" id="usuario" name="usuario">
            <br>
            <label for="contrasena">Contraseña:</label>
            <input type="password" id="contrasena" name="contrasena">
            <br>
            <input type="submit" value="Login">
            <%-- Verificamos si el atributo LOGIN está presente y mostramos el mensaje correspondiente --%>
            <% if (request.getAttribute("LOGIN") != null) { %>
                <p class="error-message">Credenciales incorrectas</p>
            <% } %>
        </form>
    </div>
</body>
</html>