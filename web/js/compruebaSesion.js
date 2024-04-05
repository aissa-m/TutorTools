fetch(URL + "compruebaSesion.php")
  .then((res) => res.json())
  .then((data) => {
    if (!data.logueado) {
      // Corrección aquí
      window.location.href = "login.html";
    }
  })
  .catch((error) => {
    console.error("Error del servidor:", error);
  });
