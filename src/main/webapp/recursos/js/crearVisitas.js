//Validar Campo fecha de visita
var fechaVisitaInput = document.getElementById('fechaVisita');
var fechaVisitaValidationMessage = document.getElementById('fechaVisitaValidationMessage');

fechaVisitaInput.addEventListener('input', function() {
  var fechaVisitaValue = fechaVisitaInput.value.trim();
  
  if (fechaVisitaValue === '') {
    fechaVisitaValidationMessage.textContent = 'Por favor, introduzca la fecha de visita. Campo Obligatorio';
  } else if (!isValidDateFormat(fechaVisitaValue)) {
    fechaVisitaValidationMessage.textContent = 'El formato de fecha debe ser dd/mm/aaaa';
  } else {
    fechaVisitaValidationMessage.textContent = '';
  }
});

function isValidDateFormat(dateString) {
  // Validar el formato de fecha dd/mm/aaaa usando una expresión regular
  var datePattern = /^\d{2}\/\d{2}\/\d{4}$/;
  return datePattern.test(dateString);
}

//Validar Campo detalles
  var detalleInput = document.getElementById('detalle');
  var detalleValidationMessage = document.getElementById('detalleValidationMessage');

  detalleInput.addEventListener('input', function() {
    var detalleValue = detalleInput.value.trim();

    if (detalleValue === '') {
      detalleValidationMessage.textContent = 'Por favor, introduzca detalles. Campo Obligatorio';
    } else {
      detalleValidationMessage.textContent = '';
    }
  });