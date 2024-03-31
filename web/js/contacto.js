document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById('contactForm');
    const formMessage = document.getElementById('formMessage');

    form.addEventListener('submit', function(e) {
        e.preventDefault();

        const formData = new FormData(form);
        fetch("../../backEnd/php/contacto.php", {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if(data.success) {
                // Ocultar el formulario
                form.style.display = 'none';
                // Mostrar mensaje de éxito
                formMessage.style.display = 'block';
                formMessage.textContent = 'Mensaje enviado con éxito. ¡Gracias!';
                formMessage.className = 'alert alert-success'; // Añadir clases de Bootstrap para el estilo
            } else {
                // Mostrar mensaje de error
                formMessage.style.display = 'block';
                formMessage.textContent = 'Error al enviar el mensaje. Por favor, inténtalo de nuevo.';
                formMessage.className = 'alert alert-danger';
            }
        })
        .catch(error => {
            console.error('Error:', error);
            // Mostrar mensaje de error
            formMessage.style.display = 'block';
            formMessage.textContent = 'Error al enviar el mensaje. Por favor, inténtalo de nuevo.';
            formMessage.className = 'alert alert-danger';
        });
    });
});
