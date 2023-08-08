    //Validaciones
    //Validar Campo nombre
var nombreInput = document.getElementById('nombre');
var nombreValidationMessage = document.getElementById('nombreValidationMessage');

nombreInput.addEventListener('input', function() {
  var nombreValue = nombreInput.value.trim();
  
  if (nombreValue === '') {
    nombreValidationMessage.textContent = 'Por favor, introduzca nombre. Campo Obligatorio';
  } else {
    nombreValidationMessage.textContent = '';
  }
});
//Validar Campo fecha de nacimiento
var fechaNacimientoInput = document.getElementById('fechaNacimiento');
var fechaNacimientoValidationMessage = document.getElementById('fechaNacimientoValidationMessage');

fechaNacimientoInput.addEventListener('input', function() {
  var fechaNacimientoValue = fechaNacimientoInput.value.trim();
  
  if (fechaNacimientoValue === '') {
    fechaNacimientoValidationMessage.textContent = 'Por favor, introduzca la fecha de nacimiento. Campo Obligatorio';
  } else if (!isValidDateFormat(fechaNacimientoValue)) {
    fechaNacimientoValidationMessage.textContent = 'El formato de fecha debe ser dd/mm/aaaa';
  } else {
    fechaNacimientoValidationMessage.textContent = '';
  }
});

function isValidDateFormat(dateString) {
  // Validar el formato de fecha dd/mm/aaaa usando una expresión regular
  var datePattern = /^\d{2}\/\d{2}\/\d{4}$/;
  return datePattern.test(dateString);
}
//Validar Campo Run
var runInput = document.getElementById('run');
var runValidationMessage = document.getElementById('runValidationMessage');

runInput.addEventListener('input', function() {
  var runValue = runInput.value.trim();
  
  if (runValue === '') {
    runValidationMessage.textContent = 'Por favor, introduzca el Rut sin puntos ni guion';
  } else if (!/^[0-9]+$/.test(runValue)) {
    runValidationMessage.textContent = 'Por favor, introduzca un Rut válido. Solo se permiten dígitos numéricos.';
  } else if (parseInt(runValue, 10) > 99999999) {
    runValidationMessage.textContent = 'Por favor, introduzca un Rut válido. El número no puede ser mayor a 99.999.999.';
  } else {
    runValidationMessage.textContent = '';
  }
});


//Validar datos del usurio tipo cliente
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

  
//Validar Campo nombres
  var nombresInput = document.getElementById('nombres');
  var nombresValidationMessage = document.getElementById('nombresValidationMessage');

  nombresInput.addEventListener('input', function() {
    var nombresValue = nombresInput.value.trim();

    if (nombresValue === '') {
      nombresValidationMessage.textContent = 'Por favor, introduzca nombre. Campo Obligatorio';
    } else {
      nombresValidationMessage.textContent = '';
    }
  });

  // Validar Campo apellidos
  var apellidosInput = document.getElementById('apellidos');
  var apellidosValidationMessage = document.getElementById('apellidosValidationMessage');

  apellidosInput.addEventListener('input', function() {
    var apellidosValue = apellidosInput.value.trim();

    if (apellidosValue === '') {
      apellidosValidationMessage.textContent = 'Por favor, introduzca apellidos. Campo Obligatorio';
    } else {
      apellidosValidationMessage.textContent = '';
    }
  });

//Validar Campo telefono
  var telefonoInput = document.getElementById('telefono');
  var telefonoValidationMessage = document.getElementById('telefonoValidationMessage');

  telefonoInput.addEventListener('input', function() {
    var telefonoValue = telefonoInput.value.trim();
    
    if (telefonoValue === '') {
      telefonoValidationMessage.textContent = 'Por favor, introduzca un número de teléfono. Campo Obligatorio';
    } else if (!isValidPhoneNumber(telefonoValue)) {
      telefonoValidationMessage.textContent = 'Por favor, introduzca un número de teléfono válido';
    } else {
      telefonoValidationMessage.textContent = '';
    }
  });
  

  function isValidPhoneNumber(phoneNumber) {
    // Validar que el número de teléfono contenga solo dígitos numéricos
    var numberPattern = /^\d+$/;
    return numberPattern.test(phoneNumber);
  }

  //Validar Campo afp
  var afpInput = document.getElementById('afp');
  var afpValidationMessage = document.getElementById('afpValidationMessage');

  afpInput.addEventListener('input', function() {
    var afpValue = afpInput.value.trim();
    
    if (afpValue === '') {
      afpValidationMessage.textContent = 'Por favor, introduzca nombre. Campo Obligatorio';
    } else {
      afpValidationMessage.textContent = '';
    }
  });
  //Validar Campo direccion
  var direccionInput = document.getElementById('direccion');
  var direccionValidationMessage = document.getElementById('direccionValidationMessage');

  direccionInput.addEventListener('input', function() {
    var direccionValue = direccionInput.value.trim();
    
    if (direccionValue === '') {
      direccionValidationMessage.textContent = 'Por favor, introduzca nombre. Campo Obligatorio';
    } else {
      direccionValidationMessage.textContent = '';
    }
  });
  
