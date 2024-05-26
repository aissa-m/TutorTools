const URL = "../../backEnd/php/";

function getAlumnos() {
    fetch(URL + "getStudents_back.php")
        .then((response) => response.json()) // Convierte la respuesta a JSON
        .then((data) => {
            if (data.success) {
                renderAlumnos(data.alumnos);
            } else {
                const h2 = document.getElementById("titulo");
                h2.innerText = "No hay datos todavía!";
            }
        })
        .catch((error) => {
            console.error("Error:", error);
        });
}

function renderAlumnos(alumnos) {
    const contenedor = document.getElementById("contenedor-alumnos");
    contenedor.innerHTML = ""; // Limpia el contenido actual del contenedor
    alumnos.forEach((alumno) => {
        const card = `
            <div class="col-md-4 mb-4 tarjeta-alumno">
                <div class="card" style="background-color: rgba(0, 0, 0, 0.2);" onclick="verDetallesAlumno(${alumno.id})">
                    <div class="card-body">
                        <h5 class="card-title">${alumno.nombre}</h5>
                    </div>
                </div>
            </div>
        `;
        contenedor.insertAdjacentHTML("beforeend", card);
    });
}

function aplicarFiltros() {
    const nombreFiltro = document.getElementById("input").value.toLowerCase();
    fetch(URL + "getStudents_back.php")
        .then((response) => response.json())
        .then((data) => {
            if (data.success) {
                let alumnosFiltrados = data.alumnos;
                if (nombreFiltro) {
                    alumnosFiltrados = alumnosFiltrados.filter(alumno => alumno.nombre.toLowerCase().includes(nombreFiltro));
                }
                renderAlumnos(alumnosFiltrados);
            }
        })
        .catch((error) => {
            console.error("Error:", error);
        });
}

document.addEventListener("DOMContentLoaded", function () {
    getAlumnos();
    document.getElementById("input").addEventListener("input", aplicarFiltros);
});


function verDetallesAlumno(id) {
  localStorage.setItem("alumnoId", id);
  window.location.href = "detallesAlumno.html";
}

document.addEventListener("DOMContentLoaded", function () {
  // Obtén una instancia del modal usando su ID
  var myModal = new bootstrap.Modal(
    document.getElementById("modalAgregarAlumno"),
    {
      keyboard: false,
    }
  );

  // Para abrir el modal
  document
    .getElementById("btnAbrirModal")
    .addEventListener("click", function () {
      myModal.show();
    });

  // Suponiendo que tienes un botón con id="btnAbrirModal" para abrir el modal

  // Para cerrar el modal después de agregar un alumno exitosamente
  function cerrarModal() {
    myModal.hide();
    document.querySelector("#modalAgregarAlumno").remove();
  }

  // Sustituye el manejo de tu formulario aquí con Fetch API
  const form = document.getElementById("formAgregarAlumno");
  form.addEventListener("submit", function (e) {
    e.preventDefault();
    var formData = new FormData(form);
    fetch(URL + "nuevoAlumno.php", {
      method: "POST",
      body: formData,
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.success) {
          // alert('Alumno añadido correctamente');
          cerrarModal();
          location.href = "alumnos.html";
          form.reset();
          // Actualiza la lista de alumnos aquí si es necesario
        } else {
          alert("Error al añadir alumno");
        }
      })
      .catch((error) => {
        console.error("Error:", error);
        alert("Error al enviar los datos");
      });
  });

  const inputTelefono = document.getElementById("telefonoAlumno");
  const btnGuardarAlumno = document.getElementById("btnGuardarAlumno");
  const inputNombre = document.getElementById("nombreAlumno");
  const inputEmail = document.getElementById("emailAlumno");
  const inputDescripcion = document.getElementById("descripcionAlumno");

  inputTelefono.addEventListener("input", function () {
    var telefono = this.value;

    // Solo permite números y un signo + al inicio
    if (!/^\+?[0-9]*$/.test(telefono)) {
      this.value = telefono.substring(0, telefono.length - 1);
      return; // Detiene la ejecución si se ingresa un carácter no válido
    }

    var telefonoLimpio = telefono.replace(/\D/g, ""); // Elimina todo lo que no sea dígitos

    if (telefono.startsWith("+")) {
      telefonoLimpio = telefonoLimpio;
    }

    var esValido = telefonoLimpio.length >= 7 && telefonoLimpio.length <= 15;

    if (esValido || telefono.length === 0) {
      // Considera válido si está en proceso de escritura pero no vacío
      this.classList.remove("is-invalid");
      this.classList.add("is-valid");
      btnGuardarAlumno.disabled = false; // Habilita el botón de guardar
    } else {
      this.classList.remove("is-valid");
      this.classList.add("is-invalid");
      btnGuardarAlumno.disabled = true; // Deshabilita el botón de guardar
    }
  });

  // Validación de nombre
  inputNombre.addEventListener("input", function () {
    const nombre = this.value;
    // Solo permite texto y espacios, longitud mínima de 5 letras
    if (!/^[A-Za-z\s]{5,}$/.test(nombre)) {
      this.classList.add("is-invalid");
      btnGuardarAlumno.disabled = true;
    } else {
      this.classList.remove("is-invalid");
      this.classList.add("is-valid");
      btnGuardarAlumno.disabled = false;
    }
  });

  // Validación de email
  inputEmail.addEventListener("input", function () {
    const email = this.value;
    // Formato básico de email y comienza por letras con al menos 5 caracteres antes del @
    if (!/^[A-Za-z]{5,}.*@.*\..*$/.test(email)) {
      this.classList.add("is-invalid");
      btnGuardarAlumno.disabled = true;
    } else {
      this.classList.remove("is-invalid");
      this.classList.add("is-valid");
      btnGuardarAlumno.disabled = false;
    }

    // Aquí podrías agregar una llamada a la API para verificar si el email ya existe
  });

  // Validación de descripción
  inputDescripcion.addEventListener("input", function () {
    const descripcion = this.value;

    // Permite texto, espacios y ciertos caracteres especiales
    if (!/^[A-Za-z\s\(\)\.,;]+$/.test(descripcion)) {
      this.classList.add("is-invalid");
      btnGuardarAlumno.disabled = true;
    } else {
      this.classList.remove("is-invalid");
      this.classList.add("is-valid");
      btnGuardarAlumno.disabled = false;
    }
  });

  // Función para verificar si el email ya existe (ejemplo hipotético)
    /*async function verificarEmail(email) {
      try {
          const response = await fetch('API_ENDPOINT', {
              method: 'POST', // o GET, dependiendo de la API
              body: JSON.stringify({ email: email }),
              headers: {
                  'Content-Type': 'application/json'
              }
          });
          const data = await response.json();

          if(data.existe) {
              inputEmail.classList.add("is-invalid");
              btnGuardarAlumno.disabled = true;
          }
      } catch (error) {
          console.error('Error al verificar el email', error);
      }
  }*/
});
