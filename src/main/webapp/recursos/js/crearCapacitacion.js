document.addEventListener('DOMContentLoaded', function() {

//Validar Campo nombre
var nombreInput = document.getElementById('nombre');
var nombreValidationMessage = document.getElementById('nombreValidationMessage');

nombreInput.addEventListener('input', function() {
  var nombreValue = nombreInput.value.trim();

  if (nombreValue === '') {
    nombreValidationMessage.textContent = 'Por favor, introduzca el Nombre de la Capacitación. Campo Obligatorio';
  } else {
    nombreValidationMessage.textContent = '';
  }
});

//Validar Campo Rut
var rutInput = document.getElementById('rut');
var rutValidationMessage = document.getElementById('rutValidationMessage');

rutInput.addEventListener('input', function() {
  var rutValue = rutInput.value.trim();
  
  if (rutValue === '') {
    rutValidationMessage.textContent = 'Por favor, introduzca el Rut. Campo Obligatorio';
  } else if (!/^[0-9]+$/.test(rutValue)) {
    rutValidationMessage.textContent = 'Por favor, introduzca un Rut válido. Solo se permiten dígitos numéricos.';
  } else if (parseInt(rutValue, 10) > 99999999) {
    rutValidationMessage.textContent = 'Por favor, introduzca un Rut válido. El número no puede ser mayor a 99.999.999.';
  } else {
    rutValidationMessage.textContent = '';
  }
});

// Validar Campo Día
var diaInput = document.getElementById('dia');
var diaValidationMessage = document.getElementById('diaValidationMessage');

diaInput.addEventListener('input', function() {
  if (diaInput.validity.patternMismatch) {
    diaValidationMessage.textContent = 'Por favor, introduzca un día válido (lunes, martes, miércoles, jueves, viernes, sábado o domingo).';
  } else {
    diaValidationMessage.textContent = '';
  }
});

//Validar Campo hora
var horaInput = document.getElementById('hora');
var horaValidationMessage = document.getElementById('horaValidationMessage');

horaInput.addEventListener('input', function() {
  var horaValue = horaInput.value.trim();
  var horaPattern = /^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/; // Expresión regular para validar el formato HH:MM
  
  if (horaValue === '') {
    horaValidationMessage.textContent = 'Por favor, introduzca la Hora de la Capacitación. Campo Obligatorio';
  } else if (!horaPattern.test(horaValue)) {
    horaValidationMessage.textContent = 'Por favor, introduzca la Hora en el formato correcto (HH:MM).';
  } else {
    horaValidationMessage.textContent = '';
  }
});

//Validar Campo lugar
var lugarInput = document.getElementById('lugar');
var lugarValidationMessage = document.getElementById('lugarValidationMessage');

lugarInput.addEventListener('input', function() {
  var lugarValue = lugarInput.value.trim();
  
  if (lugarValue === '') {
    lugarValidationMessage.textContent = 'Por favor, introduzca el Lugar de la Capacitación. Campo Obligatorio';
  } else if (lugarValue.length < 10 || lugarValue.length > 50) {
    lugarValidationMessage.textContent = 'Por favor, introduzca un Lugar con una longitud entre 10 y 50 caracteres.';
  } else {
    lugarValidationMessage.textContent = '';
  }
});

//Validar Campo duracion
var duracionInput = document.getElementById('duracion');
var duracionValidationMessage = document.getElementById('duracionValidationMessage');

duracionInput.addEventListener('input', function() {
  var duracionValue = duracionInput.value.trim();
  
  if (duracionValue === '') {
    duracionValidationMessage.textContent = 'Por favor, introduzca la Cantidad de minutos de la Capacitación. Campo Obligatorio';
  } else if (duracionValue.length > 70) {
    duracionValidationMessage.textContent = 'Por favor, introduzca una Duración con una longitud máxima de 70 caracteres.';
  } else {
    duracionValidationMessage.textContent = '';
  }
});

//Validar Campo cantidadAsistentes
var cantidadAsistentesInput = document.getElementById('cantidadAsistentes');
var cantidadAsistentesValidationMessage = document.getElementById('cantidadAsistentesValidationMessage');

cantidadAsistentesInput.addEventListener('input', function() {
  var cantidadAsistentesValue = cantidadAsistentesInput.value.trim();

  if (cantidadAsistentesValue === '') {
    cantidadAsistentesValidationMessage.textContent = 'Por favor, introduzca la Cantidad de Asistentes. Campo Obligatorio';
  } else if (!/^\d+$/.test(cantidadAsistentesValue)) {
    cantidadAsistentesValidationMessage.textContent = 'Por favor, introduzca solo valores numéricos para la Cantidad de Asistentes.';
  } else if (parseInt(cantidadAsistentesValue) > 999) {
    cantidadAsistentesValidationMessage.textContent = 'Por favor, introduzca un valor máximo de 999 para la Cantidad de Asistentes.';
  } else {
    cantidadAsistentesValidationMessage.textContent = '';
  }
});

});