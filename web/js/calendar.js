$('#sd1').datepicker({});

$(function () {
  $('#calendarForm').load('/calendar/calendarMonth.jsp');
  $('#monthCalendar').attr('class', 'btn btn-light-green lighten-1');
})

$('#weekCalendar').click(function () {
  $('#calendarForm').load('/calendar/calendarWeek.jsp');
  $('#monthCalendar').attr('class', 'btn');
  $(this).attr('class', 'btn btn-light-green lighten-1');
});

$('#monthCalendar').click(function () {
  $('#calendarForm').load('/calendar/calendarMonth.jsp');
  $('#weekCalendar').attr('class', 'btn');
  $(this).attr('class', 'btn btn-light-green lighten-1');
});