const URL = '../../backEnd/php/';
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        locale: 'es',
        firstDay: 1,
        initialView: 'dayGridMonth',
        headerToolbar: false,
        events: URL + 'cargar_eventos.php', 
        height: 'auto',
        datesSet: function(dateInfo) {
            document.getElementById('currentMonthYear').innerHTML = `<h4>${dateInfo.view.title}</h4>`;
        },
        eventContent: function(arg) {
            var timeElement = document.createElement('div');
            timeElement.classList.add('fc-event-time');

            // Formatea la fecha y hora de inicio y fin del evento
            var startTime = new Date(arg.event.start).toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
            var endTime = new Date(arg.event.end).toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});

            // Configura el contenido del elemento de tiempo para incluir tanto la hora de inicio como la de fin
            timeElement.innerHTML = startTime + ' - ' + endTime; 
            timeElement.style.color ='black'; // Aplica el color del texto
    
            var titleElement = document.createElement('div');
            titleElement.classList.add('fc-event-title');
            titleElement.innerHTML = arg.event.title;
            titleElement.style.color = arg.textColor; // Aplica el color del texto al título
    
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
        const title = document.getElementById('eventTitle').value;
        const description = document.getElementById('eventDescription').value;
        const start = document.getElementById('eventStart').value;
        const end = document.getElementById('eventEnd').value;
        const color = document.getElementById('eventColor').value;
        const textColor = document.getElementById('eventTextColor').value;
        const id = localStorage.getItem('id');
        
        // Crear el objeto FormData para enviar al servidor
        const formData = new FormData();
        formData.append('titulo', title);
        formData.append('descripcion', description);
        formData.append('inicio', start);
        formData.append('fin', end);
        formData.append('color', color);
        formData.append('textColor', textColor);
        formData.append('idProfe', id)
    
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
        const id = document.getElementById('eventId').value;
        const title = document.getElementById('editTitulo').value;
        const description = document.getElementById('editDescription').value;
        const start = document.getElementById('editStart').value;
        const end = document.getElementById('editEnd').value;
        const color = document.getElementById('editColor').value;
        const textColor = document.getElementById('editTextColor').value;

        // Crea el objeto FormData para enviar al servidor
        const formData = new FormData();
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
        const eventId = document.getElementById('eventId').value;
        
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


