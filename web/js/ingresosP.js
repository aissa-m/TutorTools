const URL = "../../backEnd/php/";
function getPendientes() {
  fetch(URL + "getPagosPendientes.php", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
  })
    .then((response) => response.json())
    .then((pendientes) => {
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
        Object.values(pendientesPorAlumno).forEach((alumno) => {
          const tarjeta = `
            <div class="col-md-4 mb-4">
              <div class="card h-100" style="background-color: rgba(0, 0, 0, 0.2);">
                <div class="card-body d-flex flex-column">
                  <h5 class="card-title">${alumno.nombre}</h5>
                  ${alumno.pagos
                    .map(
                      (pago) => `
                    <p class="card-text">${pago.monto}€ - ${pago.fecha}</p>
                  `
                    )
                    .join("")}
                  <p class="card-text mt-auto"><strong>Total pendiente: ${alumno.total.toFixed(
                    2
                  )}€</strong></p>
                  <div class="mt-2">
                    <button class='btn btn-success pagarBtn' data-id='${
                      alumno.pagos[0].id
                    }'>Pagar Último</button>
                    <button class="btn btn-danger eliminar" data-id="${
                      alumno.pagos[0].id
                    }" data-tipo="pendiente">Eliminar</button>
                  </div>
                </div>
              </div>
            </div>
          `;
          contenedor.insertAdjacentHTML("beforeend", tarjeta);
        });

        // Reiniciar y añadir escuchadores de eventos a los botones
        addEventListenersToButtons();
      }
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}

function addEventListenersToButtons() {
  document.querySelectorAll(".pagarBtn").forEach((button) => {
    button.addEventListener("click", function () {
      pagar(this.getAttribute("data-id"));
    });
  });
}

function cargarAlumnos() {
  fetch(URL + "getStudents_back.php")
    .then((response) => response.json())
    .then((data) => {
      // console.log(data)
      if (data.success) {
        const select = document.getElementById("alumnoSelect");
        data.alumnos.forEach((alumno) => {
          const option = document.createElement("option");
          option.value = alumno.id;
          option.textContent = alumno.nombre;
          select.appendChild(option);
        });
      }
    })
    .catch((error) => console.error("Error:", error));
}

function guardarPendiente() {
  document
    .getElementById("formAgregarPendiente")
    .addEventListener("submit", function (e) {
      e.preventDefault();
      // const horas = document.getElementById('horas').value;
      // const monto = horas * 12;
      var formData = new FormData(this);
      // formData.append('monto', monto);
      fetch(URL + "setPagoP.php", {
        method: "POST",
        body: formData,
      })
        .then((respones) => respones.json())
        .then((data) => {
          if (data === "Exito") {
            location.href = "ingresos_pendientes.html";
          } else {
            // alert("Error al añadir alumno");
          }
        })
        .catch((error) => {
          console.error('Ha habido un error' +error);
          // alert("Error al enviar los datos");
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
    .then((response) => response.json())
    .then((res) => {
      if (res === "Exito") {
        alert("Pago registrado!");
        location.reload(); // Recargar la página o actualizar la tabla de pendientes
      } else {
        alert("Error al registrar el pago!" + res);
      }
    })
    .catch((error) => {
      console.error("Error del servidor:", error);
    });
}

function getTotalPendiente() {
  fetch(URL + "getTotalP.php", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
  })
    .then((response) => response.json())
    .then((total) => {
      console.log(total)
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
