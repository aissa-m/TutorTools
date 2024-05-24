const URL = "../../backEnd/php/";

function getPendientes() {
  fetch(URL + "getPagosPendientes.php", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
  })
    .then(response => response.json())
    .then(pendientes => {
      const contenedor = document.getElementById("contenedor-pendientes");
      contenedor.innerHTML = "";
      if (pendientes === "No hay datos") {
        document.getElementById("titulo").innerText = "No hay datos todavía!";
      } else {
        const pendientesPorAlumno = pendientes.reduce((acc, pendiente) => {
          if (!acc[pendiente.nombre]) {
            acc[pendiente.nombre] = {
              nombre: pendiente.nombre,
              pagos: [],
              total: 0,
            };
          }
          acc[pendiente.nombre].pagos.push({
            monto: pendiente.monto,
            fecha: pendiente.fecha,
            horas: pendiente.horas,
            id: pendiente.id,
          });
          acc[pendiente.nombre].total += parseFloat(pendiente.monto);
          return acc;
        }, {});

        // Crear una tarjeta por alumno
        Object.values(pendientesPorAlumno).forEach(alumno => {
          const tarjeta = `
            <div class="col-md-4 mb-4">
              <div class="card h-100" style="background-color: rgba(0, 0, 0, 0.2);">
                <div class="card-body d-flex flex-column">
                  <h5 class="card-title">${alumno.nombre}</h5>
                  ${alumno.pagos
                    .map(
                      pago => `
                    <div class="form-check">
                      <input class="form-check-input pagoCheckbox" type="checkbox" value="${pago.id}" id="pago-${pago.id}">
                      <label class="form-check-label" for="pago-${pago.id}">
                        ${pago.monto}€ - ${pago.fecha}
                      </label>
                    </div>
                  `
                    )
                    .join("")}
                  <p class="card-text mt-auto"><strong>Total pendiente: ${alumno.total.toFixed(
                    2
                  )}€</strong></p>
                  <div class="mt-2">
                    <button class='btn btn-success pagarSeleccionados' data-alumno='${alumno.nombre}'>Registrar</button>
                    <button class='btn btn-danger eliminarSeleccionados' data-alumno='${alumno.nombre}'>Eliminar</button>
                  </div>
                </div>
              </div>
            </div>
          `;
          contenedor.insertAdjacentHTML("beforeend", tarjeta);
        });

        // Añadir escuchadores de eventos a los botones
        addEventListenersToButtons();
      }
    })
    .catch(error => {
      console.error("Error:", error);
    });
}

function addEventListenersToButtons() {
  document.querySelectorAll(".pagarSeleccionados").forEach(button => {
    button.addEventListener("click", function () {
      const alumno = this.getAttribute("data-alumno");
      const seleccionados = Array.from(document.querySelectorAll(`.pagoCheckbox:checked`))
        .filter(checkbox => checkbox.closest('.card').querySelector('.card-title').innerText === alumno)
        .map(checkbox => checkbox.value);
      if (seleccionados.length > 0) {
        pagarSeleccionados(seleccionados);
      } else {
        alert("Selecciona al menos un pago para registrar.");
      }
    });
  });

  document.querySelectorAll(".eliminarSeleccionados").forEach(button => {
    button.addEventListener("click", function () {
      const alumno = this.getAttribute("data-alumno");
      const seleccionados = Array.from(document.querySelectorAll(`.pagoCheckbox:checked`))
        .filter(checkbox => checkbox.closest('.card').querySelector('.card-title').innerText === alumno)
        .map(checkbox => checkbox.value);
      if (seleccionados.length > 0) {
        eliminarSeleccionados(seleccionados);
      } else {
        alert("Selecciona al menos un pago para eliminar.");
      }
    });
  });
}

function pagarSeleccionados(idsPagosPendientes) {
  fetch(URL + "pagarSeleccionados.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ ids: idsPagosPendientes }),
  })
    .then(response => response.json())
    .then(res => {
      if (res === "Exito") {
        // alert("Pagos registrados!");
        location.reload(); // Recargar la página o actualizar la tabla de pendientes
      } else {
        alert("Error al registrar los pagos!" + res);
      }
    })
    .catch(error => {
      console.error("Error del servidor:", error);
    });
}

function eliminarSeleccionados(idsPagosPendientes) {
  fetch(URL + "eliminarSeleccionados.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ ids: idsPagosPendientes }),
  })
    .then(response => response.json())
    .then(res => {
      if (res === "Exito") {
        // alert("Pagos eliminados!");
        location.reload(); // Recargar la página o actualizar la tabla de pendientes
      } else {
        alert("Error al eliminar los pagos!" + res);
      }
    })
    .catch(error => {
      console.error("Error del servidor:", error);
    });
}

function cargarAlumnos() {
  fetch(URL + "getStudents_back.php")
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        const select = document.getElementById("alumnoSelect");
        data.alumnos.forEach(alumno => {
          const option = document.createElement("option");
          option.value = alumno.id;
          option.textContent = alumno.nombre;
          select.appendChild(option);
        });
      }
    })
    .catch(error => console.error("Error:", error));
}

function guardarPendiente() {
  document
    .getElementById("formAgregarPendiente")
    .addEventListener("submit", function (e) {
      e.preventDefault();
      var formData = new FormData(this);
      fetch(URL + "setPagoP.php", {
        method: "POST",
        body: formData,
      })
        .then(response => response.json())
        .then(data => {
          if (data === "Exito") {
            location.href = "ingresos_pendientes.html";
          } else {
            console.error("Error al añadir alumno");
          }
        })
        .catch(error => {
          console.error("Ha habido un error: " + error);
        });
    });
}

function pagar(idPagoPendiente) {
  fetch(URL + "pagar.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ id: idPagoPendiente }),
  })
    .then(response => response.json())
    .then(res => {
      if (res === "Exito") {
        alert("Pago registrado!");
        location.reload(); // Recargar la página o actualizar la tabla de pendientes
      } else {
        alert("Error al registrar el pago!" + res);
      }
    })
    .catch(error => {
      console.error("Error del servidor:", error);
    });
}

function eliminar(idPagoPendiente) {
  fetch(URL + "eliminar.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ id: idPagoPendiente }),
  })
    .then(response => response.json())
    .then(res => {
      if (res === "Exito") {
        alert("Pago eliminado!");
        location.reload(); // Recargar la página o actualizar la tabla de pendientes
      } else {
        alert("Error al eliminar el pago!" + res);
      }
    })
    .catch(error => {
      console.error("Error del servidor:", error);
    });
}

function getTotalPendiente() {
  fetch(URL + "getTotalP.php", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
  })
    .then(response => response.json())
    .then(total => {
      const card = document.getElementById("totalP");
      const cardBody = `
      <div class="card-body"> 
        <h5 class="">Total Pendiente: ${total}€</h5>
      </div>
    `;
      card.insertAdjacentHTML("beforeend", cardBody);
    });
}

document.addEventListener("DOMContentLoaded", function () {
  getPendientes();
  cargarAlumnos();
  guardarPendiente();
  getTotalPendiente();
});
