
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

    //Validar Campo email
    var emailInput = document.getElementById('email');
    var emailValidationMessage = document.getElementById('emailValidationMessage');

    emailInput.addEventListener('input', function() {
      var emailValue = emailInput.value.trim();

      if (emailValue === '') {
        emailValidationMessage.textContent = 'Por favor, introduzca email. Campo Obligatorio';
      } else if (!isValidEmailFormat(emailValue)) {
        emailValidationMessage.textContent = 'Por favor, introduzca un email válido';
      } else {
        emailValidationMessage.textContent = '';
      }
    });

    function isValidEmailFormat(email) {
      var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return emailPattern.test(email);
    }

    //Validar Campo comentario
    var comentarioInput = document.getElementById('comentario');
    var comentarioValidationMessage = document.getElementById('comentarioValidationMessage');

    comentarioInput.addEventListener('input', function() {
      var comentarioValue = comentarioInput.value.trim();

      if (comentarioValue === '') {
        comentarioValidationMessage.textContent = 'Por favor, introduzca comentario. Campo Obligatorio';
      } else {
        comentarioValidationMessage.textContent = '';
      }
    });



