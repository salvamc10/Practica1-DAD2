<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Panel de Opciones</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    
    header {
        background-color: #007bff;
        color: white;
        padding: 15px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .user-info {
        font-weight: bold;
    }

    .logout-button {
        background-color: #dc3545;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 10px 15px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .logout-button:hover {
        background-color: #c82333;
    }
    
    .panel {
        max-width: 400px;
        margin: 30px auto;
        padding: 25px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }
    
    .panel h2 {
        margin-bottom: 20px;
        color: #333;
        text-align: center;
    }
    
    .panel ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
    }
    
    .panel li {
        margin-bottom: 15px;
    }
    
    .action-button {
        display: block;
        width: 100%;
        padding: 10px;
        border: none;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
        text-align: center;
    }
    
    .action-button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>

<header>
    <div class="user-info">Bienvenido</div>
    <form action="Control" method="post">
    	<input type="hidden" name="idaccion" value="Logout">
        <button type="submit" class="logout-button">Cerrar sesión</button>
    </form>
</header>

<div class="panel">
    <h2>Seleccione una opción</h2>
    <ul>
        <li>
        	<form action="Control" method="post">
        		<input type="hidden" name="idaccion" value="GestionUsuarios">
        		<button type="submit" class="action-button">CRUD de Usuarios</button>
    		</form>
        </li>
        <li>
        	<form action="Control" method="post">
        		<input type="hidden" name="idaccion" value="GestionAsignaturas">
        		<button type="submit" class="action-button">CRUD de Asignaturas</button>
    		</form>
		</li>
    </ul>
</div>

</body>
</html>