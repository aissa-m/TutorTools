const URL = '../../backEnd/php/';
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById("register"); // Obtenemos el elemento del formulario por su ID

    form.addEventListener('submit', function(e) {
        e.preventDefault(); // Previene el comportamiento por defecto del formulario
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

                setTimeout(function() {
                    // cometario
                    window.location.href = '../login.html'; 
                }, 2000); 
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
