const URL = '../../backEnd/php/';
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        locale: 'es',
        initialView: 'dayGridMonth',
        headerToolbar: false,
        events: URL + 'cargar_eventos.php', 
        height: 'auto',
        datesSet: function(dateInfo) {
            document.getElementById('currentMonthYear').innerHTML = `<h4>${dateInfo.view.title}</h4>`;
        },
        eventContent: function(arg) {
            // Crea elementos DOM para la hora y el título del evento
            var timeElement = document.createElement('div');
            timeElement.classList.add('fc-event-time');
            timeElement.innerHTML = arg.timeText; // Obtén el texto del tiempo del evento
    
            var titleElement = document.createElement('div');
            titleElement.classList.add('fc-event-title');
            titleElement.innerHTML = arg.event.title;
    
            var containerElement = document.createElement('div');
            containerElement.appendChild(timeElement);
            containerElement.appendChild(titleElement);
    
            // Retorna el contenedor con la hora y el título
            return { domNodes: [containerElement] };
        },
        slotDuration: '01:00:00'
    });

    calendar.render();

    // Evento para el botón "Anterior"
    document.getElementById('btnPrev').addEventListener('click', function() {
        calendar.prev();
    });

    // Evento para el botón "Hoy"
    document.getElementById('btnToday').addEventListener('click', function() {
        calendar.today();
    });

    // Evento para el botón "Siguiente"
    document.getElementById('btnNext').addEventListener('click', function() {
        calendar.next();
    });

    function closeSidebarMenu() {
        var sidebarMenu = document.getElementById('sidebarMenu');
        if (sidebarMenu.classList.contains('open')) {
            sidebarMenu.classList.remove('open');
        }
    }

    // Modifica los eventos para los botones de cambio de vista
    document.getElementById('btnMonth').addEventListener('click', function() {
        calendar.changeView('dayGridMonth');
        closeSidebarMenu(); // Cierra el menú lateral si está abierto
    });
    document.getElementById('btnMonth2').addEventListener('click', function() {
        calendar.changeView('dayGridMonth');
        closeSidebarMenu(); // Cierra el menú lateral si está abierto
    });

    document.getElementById('btnWeek').addEventListener('click', function() {
        calendar.changeView('timeGridWeek');
        closeSidebarMenu(); // Cierra el menú lateral si está abierto
    });
    document.getElementById('btnWeek2').addEventListener('click', function() {
        calendar.changeView('timeGridWeek');
        closeSidebarMenu(); // Cierra el menú lateral si está abierto
    });

    document.getElementById('btnDay').addEventListener('click', function() {
        calendar.changeView('timeGridDay');
        closeSidebarMenu(); // Cierra el menú lateral si está abierto
    });
    document.getElementById('btnDay2').addEventListener('click', function() {
        calendar.changeView('timeGridDay');
        closeSidebarMenu(); // Cierra el menú lateral si está abierto
    });

    // Toggle para el menú lateral
    document.getElementById('toggleMenu').addEventListener('click', function() {
        document.getElementById('sidebarMenu').classList.toggle('open');
    });









    document.getElementById('addEventBtn').addEventListener('click', function() {
        $('#eventModal').modal('show'); // Usa jQuery para mostrar el modal
    });
    
    document.getElementById('createEventForm').addEventListener('submit', function(e) {
        e.preventDefault(); // Prevenir el envío por defecto del formulario
        
        // Recoger los datos del formulario
        var title = document.getElementById('eventTitle').value;
        var description = document.getElementById('eventDescription').value;
        var start = document.getElementById('eventStart').value;
        var end = document.getElementById('eventEnd').value;
        var color = document.getElementById('eventColor').value;
        var textColor = document.getElementById('eventTextColor').value;
    
        // Crear el objeto FormData para enviar al servidor
        var formData = new FormData();
        formData.append('titulo', title);
        formData.append('descripcion', description);
        formData.append('inicio', start);
        formData.append('fin', end);
        formData.append('color', color);
        formData.append('textColor', textColor);
    
        // Enviar los datos al servidor mediante Fetch API
        fetch(URL + 'crear_evento.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Cerrar el modal y actualizar el calendario
                $('#eventModal').modal('hide');
                // Aquí deberías llamar a una función para actualizar el calendario con el nuevo evento...
                // Por ejemplo: calendar.refetchEvents(); si estás usando FullCalendar.
                alert('Evento creado con éxito');
            } else {
                throw new Error(data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Error al crear el evento: ' + error.message);
        });
    });
    
    
});


