<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Panel de opciones</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }
    
    .panel {
        width: 300px;
        margin: 100px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    
    .panel h2 {
        margin-bottom: 20px;
        color: #333;
    }
    
    .panel ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
    }
    
    .panel li {
        margin-bottom: 10px;
    }
    
    .panel a {
        display: block;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }
    
    .panel a:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>

<div class="panel">
    <h2>Seleccione una opción</h2>
    <ul>
        <li><a href="usuarios.jsp">CRUD de Usuarios</a></li>
        <li><a href="asignaturas.jsp">CRUD de Asignaturas</a></li>
    </ul>
</div>

</body>
</html>