<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>Crear Pago</title>
</head>

<body>
	<%@ include file='navbar.jsp'%>
	<img class="imagen-zoom" src="/modulo6/res/img/logogrupo4.png" alt="Logo de la empresa">

	<div class="contacto" style="display: flex; justify-content: center;">
		<form id="formularioPago" action="/modulo6/CrearPago" method="post" onsubmit="return enviarFormulario(event)">
			<h1 class="tituloContacto">Registro de Pagos</h1> 
			<label for="clienteId">Seleccionar Cliente:</label>
                <br>
                <select name="clienteid">
                    <c:forEach var="cliente" items="${clientes}">
                        <option value="${cliente.id}">${cliente.nombre}</option>
                    </c:forEach>
                </select> <br><br>
			<label for="monto">Ingrese el Monto:</label><br> 
			<input type="text" id="monto" name="monto" title="Campo Obligatorio / Debe Introducir un Valor Numérico.">
			<br> <span id="montoValidationMessage" style="color: red;"></span> <br><br> 
			<label for="fechapago">Ingrese el Día del Pago:</label><br> 
			<input type="text" id="fechapago" name="fechapago"title="Por favor, introduzca un día válido (DD/MM/AAAA)."	placeholder="DD/MM/AAAA"> <br> 
			<span id="fechapagoValidationMessage" style="color: red;"></span> <br> <br>
			<label for="detalle">Ingrese el Detalle:</label><br> 
			<input type="text" id="detalle" name="detalle" title="Campo Obligatorio / Min 10 Caracteres Max 50">
			<br> <span id="detalleValidationMessage" style="color: red;"></span> <br><br>

			<div style="display: flex; justify-content: center;">
				<input type="submit" value="Enviar" class="boton-enviar">
			</div>
		</form>
	</div>


	<div style="height: 100px;"></div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<!-- Incluir el archivo para las validaciones -->
    <script src="/modulo6/res/js/crearPago.js"></script>

	<%@ include file='footer.jsp'%>
</body>

</html>