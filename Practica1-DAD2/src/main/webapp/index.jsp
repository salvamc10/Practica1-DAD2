<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Exámenes UCAM</title>
<style>
  /* Estilos globales para el cuerpo de la página */
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center; 
    align-items: center; 
    height: 100vh; 
  }

  /* Estilos específicos para el formulario */
  form {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 300px;
    position: relative;
  }

  /* Estilos para el título del formulario */
  h1 {
    text-align: center;
    color: #333;
  }

  /* Estilos para los campos de texto y contraseña */
  input[type="text"],
  input[type="password"],
  input[type="submit"] {
    width: 100%; 
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-sizing: border-box; 
  }

  /* Estilos específicos para el botón de submit */
  input[type="submit"] {
    margin-top: 10px; 
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
  }

  /* Cambio de color al pasar el ratón sobre el botón */
  input[type="submit"]:hover {
    background-color: #0056b3;
  }

  /* Estilos para el mensaje de credenciales incorrectas */
  .error-message {
    color: red;
    text-align: center;
  }
</style>
</head>
<body>
<form action="Control?idaccion=Login" method="post">

  <!-- Título del formulario -->
  <h1>Iniciar Sesión</h1>
  
  <!-- Etiqueta y campo de entrada para el usuario -->
  <label for="usuario">Usuario:</label>
  <input type="text" id="usuario" name="usuario">
  <br>
  
  <!-- Etiqueta y campo de entrada para la contraseña -->
  <label for="contrasena">Contraseña:</label>
  <input type="password" id="contrasena" name="contrasena">
  <br>
  
  <!-- Botón de submit -->
  <input type="submit" value="Login">
  
  <!-- Mensaje de error -->
  <%
    // Verificamos si el atributo LOGIN está presente y mostramos el mensaje correspondiente
    if (request.getAttribute("LOGIN") != null) {
  %>
    <p class="error-message">Credenciales incorrectas</p>
  <%
    }
  %>
  
</form>

</body>
</html>