//Validar Campo comuna
  var comunaInput = document.getElementById('comuna');
  var comunaValidationMessage = document.getElementById('comunaValidationMessage');

  comunaInput.addEventListener('input', function() {
    var comunaValue = comunaInput.value.trim();
    
    if (comunaValue === '') {
      comunaValidationMessage.textContent = 'Por favor, introduzca la comuna. Campo Obligatorio';
    } else {
      comunaValidationMessage.textContent = '';
    }
  });

  
  var edadInput = document.getElementById('edad');
  var edadValidationMessage = document.getElementById('edadValidationMessage');

  edadInput.addEventListener('input', function() {
    var edadValue = edadInput.value.trim();
    
    if (edadValue === '') {
      edadValidationMessage.textContent = 'Por favor, introduzca una edad. Campo Obligatorio';
    } else if (!isValidAge(edadValue)) {
      edadValidationMessage.textContent = 'Por favor, introduzca una edad válida';
    } else {
      edadValidationMessage.textContent = '';
    }
  });

  function isValidAge(age) {
    // Validar que la edad contenga solo dígitos numéricos
    var numberPattern = /^\d+$/;
    return numberPattern.test(age);
  }

//Validar datos del usurio tipo profesional

  //Validar Campo titulo
var tituloInput = document.getElementById('titulo');
var tituloValidationMessage = document.getElementById('tituloValidationMessage');

tituloInput.addEventListener('input', function() {
  var tituloValue = tituloInput.value.trim();
  
  if (tituloValue === '') {
    tituloValidationMessage.textContent = 'Por favor, introduzca nombre. Campo Obligatorio';
  } else {
    tituloValidationMessage.textContent = '';
  }
});
var fechaDeIngresoInput = document.getElementById('fechaIngreso');
var fechaDeIngresoValidationMessage = document.getElementById('fechaIngresoValidationMessage');

fechaDeIngresoInput.addEventListener('input', function() {
  var fechaDeIngresoValue = fechaDeIngresoInput.value.trim();
  
  if (fechaDeIngresoValue === '') {
    fechaDeIngresoValidationMessage.textContent = 'Por favor, introduzca una fecha de ingreso. Campo Obligatorio';
  } else if (!isValidDateFormat(fechaDeIngresoValue)) {
    fechaDeIngresoValidationMessage.textContent = 'El formato de fecha debe ser DD/MM/AAAA';
  } else if (!isValidNumericFormat(fechaDeIngresoValue)) {
    fechaDeIngresoValidationMessage.textContent = 'La fecha de ingreso debe contener solo valores numéricos';
  } else {
    fechaDeIngresoValidationMessage.textContent = '';
  }
});

function isValidDateFormat(dateString) {
  // Validar el formato de fecha DD/MM/AAAA usando una expresión regular
  var datePattern = /^\d{2}\/\d{2}\/\d{4}$/;
  return datePattern.test(dateString);
}

function isValidNumericFormat(dateString) {
  // Validar que la fecha de ingreso contenga solo dígitos numéricos
  var numberPattern = /^\d+$/;
  return numberPattern.test(dateString.replace(/\//g, ''));
}

//Validar datos del usuario de tipo administrativo
  var areaInput = document.getElementById('area');
var areaValidationMessage = document.getElementById('areaValidationMessage');

areaInput.addEventListener('input', function() {
  var areaValue = areaInput.value.trim();
  
  if (areaValue === '') {
    areaValidationMessage.textContent = 'Por favor, introduzca el área. Campo Obligatorio';
  } else {
    areaValidationMessage.textContent = '';
  }
});

var experienciaPreviaInput = document.getElementById('experiencia');
var experienciaPreviaValidationMessage = document.getElementById('experienciaValidationMessage');

experienciaPreviaInput.addEventListener('input', function() {
  var experienciaPreviaValue = experienciaInput.value.trim();
  
  if (experienciaPreviaValue === '') {
    experienciaPreviaValidationMessage.textContent = 'Por favor, introduzca la experiencia. Campo Obligatorio';
  } else {
    experienciaPreviaValidationMessage.textContent = '';
  }
});
        
        function mostrarCamposAdicionales() {
            var tipoSeleccionado = document.getElementById("tipo").value;
            var camposCliente = document.getElementById("camposCliente");
            var camposProfesional = document.getElementById("camposProfesional");
            var camposAdministrativo = document.getElementById("camposAdministrativo");

            camposCliente.style.display = "none";
            camposProfesional.style.display = "none";
            camposAdministrativo.style.display = "none";

            if (tipoSeleccionado === "Cliente") {
                camposCliente.style.display = "block";
            } else if (tipoSeleccionado === "Profesional") {
                camposProfesional.style.display = "block";
            } else if (tipoSeleccionado === "Administrativo") {
                camposAdministrativo.style.display = "block";
            }
        }