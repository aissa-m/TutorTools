const URL = "../../backEnd/php/";
let pendientesPorAlumno = {}; // ← Variable global

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
        return;
      }

      // Guardar agrupación por alumno
      pendientesPorAlumno = pendientes.reduce((acc, pendiente) => {
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

      // Mostrar tarjetas de resumen
      Object.values(pendientesPorAlumno).forEach(alumno => {
        const tarjeta = `
          <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm border-0" style="background-color: rgba(0, 0, 0, 0.2);">
              <div class="card-body text-center">
                <h5 class="card-title">${alumno.nombre}</h5>
                <p class="card-text">💰 <strong>${alumno.total.toFixed(2)} €</strong> pendientes</p>
                <button class="btn btn-sm btn-success mb-2" onclick="abrirModalRegistro('${alumno.nombre}')">
                  ➕ Registrar pago
                </button>
                <br />
                <button class="btn btn-sm btn-outline-secondary" onclick="verHistorial('${alumno.nombre}')">
                  📜 Ver historial
                </button>
              </div>
            </div>
          </div>
        `;
        contenedor.insertAdjacentHTML("beforeend", tarjeta);
      });

      validarInputsDePago?.(); // si ya la usas
    });
}

function verHistorial(nombreAlumno) {
  const alumno = pendientesPorAlumno[nombreAlumno];
  if (!alumno) return;

  const contenido = alumno.pagos.map(p => `
    <div class="border-bottom pb-2 mb-2">
      <div><strong>Fecha:</strong> ${p.fecha}</div>
      <div><strong>Monto:</strong> ${p.monto} €</div>
      <div><strong>Horas:</strong> ${p.horas}</div>
    </div>
  `).join("");

  document.getElementById("modalNombreHistorial").textContent = nombreAlumno;
  document.getElementById("contenidoHistorialAlumno").innerHTML = contenido || "<p>No hay registros.</p>";

  new bootstrap.Modal(document.getElementById("modalHistorial")).show();
}


function abrirModalRegistro(nombreAlumno) {
  const alumnoData = Object.values(pendientesPorAlumno).find(a => a.nombre === nombreAlumno);
  const detalle = alumnoData.pagos.map(p => `
    <div class="mb-3 p-2 border rounded">
      <div class="d-flex justify-content-between mb-1">
        <span>${p.fecha} — <strong>${p.monto}€</strong></span>
      </div>
      <input type="number" step="0.01" min="0" max="${p.monto}" value="${p.monto}" 
        class="form-control inputPago" data-id="${p.id}">
    </div>
  `).join("");

  document.getElementById("modalNombreAlumno").textContent = nombreAlumno;
  document.getElementById("detallePagosAlumno").innerHTML = detalle;
  new bootstrap.Modal(document.getElementById("modalRegistroPago")).show();


}

function confirmarPagos() {
  const pagos = Array.from(document.querySelectorAll(".inputPago")).map(input => {
    return {
      id: parseInt(input.dataset.id),
      monto: parseFloat(input.value)
    };
  }).filter(p => p.monto > 0);

  if (pagos.length === 0) {
    alert("No se ha introducido ningún monto válido.");
    return;
  }

  fetch(URL + "pagarSeleccionados.php", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ pagos })
  })
    .then(res => res.json())
    .then(data => {
      if (data === "Exito") {
        location.reload();
      } else {
        alert("Error: " + JSON.stringify(data));
      }
    });
}



function validarInputsDePago() {
  document.querySelectorAll(".inputPago").forEach(input => {
    input.addEventListener("input", () => {
      const max = parseFloat(input.max);
      const valor = parseFloat(input.value);

      if (isNaN(valor) || valor <= 0 || valor > max) {
        input.classList.add("is-invalid");
        input.classList.remove("is-valid");
      } else {
        input.classList.remove("is-invalid");
        input.classList.add("is-valid");
      }
    });
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
  const pagos = idsPagosPendientes.map(id => {
    const input = document.querySelector(`.inputPago[data-id='${id}']`);
    const monto = parseFloat(input?.value || 0);
    return { id, monto };
  });

  fetch(URL + "pagarSeleccionados.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ pagos }),
  })
    .then(response => response.json())
    .then(res => {
      if (res === "Exito") {
        location.reload();
      } else {
        alert("Error al registrar los pagos: " + res);
      }
    })
    .catch(error => {
      console.error("Error del servidor:", error);
    });
}


function eliminarSeleccionados(idsPagosPendientes) {
  const pagos = idsPagosPendientes.map(id => {
    const input = document.querySelector(`.inputPago[data-id='${id}']`);
    const monto = parseFloat(input?.value || 0);
    return { id, monto };
  });

  if (confirm("¿Estás seguro de que quieres eliminar estos pagos pendientes (total o parcial)?")) {
    fetch(URL + "eliminarSeleccionados.php", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ pagos }),
    })
      .then(response => response.json())
      .then(res => {
        if (res === "Exito") {
          location.reload();
        } else {
          alert("Error al eliminar los pagos: " + JSON.stringify(res));
        }
      })
      .catch(error => {
        console.error("Error del servidor:", error);
      });
  }
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

        document.getElementById("buscadorAlumno").addEventListener("input", function () {
          const filtro = this.value.toLowerCase();
          const opciones = document.getElementById("alumnoSelect").options;

          for (let i = 0; i < opciones.length; i++) {
            const texto = opciones[i].text.toLowerCase();
            opciones[i].style.display = texto.includes(filtro) ? "" : "none";
          }
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
