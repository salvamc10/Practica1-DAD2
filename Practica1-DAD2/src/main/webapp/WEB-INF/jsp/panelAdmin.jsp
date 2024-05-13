<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Opciones</title>
    <link rel="stylesheet" href="css/estilos.css"/>
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