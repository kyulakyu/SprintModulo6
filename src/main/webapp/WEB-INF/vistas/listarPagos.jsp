<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">

<title>Listado de Pagos</title>
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
		<h1>Listado de Pagos</h1>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>ID Cliente</th>
					<th>Monto</th>
					<th>Fecha del pago</th>
					<th>Detalle</th>
				</tr>
			</thead>
			<tbody>
				<%-- Iterar a través de la lista de pagos enviada desde el controlador --%>
				<c:forEach var="pago" items="${Pagos}">
					<tr>
						<td>${pago.identificador}</td>
						<td>${pago.clienteid}</td>
						<td>${pago.monto}</td>
						<td>${pago.fechapago}</td>
						<td>${pago.detalle}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<%@ include file='footer.jsp'%>
</body>

</html>