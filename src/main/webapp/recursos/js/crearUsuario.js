    document.addEventListener('DOMContentLoaded', function() {
    
    var identificadorInput = document.getElementById('identificador');
    var identificadorValidationMessage = document.getElementById('idValidationMessage');

    identificadorInput.addEventListener('input', function() {
        var identificadorValue = identificadorInput.value.trim();

        if (identificadorValue === '') {
            identificadorValidationMessage.textContent = 'Por favor, introduzca el Identificador del Usuario. Campo Obligatorio';
        } else if (!/^\d+$/.test(identificadorValue)) {
            identificadorValidationMessage.textContent = 'Por favor, introduzca un Identificador válido. Solo se permiten números enteros.';
        } else {
            identificadorValidationMessage.textContent = '';
        }
    });

    var nombreInput = document.getElementById('nombre');
    var nombreValidationMessage = document.getElementById('nombreValidationMessage');

    nombreInput.addEventListener('input', function() {
        var nombreValue = nombreInput.value.trim();

        if (nombreValue === '') {
            nombreValidationMessage.textContent = 'Por favor, introduzca el Nombre del Usuario. Campo Obligatorio';
        } else {
            nombreValidationMessage.textContent = '';
        }
    });

    var fechaInput = document.getElementById('fechaNacimiento');
    var fechaValidationMessage = document.getElementById('fechaNacimientoValidationMessage');

    fechaInput.addEventListener('input', function() {
        var fechaValue = fechaInput.value.trim();
        var fechaPattern = /^\d{2}\/\d{2}\/\d{4}$/; // Expresión regular para validar el formato dd/MM/yyyy

        if (fechaValue === '') {
        	fechaValidationMessage.textContent = 'Por favor, introduzca la Fecha de Nacimiento. Campo Obligatorio';
        } else if (!fechaPattern.test(fechaValue)) {
        	fechaValidationMessage.textContent = 'Por favor, introduzca la Fecha de Nacimiento en el formato correcto (dd/MM/yyyy).';
        } else {
        	fechaValidationMessage.textContent = '';
        }
    });

    var runInput = document.getElementById('run');
    var runValidationMessage = document.getElementById('runValidationMessage');

    runInput.addEventListener('input', function() {
        var runValue = runInput.value.trim();

        if (runValue === '') {
            runValidationMessage.textContent = 'Por favor, introduzca el Run. Campo Obligatorio';
        } else if (!/^\d+$/.test(runValue)) {
            runValidationMessage.textContent = 'Por favor, introduzca un Run válido. Solo se permiten dígitos numéricos.';
        } else if (parseInt(runValue, 10) > 99999999) {
            runValidationMessage.textContent = 'Por favor, introduzca un Run válido. El número no puede ser mayor a 9.999.999.';
        } else {
            runValidationMessage.textContent = '';
        }
    });

    var tipoInput = document.getElementById('tipo');
    var tipoValidationMessage = document.getElementById('tipoValidationMessage');

    tipoInput.addEventListener('change', function() {
        var tipoValue = tipoInput.value;

        if (tipoValue === '') {
            tipoValidationMessage.textContent = 'Por favor, seleccione el Tipo de Usuario. Campo Obligatorio';
        } else {
            tipoValidationMessage.textContent = '';
  }
});

});
    
        function enviarFormulario(event) {
        // Mostrar el mensaje de éxito
        document.getElementById("mensaje-exito").style.display = "block";

        // Recargar la página después de 3 segundos
        setTimeout(function() {
            location.reload();
        }, 3000);

        return false;
    }