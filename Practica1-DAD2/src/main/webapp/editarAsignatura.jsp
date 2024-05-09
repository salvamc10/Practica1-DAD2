<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cambiar nombre</title>
<style>
    /* Estilos generales */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    /* Estilos del contenedor */
    .container {
        max-width: 400px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    /* Estilos para el título */
    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    /* Estilos para el formulario */
    form {
        display: flex;
        flex-direction: column;
    }

    /* Estilos para las etiquetas */
    label {
        margin-bottom: 10px;
        font-weight: bold;
    }

    /* Estilos para los campos de texto */
    input[type="text"] {
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
    }

    /* Estilos para los botones de envío */
    input[type="submit"] {
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>

<div class="container">
    <h2>Cambiar nombre</h2>
    
    <form action="Control" method="post">
        <input type="hidden" name="idaccion" value="EditarAsignatura">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
        <label for="contrasena">Nuevo Nombre:</label>
        <input type="text" id="nombre" name="nombre" required>
        <input type="submit" value="Cambiar nombre">
    </form>
</div>

</body>
</html>