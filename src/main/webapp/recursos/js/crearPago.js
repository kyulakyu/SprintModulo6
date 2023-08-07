document.addEventListener('DOMContentLoaded', function() {

//Validar Campo clienteid
var clienteidInput = document.getElementById('clienteid');
var clienteidValidationMessage = document.getElementById('clienteidValidationMessage');

clienteidInput.addEventListener('input', function() {
  var clienteidValue = clienteidInput.value.trim();
  
  if (clienteidValue === '') {
    clienteidValidationMessage.textContent = 'Por favor, introduzca el id del cliente. Campo Obligatorio';
  } else if (!/^[0-9]+$/.test(clienteidValue)) {
    clienteidValidationMessage.textContent = 'Por favor, introduzca un id válido. Solo se permiten dígitos numéricos.';
  } else if (parseInt(clienteidValue, 10) > 99999999) {
    clienteidValidationMessage.textContent = 'Por favor, introduzca un id  válido. El número no puede ser mayor a 99.999.999.';
  } else {
    clienteidValidationMessage.textContent = '';
  }
});


//Validar Campo monto
var montoInput = document.getElementById('monto');
var montoValidationMessage = document.getElementById('montoValidationMessage');

montoInput.addEventListener('input', function() {
  var montoValue = montoInput.value.trim();

  if (montoValue === '') {
    montoValidationMessage.textContent = 'Por favor, introduzca el monto. Campo Obligatorio';
  } else if (!/^\d+$/.test(montoValue)) {
    montoValidationMessage.textContent = 'Por favor, introduzca solo valores numéricos para el monto.';
  } else if (parseInt(montoValue) > 999999999) {
    montoValidationMessage.textContent = 'Por favor, introduzca un valor máximo de 999999999 para el monto.';
  } else {
    montoValidationMessage.textContent = '';
  }
});

/*//Validar Campo fechapago
var fechapagoInput = document.getElementById('fechapago');
var fechapagoValidationMessage = document.getElementById('fechapagoValidationMessage');

fechapagoInput.addEventListener('input', function() {
  var fechapagoValue = fechapagoInput.value.trim();
  var fechapagoPattern = /^(0[1-9]|[1-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/\d{4}$/; // Expresión regular para validar el formato DD/MM/AAAA
  
  if (fechapagoValue === '') {
    fechapagoValidationMessage.textContent = 'Por favor, introduzca la Fecha de Pago. Campo Obligatorio';
  } else if (!fechapagoPattern.test(fechapagoValue)) {
    fechapagoValidationMessage.textContent = 'Por favor, introduzca la Fecha en el formato correcto (DD/MM/AAAA).';
  } else {
    fechapagoValidationMessage.textContent = '';
  }
});
*/

//Validar Campo fechapago
var fechapagoInput = document.getElementById('fechapago');
var fechapagoValidationMessage = document.getElementById('fechapagoValidationMessage');

fechapagoInput.addEventListener('input', function() {
  var fechapagoValue = fechapagoInput.value.trim();
  var fechapagoPattern = /^(0[1-9]|[1-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/\d{4}$/; // Expresión regular para validar el formato DD/MM/AAAA

  if (fechapagoValue === '') {
    fechapagoValidationMessage.textContent = 'Por favor, introduzca la Fecha de Pago. Campo Obligatorio';
  } else if (!fechapagoPattern.test(fechapagoValue)) {
    fechapagoValidationMessage.textContent = 'Por favor, introduzca la Fecha en el formato correcto (DD/MM/AAAA).';
  } else {
    // Validar si la fecha es válida mediante AJAX o usando JavaScript
    // Puedes utilizar la función setfechapago en tu formulario antes de enviar los datos.
    var fechaParts = fechapagoValue.split('/');
    var day = parseInt(fechaParts[0]);
    var month = parseInt(fechaParts[1]);
    var year = parseInt(fechaParts[2]);

    if (isValidDate(day, month, year)) {
      fechapagoValidationMessage.textContent = '';
      // Si la fecha es válida, puedes setear el valor en el campo hidden
      // para enviarlo al servidor en el formato correcto (YYYY-MM-DD).
      var fechaFormateada = year + '-' + padNumber(month) + '-' + padNumber(day);
      document.getElementById('fechapagoHidden').value = fechaFormateada;
    } else {
      fechapagoValidationMessage.textContent = 'La fecha ingresada no es válida.';
    }
  }
});

// Función para validar si la fecha es válida
function isValidDate(day, month, year) {
  var date = new Date(year, month - 1, day);
  return (
    date.getDate() === day &&
    date.getMonth() === month - 1 &&
    date.getFullYear() === year
  );
}

// Función para agregar un cero delante de un número si es menor a 10
function padNumber(number) {
  return number < 10 ? '0' + number : number;
}


//Validar Campo detalle
var detalleInput = document.getElementById('detalle');
var detalleValidationMessage = document.getElementById('detalleValidationMessage');

detalleInput.addEventListener('input', function() {
  var detalleValue = detalleInput.value.trim();
  
  if (detalleValue === '') {
    detalleValidationMessage.textContent = 'Por favor, introduzca el detalle del pago. Campo Obligatorio';
  } else if (detalleValue.length < 10 || detalleValue.length > 50) {
    detalleValidationMessage.textContent = 'Por favor, introduzca un detalle con una longitud entre 10 y 50 caracteres.';
  } else {
    detalleValidationMessage.textContent = '';
  }
});
///---------------------
   // Agregar el evento submit al formulario
   var formularioPago = document.getElementById('formularioPago');
   formularioPago.addEventListener('submit', function(event) {
      event.preventDefault(); // Evitar el comportamiento de envío normal del formulario

      // Realizar la solicitud AJAX para enviar los datos del formulario al servidor
      var formData = new FormData(formularioPago);
      var xhr = new XMLHttpRequest();
      xhr.open('POST', formularioPago.action, true);
      xhr.onload = function() {
         if (xhr.status === 200) {
            // Procesar la respuesta del servidor si es necesario
            // Por ejemplo, mostrar un mensaje de éxito o redirigir a otra página
         } else {
            // Manejar el error en caso de que la solicitud no sea exitosa
         }
      };
      xhr.send(formData);
   });
///--------------------
});