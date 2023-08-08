<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de Clientes</title>
</head>
<body>
    <h2>Listado de Clientes</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
        </tr>
        <c:forEach var="cliente" items="${clientes}">
            <tr>
                <td>${cliente.id}</td>
                <td>${cliente.nombre}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
