const URL = "../../backEnd/php/";
document.addEventListener("DOMContentLoaded", function () {
  const id = localStorage.getItem("id");
  fetch(URL + "perfil.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ id: id }),
  })
    .then((res) => res.json())
    .then((data) => {
      console.log(data[0]);
      const container = document.getElementById("datos");
      const row = `
      <div class="flex min-h-screen items-center justify-center">
      <div class="w-64 rounded-lg border-2 border-indigo-500 bg-transparent p-4 text-center shadow-lg dark:bg-gray-800">
        <figure class="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-indigo-500 dark:bg-indigo-600">
          
          <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-person-fill text-white dark:text-indigo-300" viewBox="0 0 16 16">
            <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"></path>
          </svg>
          <figcaption class="sr-only">John Doe, Web Developer</figcaption>
        </figure>
        <h2 class="mt-4 text-xl font-bold text-indigo-600 dark:text-indigo-400">${data[0].nombre}</h2>
        <p class="mb-4 text-gray-600 dark:text-gray-300">Ambito: ${data[0].asignatura}</p>
        <div class="flex items-center justify-center">
          <a href="home.html#contacto" class="btn btn-info">Contact</a>
          <a href="https://aissa-portfolio.com/" target="_blank" class="btn btn-secondary">Portfolio</a>
        </div>
      </div>
    </div>

    
        `;
        container.insertAdjacentHTML('beforeend', row);
    })
    .catch((error) => {
      console.error("Error del servidor." + error);
    });
});
