<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">

<title>Panel de Opciones</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    
    header {
        background-color: #007bff;
        color: #fff;
        padding: 12px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    nav ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }

    nav ul li {
        display: inline-block;
        margin-right: 20px;
    }

    nav ul li:last-child {
        margin-right: 0;
    }

    nav ul li button {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        cursor: pointer;
    }

    nav ul li button:hover {
        background-color: #0056b3;
    }

    .logout-button {
        background-color: #dc3545;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .logout-button:hover {
        background-color: #c82333;
    }

    .panel {
        max-width: 400px;
        margin: 40px auto;
        padding: 30px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        text-align: center; 
    }

    .panel h2 {
        color: #333;
        margin-bottom: 20px;
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
        padding: 12px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border: none;
        border-radius: 10px;
        text-align: center;
        font-size: 16px;
        width: 100%;
    }

    .action-button:hover {
        background-color: #0056b3;
    }
</style>

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

<div class="panel">
    <h2>Seleccione una opción</h2>
    <ul>
        <li>
            <form action="Control" method="post">
                <input type="hidden" name="idaccion" value="GestionAsignaturas">
                <button type="submit" class="action-button">CRUD de Asignaturas</button>
            </form>
        </li>
        
        <li>
            <form action="Control" method="post">
                <input type="hidden" name="idaccion" value="GestionConvocatorias">
                <button type="submit" class="action-button">CRUD de Convocatorias</button>
            </form>
        </li>
        <li>
            <form action="Control" method="post">
                <input type="hidden" name="idaccion" value="GestionTurnos">
                <button type="submit" class="action-button">CRUD de Turnos</button>
            </form>
        </li>
    </ul>
</div>

</body>
</html>
