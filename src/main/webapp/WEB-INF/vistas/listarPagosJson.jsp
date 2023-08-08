<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de pagos en JSON</title>
    <link rel="stylesheet" type="text/css" href="/modulo6/res/css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                url: "http://modulo6/api/pagos",
                type: "GET",
                dataType: "json",
                success: function (data) {
                    // Manipular los datos recibidos y mostrarlos en la pagina
                    var pago = data;
                    var pagoContainer = $("#pagoContainer");

                    var table = "<table class='table table-striped'>" +
                                "<thead>" +
                                "<tr>" +
                                "<th>ID</th>" +
                                "<th>ID Cliente</th>" +
                                "<th>Monto</th>" +
                                "<th>Fecha del pago</th>" +
                                "<th>Detalle</th>" +
                                "</tr>" +
                                "</thead>" +
                                "<tbody>";
                    
                    $.each(pago, function(index, pago) {
                        table += "<tr>" +
                                "<td>" + pago.identificador + "</td>" +
                                "<td>" + pago.clienteid + "</td>" +
                                "<td>" + pago.monto + "</td>" +
                                "<td>" + pago.fechapago + "</td>" +
                                "<td>" + pago.detalle + "</td>" +
                                "</tr>";
                    });

                    table += "</tbody></table>";

                    pagoContainer.append(table);

                    // Redireccionar a /ListarPagos después de 5 segundos
                    setTimeout(function() {
                        window.location.href = '/modulo6/ListarPagos';
                    }, 10000); // 10000 milisegundos (10 segundos)
                },
                error: function (xhr, status, error) {
                    // Manejar errores si los hubiera
                    console.error("Error al obtener los datos: " + error);
                }
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <h1>Pago agregado exitosamente. Redirigiendo...</h1>
        <div id="pagoContainer">
            <!-- Aquí se mostrarán los pago en formato JSON -->
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>