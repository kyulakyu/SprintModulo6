<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">

<title>Listado de Usuarios</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/modulo6/res/css/styles.css">

<%@ include file="navbar.jsp"%>


</head>

<body>
<img class="imagen-zoom" src="/modulo6/res/img/logogrupo4.png"
	alt="Logo de la empresa">
	<div class="container">
		<h1>Listado de Usuarios</h1>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>Nombre</th>
					<th>Tipo</th>
					<th>Fecha de nacimiento</th>
					<th>Run</th>
				</tr>
			</thead>
			<tbody>
				<%-- Iterar a través de la lista de usuarios enviada desde el controlador --%>
				<c:forEach var="usuarios" items="${usuarios}">
					<tr>
						<td>${usuarios.id}</td>
						<td>${usuarios.nombre}</td>
						<td>${usuarios.tipo}</td>
						<td>${usuarios.fechaNacimiento}</td>
						<td>${usuarios.run}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>

</html>