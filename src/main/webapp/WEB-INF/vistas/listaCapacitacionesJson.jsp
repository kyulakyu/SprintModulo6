<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Capacitaciones en JSON</title>
    <link rel="stylesheet" type="text/css" href="/modulo6/res/css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                url: "http:/modulo6/api/capacitaciones",
                type: "GET",
                dataType: "json",
                success: function (data) {
                    // Manipular los datos recibidos y mostrarlos en la página
                    var capacitaciones = data;
                    var capacitacionesContainer = $("#capacitacionesContainer");

                    var table = "<table class='table table-striped'>" +
                                "<thead>" +
                                "<tr>" +
                                "<th>ID</th>" +
                                "<th>Nombre</th>" +
                                "<th>Detalle</th>" +
                                "<th>RUT</th>" +
                                "<th>Día</th>" +
                                "<th>Hora</th>" +
                                "<th>Lugar</th>" +
                                "<th>Duración</th>" +
                                "<th>Cantidad</th>" +
                                "</tr>" +
                                "</thead>" +
                                "<tbody>";
                    
                    $.each(capacitaciones, function(index, capacitacion) {
                        table += "<tr>" +
                                "<td>" + capacitacion.identificador + "</td>" +
                                "<td>" + capacitacion.nombre + "</td>" +
                                "<td>" + capacitacion.detalle + "</td>" +
                                "<td>" + capacitacion.rut + "</td>" +
                                "<td>" + capacitacion.dia + "</td>" +
                                "<td>" + capacitacion.hora + "</td>" +
                                "<td>" + capacitacion.lugar + "</td>" +
                                "<td>" + capacitacion.duracion + "</td>" +
                                "<td>" + capacitacion.cantidad + "</td>" +
                                "</tr>";
                    });

                    table += "</tbody></table>";

                    capacitacionesContainer.append(table);

                    // Redireccionar a /ListarCapacitaciones después de 5 segundos
                    setTimeout(function() {
                        window.location.href = '/modulo6/ListarCapacitaciones';
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
        <h1>Capacitación agregada exitosamente. Redirigiendo...</h1>
        <div id="capacitacionesContainer">
            <!-- Aquí se mostrarán las capacitaciones en formato JSON -->
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>




