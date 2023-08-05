<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/modulo6/res/css/styles.css">
<style>
body {
	background-image: url("/modulo6/res/img/imagen3.png");
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

<title>Crear Usuario</title>
</head>

<body>
<%@ include file='navbar.jsp'%>
<img class="imagen-zoom" src="/modulo6/res/img/logogrupo4.png" alt="Logo de la empresa">

<div class="contacto" style="display: flex; justify-content: center;">
    <form action="/modulo6/CrearUsuario" method="post" onsubmit="return enviarFormulario(event)">
        <h1 class="tituloContacto">Formulario de Usuario</h1>
        <label for="id">Ingrese Identificador del Usuario:</label><br>
        <input type="text" id="identificador" name="identificador" title="Campo Obligatorio / Debe Introducir un Valor Numérico."><br>
        <br> <span id="idValidationMessage" style="color: red;"></span> <br> 
        <label for="nombre">Ingrese Nombre del Usuario:</label><br> 
        <input type="text" id="nombre" name="nombre" title="Campo Obligatorio"><br> <br>
        <span id="nombreValidationMessage" style="color: red;"></span>
        <label for="fechaNacimiento">Ingrese la fecha de nacimiento:</label><br>
        <input type="text" id="fechaNacimiento" name="fechaNacimiento" title="Fecha en formato dd/MM/yyyy"><br>
        <br> <span id="fechaNacimientoValidationMessage" style="color: red;"></span>
        <label for="run">Ingrese Run:</label><br> 
        <input type="text" id="run" name="run" title="Campo Obligatorio / Debe Introducir un Valor menor a 99.999.999 /sin puntos"><br>
        <br> <span id="runValidationMessage" style="color: red;"></span> <br>
        <label for="tipo">Seleccione Tipo de Usuario:</label><br> 
        <select id="tipo" name="tipo" title="Campo Obligatorio">
            <option value="Administrativo">Administrativo</option>
            <option value="Cliente">Cliente</option>
            <option value="Profesional">Profesional</option>
        </select><br>
        <br> <span id="tipoValidationMessage" style="color: red;"></span> <br>

        <div style="display: flex; justify-content: center;">
            <input type="submit" value="Enviar" class="boton-enviar">
        </div>
    </form>
</div>

<div style="height: 100px;"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	    <!-- Incluir el archivo crearUsuario.js -->
    <script src="/modulo6/res/js/crearUsuario.js"></script>

<%@ include file='footer.jsp'%>
</body>
</html>
