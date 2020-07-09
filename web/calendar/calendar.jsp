<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
  $(() => {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      themeSystem: 'bootstrap',
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      weekNumbers: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: 'https://fullcalendar.io/demo-events.json',
    });
    calendar.render();
  });
</script>
<div class="card-body">
    <div id='calendar'></div>
</div>
