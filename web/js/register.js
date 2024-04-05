const URL = '../../backEnd/php/';
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById("register");
    form.addEventListener('submit', function(e) {
        e.preventDefault(); // Previene el comportamiento por defecto del formulario
        function validarEmail(email) {
            const re = /^[a-zA-Z].{4,}@/;
            return re.test(String(email).toLowerCase());
        }
    
        // Función para validar el nombre (solo texto)
        function validarNombre(nombre) {
            const re = /^[a-zA-Z\s]+$/;
            return re.test(String(nombre).trim());
        }
    
        // Función para validar la contraseña (longitud mínima de 8)
        function validarPassword(password) {
            return password.length >= 8;
        }

        const email = document.getElementById('email').value;
        const nombre = document.getElementById('nombre').value;
        const password = document.getElementById('password').value;

        // Validar el correo electrónico
        if (!validarEmail(email)) {
            alert("Por favor, ingresa un correo válido que comience con texto y tenga al menos 5 letras.");
            e.preventDefault();
            return false;
        }

        // Validar el nombre
        if (!validarNombre(nombre)) {
            alert("El nombre debe contener solo texto.");
            e.preventDefault();
            return false;
        }

        // Validar la contraseña
        if (!validarPassword(password)) {
            alert("La contraseña debe tener una longitud mínima de 8 caracteres.");
            e.preventDefault();
            return false;
        }

  
        const formData = new FormData(this); // Crea un objeto FormData basado en el formulario actual

        fetch(URL + 'register.php', {
            method: 'POST',
            body: formData
        })
        .then(res => res.json())
        .then(data => {

            if (data.success) {
                const divMensaje = document.getElementById('mensaje');
                divMensaje.innerHTML = '';
            
                let p = document.createElement('p');
                p.innerText = 'Registro exitoso!';
                divMensaje.append(p);
                form.reset();

                // setTimeout(function() {
                //     // cometario
                //     window.location.href = '../web/login.html'; 
                // }, 2000); 
            }
            
            else{
                const divMensaje = document.getElementById('mensaje');
                divMensaje.classList.remove("text-success");
                divMensaje.classList.add("text-danger");
                divMensaje.innerHTML = '';
                
                let p = document.createElement('p');
                p.innerText = 'Email existente!';
                divMensaje.append(p);
            }
            
        })
        .catch(error => {
            console.error('Error del servidor' + error);
        });
    });
});
