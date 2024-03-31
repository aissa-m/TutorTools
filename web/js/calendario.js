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
            timeElement.style.color = arg.textColor;

            var containerElement = document.createElement('div');
            containerElement.appendChild(timeElement);
            containerElement.appendChild(titleElement);
    
            // Retorna el contenedor con la hora y el título
            return { domNodes: [containerElement] };
        },
        slotDuration: '01:00:00',
        eventClick: function(info) {
            var event = info.event;

            // Llena el formulario con los datos del evento
            document.getElementById('eventId').value = event.id;
            document.getElementById('editTitulo').value = event.title;
            document.getElementById('editDescription').value = event.extendedProps.description;
            document.getElementById('editStart').value = event.start.toISOString().slice(0,16);
            document.getElementById('editEnd').value = event.end.toISOString().slice(0,16);
            document.getElementById('editColor').value = event.backgroundColor;
            document.getElementById('editTextColor').value = event.textColor;
            // Muestra el modal
            $('#editEventModal').modal('show');
        }
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
                $('#eventModal').modal('hide');
                calendar.refetchEvents(); 

            } else {
                throw new Error(data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Error al crear el evento: ' + error.message);
        });
    });
    

    document.getElementById('editEventForm').addEventListener('submit', function(e) {
        e.preventDefault(); // Previene el envío normal del formulario

        // Recoge los valores del formulario
        let id = document.getElementById('eventId').value;
        let title = document.getElementById('editTitulo').value;
        let description = document.getElementById('editDescription').value;
        let start = document.getElementById('editStart').value;
        let end = document.getElementById('editEnd').value;
        let color = document.getElementById('editColor').value;
        let textColor = document.getElementById('editTextColor').value;

        // Crea el objeto FormData para enviar al servidor
        let formData = new FormData();
        formData.append('id', id);
        formData.append('titulo', title);
        formData.append('descripcion', description);
        formData.append('inicio', start);
        formData.append('fin', end);
        formData.append('color', color);
        formData.append('textColor', textColor);

        // Realiza la petición al servidor
        fetch(URL + 'actualizar_evento.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if(data.success) {
                // Cierra el modal
                $('#editEventModal').modal('hide');                
                calendar.refetchEvents(); 
            } else {
                throw new Error(data.message || 'Error al actualizar el evento');
            }
        })
        .catch(error => {
            console.error('Error al actualizar el evento:', error);
            alert('Error al actualizar el evento: ' + error.message);
        });
    });

    document.getElementById('deleteEventButton').addEventListener('click', function() {
        var eventId = document.getElementById('eventId').value;
    
        if(confirm('¿Estás seguro de que deseas eliminar este evento?')) {
            fetch(URL + 'eliminar_evento.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `id=${eventId}`
            })
            .then(response => response.json())
            .then(data => {
                if(data.success) {
                    // Cierra el modal si está abierto
                    $('#editEventModal').modal('hide');
                    calendar.refetchEvents(); 
                } else {
                    throw new Error(data.message || 'Error al eliminar el evento');
                }
            })
            .catch(error => {
                console.error('Error al eliminar el evento:', error);
                alert('Error al eliminar el evento: ' + error.message);
            });
        }
    });
    
    
});


