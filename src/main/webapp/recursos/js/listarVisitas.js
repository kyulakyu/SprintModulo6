const checkboxes = document.querySelectorAll('.check-realizada');
const btnActualizarCheckboxes = document.getElementById('btnActualizarCheckboxes');

btnActualizarCheckboxes.addEventListener('click', function() {
    checkboxes.forEach(function(checkbox) {
        const visitaId = checkbox.getAttribute('data-visita-id');
        const realizada = checkbox.checked;

        try {
            fetch('actualizarEstadoVisita', {
                method: 'POST',  // Cambiar a 'PUT' si es más apropiado
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `visitaId=${visitaId}&realizada=${realizada}`,
            })
            .then(response => response.text())
            .then(() => {
                checkbox.checked = realizada;
                window.location.reload(); // Recargar la página
            })
            .catch(error => {
                console.error('Error al actualizar el estado de la visita', error);
            });
        } catch (error) {
            console.error('Error al actualizar el estado de la visita', error);
        }
    });
});

