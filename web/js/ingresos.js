const URL = '../../backEnd/php/';
function mesNombre(cadenaMes) {
  const meses = [
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre",
  ];
  const partes = cadenaMes.split("-");
  const mesNumero = parseInt(partes[1], 10); // Convierte el mes a número (1-12)
  return meses[mesNumero - 1]; // Retorna el nombre del mes correspondiente
}

function agruparIngresosPorAnioYMes(ingresos) {
  const ingresosPorAnioYMes = {};

  ingresos.forEach((ingreso) => {
    const [anio, mes] = ingreso.fecha.split("-"); // Obtener año y mes por separado
    const clave = `${anio}-${mes}`; // Formato "YYYY-MM"
    const nombreMes = mesNombre(`${anio}-${mes}`); // Convertir el mes a nombre

    if (!ingresosPorAnioYMes[clave]) {
      ingresosPorAnioYMes[clave] = {
        total: 0,
        ingresos: [],
        anio,
        nombreMes,
      };
    }

    ingresosPorAnioYMes[clave].ingresos.push(ingreso);
    ingresosPorAnioYMes[clave].total += parseFloat(ingreso.monto);
  });

  return ingresosPorAnioYMes;
}




function getIngresos() {
  fetch(URL + 'ingresos.php', {
    method: 'POST',
    headers: {'Content-Type': 'application/json'},
  })
  .then((response) => response.json())
  .then((ingresos) => {
    const contenedorAcordeon = document.getElementById("acordeon-ingresos");
    contenedorAcordeon.innerHTML = ""; // Limpiar antes de agregar nuevos datos

    if (ingresos === "No hay datos") {
      document.getElementById("titulo").innerText = "No hay datos todavía!";
    } else {
      const ingresosPorAnioYMes = agruparIngresosPorAnioYMes(ingresos);

      Object.keys(ingresosPorAnioYMes).forEach((clave, index) => {
        const { total, ingresos, anio, nombreMes } = ingresosPorAnioYMes[clave];

        // Crear acordeón por año y mes
        const acordeonItem = `
          <div class="card" style="background-color: rgba(0, 0, 0, 0.2);">
            <div class="card-header" id="heading${index}">
              <h2 class="mb-0">
                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse${index}" aria-expanded="true" aria-controls="collapse${index}" style="color: black;">
                  ${nombreMes} ${anio} - Total: ${total.toFixed(2)}€
                </button>
              </h2>
            </div>
            <div id="collapse${index}" class="collapse" aria-labelledby="heading${index}" data-parent="#acordeon-ingresos">
              <div class="card-body">
                <div id="filtros${index}" class="filtros">
                  <input type="text" id="filtroNombre${index}" placeholder="Filtrar por nombre" class="input3">
                  <input type="date" id="filtroFecha${index}" placeholder="Filtrar por fecha" class="input3">
                  <button class="btn1 mb-1" id="aplicarFiltros${index}">Aplicar filtros</button>
                </div>
                <div id="ingresos-lista${index}">
                  ${ingresos
                    .map(
                      (ingreso) => `
                        <div class="card mb-3" style="background-color: rgba(0, 0, 0, 0.2);">
                          <div class="card-body">
                            <h5 class="card-title">${ingreso.nombre}</h5>
                            <p class="card-text">Monto: ${ingreso.monto}€</p>
                            <p class="card-text">Fecha: ${ingreso.fecha}</p>
                            <button class="btn btn-secondary eliminar" data-id="${ingreso.id}" data-tipo="ingreso">Eliminar</button>
                          </div>
                        </div>
                      `
                    )
                    .join("")}
                </div>
              </div>
            </div>
          </div>
        `;

        contenedorAcordeon.insertAdjacentHTML("beforeend", acordeonItem);

        // Añadir evento para aplicar filtros
        document.getElementById(`aplicarFiltros${index}`).addEventListener("click", () => {
          aplicarFiltrosPorMesYAnio(clave, index);
        });
      });
    }
  })
  .catch((e) => {
    console.error(e);
  });
}

function aplicarFiltrosPorMesYAnio(clave, index) {
  const filtroNombre = document.getElementById(`filtroNombre${index}`).value.toLowerCase();
  const filtroFecha = document.getElementById(`filtroFecha${index}`).value;

  fetch(URL + 'ingresos.php', {
    method: 'POST',
    headers: {'Content-Type': 'application/json'},
  })
  .then((response) => response.json())
  .then((ingresos) => {
    const ingresosPorAnioYMes = agruparIngresosPorAnioYMes(ingresos);
    const ingresosFiltrados = ingresosPorAnioYMes[clave].ingresos.filter((ingreso) => {
      return (
        (filtroNombre === "" || ingreso.nombre.toLowerCase().includes(filtroNombre)) &&
        (filtroFecha === "" || ingreso.fecha === filtroFecha)
      );
    });

    const contenedorIngresos = document.getElementById(`ingresos-lista${index}`);
    contenedorIngresos.innerHTML = ingresosFiltrados.map(
      (ingreso) => `
        <div class="card mb-3" style="background-color: rgba(0, 0, 0, 0.2);">
          <div class="card-body">
            <h5 class="card-title">${ingreso.nombre}</h5>
            <p class="card-text">Monto: ${ingreso.monto}€</p>
            <p class="card-text">Fecha: ${ingreso.fecha}</p>
            <button class="btn btn-secondary eliminar" data-id="${ingreso.id}" data-tipo="ingreso">Eliminar</button>
          </div>
        </div>
      `
    ).join("");
  })
  .catch((e) => {
    console.error(e);
  });
}



function cargarAlumnos() {
  fetch(URL + "getStudents_back.php")
    .then((response) => response.json())
    .then((data) => {
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

function guardarIngreso() {
  document
    .getElementById("formAgregarIngreso")
    .addEventListener("submit", function (e) {
      e.preventDefault();
      var formData = new FormData(this);
      fetch(URL+"setIngreso.php", {
        method: "POST",
        body: formData,
      })
        .then((respones) => respones.json())
        .then((data) => {
          if (data === "Exito") {
            location.href = "ingresos.html";
          } else {
            // alert("Error al añadir ingreso");
          }
        })
        .catch((error) => {
          // alert("Error al enviar los datos");
        });
    });
}

document.addEventListener("DOMContentLoaded", function () {
  getIngresos();
  cargarAlumnos();
  guardarIngreso();
});
