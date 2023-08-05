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

<title>Crear Capacitación</title>
</head>

<body>
	<%@ include file='navbar.jsp'%>
	<img class="imagen-zoom" src="/modulo6/res/img/logogrupo4.png" alt="Logo de la empresa">

	<div class="contacto" style="display: flex; justify-content: center;">
		<form action="/modulo6/CrearCapacitacion" method="post" onsubmit="return enviarFormulario(event)">
			<h1 class="tituloContacto">Formulario de Capacitación</h1>
			<label for="nombre">Ingrese Nombre de la Capacitación:</label><br> 
			<input type="text" id="nombre" name="nombre" title="Campo Obligatorio"><br> 
			<br><span id="nombreValidationMessage" style="color: red;"></span> <br> 
			<label for="rut">Ingrese Rut:</label><br> 
			<input type="text" id="rut" name="rut" title="Campo Obligatorio / Debe Introducir un Valor menor a 99.999.999 / sin puntos"><br>
			<br> <span id="rutValidationMessage" style="color: red;"></span> <br>
			<label for="dia">Ingrese el Día de la Capacitación:</label><br> 
			<input type="text" id="dia" name="dia" pattern="(lunes|martes|miercoles|jueves|viernes|sabado|domingo)" title="Por favor, introduzca un día válido (lunes, martes, miércoles, jueves, viernes, sábado o domingo)."><br>
			<br> <span id="diaValidationMessage" style="color: red;"></span> <br>
			<label for="hora">Ingrese la Hora de la Capacitación:</label><br> 
			<input type="text" id="hora" name="hora" title="Campo Obligatorio / en Formato HH:MM"><br>
			<br> <span id="horaValidationMessage" style="color: red;"></span> <br>
			<label for="lugar">Ingrese el Lugar de la Capacitación:</label><br> 
			<input type="text" id="lugar" name="lugar" title="Campo Obligatorio / Min 10 Caracteres Max 50"><br>
			<br> <span id="lugarValidationMessage" style="color: red;"></span> <br>
			<label for="duracion">Ingrese la Duración de la Capacitación(cantidad minutos):</label><br> 
			<input type="text" id="duracion" name="duracion" title="Campo Obligatorio / Max 70 Caracteres."><br>
			<br> <span id="duracionValidationMessage" style="color: red;"></span> <br>
			<label for="cantidadAsistentes">Ingrese la Cantidad de Asistentes:</label><br> 
			<input type="text" id="cantidadAsistentes" name="cantidadAsistentes" title="Campo Obligatorio / Debe Introducir un Valor Numérico."><br>
			<br> <span id="cantidadAsistentesValidationMessage" style="color: red;"></span> <br>

			<div style="display: flex; justify-content: center;">
				<input type="submit" value="Enviar" class="boton-enviar">
			</div>
		</form>
	</div>


	<div style="height: 100px;"></div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	    <!-- Incluir el archivo crearCapacitacion.js -->
    <script src="/modulo6/res/js/crearCapacitacion.js"></script>

	<%@ include file='footer.jsp'%>
</body>

</html>

