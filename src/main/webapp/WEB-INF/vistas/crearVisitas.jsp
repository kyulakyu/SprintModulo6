<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/modulo6/res/css/styles.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<title>Crear Visita</title>
</head>

<body class="capacitacion">
	<%@ include file='navbar.jsp'%>
	<img class="imagen-zoom" src="/modulo6/res/img/logogrupo4.png"
		alt="Logo de la empresa">

	<div class="form-container">

		<div class="contacto">
		
			<form action="CrearVisitas" method="post">
				<h1 class="tituloContacto">Formulario de Visitas</h1>
                
                <label for="clienteId">Seleccionar Cliente:</label>
                <br>
                <select name="clienteId">
                    <c:forEach var="cliente" items="${clientes}">
                        <option value="${cliente.id}">${cliente.nombre}</option>
                    </c:forEach>
                </select>
                <br>
                <br>
                <label for="profesionalId">Seleccionar Profesional:</label>
                <br>
                <select name="profesionalId">
                    <c:forEach var="profesional" items="${profesionales}">
                        <option value="${profesional.id}">${profesional.nombre}</option>
                    </c:forEach>
                </select>
                <br>
                <br>
				<label for="fechaVisita">Ingrese la fecha de visita:</label>
				<br> 
				<input type="text" id="fechaVisita" name="fechaVisita" title="Formato DD/MM/AAAA">
				<br>
				<span id="fechaVisitaValidationMessage" style="color: red;"></span> 
				<br>
				<br>
				<label for="detalle">Ingrese el detalle de la visita:</label>
				<br> 
				<input type="text" id="detalle" name="detalle">
				<br>
				<span id="detalleValidationMessage" style="color: red;"></span> 
				<br>
				<br>
				<div class="contenedor-boton">
					<input type="submit" value="Enviar" class="boton-enviar">
				</div>
			</form>
		</div>
	</div>


	<div style="height: 100px;"></div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<!-- Incluir el archivo crearVisita.js -->
	<script src="/modulo6/res/js/crearVisitas.js"></script>

	<%@ include file='footer.jsp'%>
</body>

</html>
