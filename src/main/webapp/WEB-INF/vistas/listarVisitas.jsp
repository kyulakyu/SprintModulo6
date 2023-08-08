<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">

<title>Listado de Visitas</title>
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
		<h1>Listado de Visitas</h1>
		<button id="btnActualizarCheckboxes">Actualizar Checkboxes</button>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>Id Visita</th>
					<th>Fecha de la Visita</th>
					<th>Detalle de la visita</th>
					<th>Id Cliente</th>
					<th>Id Profesional</th>
					<th>Se realizó la visita?</th>
					<th>Se realizó la visita?</th>
				</tr>
			</thead>
			<tbody>
				<%-- Iterar a través de la lista de capacitaciones enviada desde el controlador --%>
				<c:forEach var="visita" items="${visitas}">
					<tr>
						<td>${visita.idVisita}</td>
						<td>${visita.fechaVisita}</td>
						<td>${visita.detalle}</td>
						<td>${visita.clienteId}</td>
						<td>${visita.profesionalId}</td>
						<td><c:choose>
								<c:when test="${visita.visitaRealizada}">
									<span>&#10004;</span>
									<!-- Marca de verificación -->
								</c:when>
								<c:otherwise>
									<span>&#10008;</span>
									<!-- Cruz -->
								</c:otherwise>
							</c:choose></td>
						<td><input type="checkbox" class="check-realizada"
							data-visita-id="${visita.idVisita}"
							${visita.visitaRealizada ? 'checked' : ''}></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<!-- Incluir el archivo ListarVisitas.js -->
	<script src="/modulo6/res/js/listarVisitas.js"></script>

	<%@ include file='footer.jsp'%>
</body>
</html>