<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">

<title>Listado de Capacitaciones</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="/modulo6/res/css/styles.css">
</head>

<body>
	<%@ include file='navbar.jsp'%>
	<img class="imagen-zoom" src="/modulo6/res/img/logogrupo4.png"
		alt="Logo de la empresa">
	<div class="container">
		<h1>Listado de Capacitaciones</h1>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>Rut</th>
					<th>Dia</th>
					<th>Hora</th>
					<th>Lugar</th>
					<th>Duracion</th>
					<th>Cantidad</th>
					<th>Nombre</th>
					<th>Detalle</th>
				</tr>
			</thead>
			<tbody>
				<%-- Iterar a través de la lista de capacitaciones enviada desde el controlador --%>
				<c:forEach var="capacitacion" items="${capacitaciones}">
					<tr>
						<td>${capacitacion.identificador}</td>
						<td>${capacitacion.rut}</td>
						<td>${capacitacion.dia}</td>
						<td>${capacitacion.hora}</td>
						<td>${capacitacion.lugar}</td>
						<td>${capacitacion.duracion}</td>
						<td>${capacitacion.cantidad}</td>
						<td>${capacitacion.nombre}</td>
						<td>${capacitacion.mostrarDetalle()}</td>


					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<%@ include file='footer.jsp'%>
</body>

</html>