$('#sd1').datepicker({});

$(function () {
  $('#calendarForm').load('/calendar/calendarMonth.jsp');
  $('#monthCalendar').attr('class', 'currentCalendar');
})

$('#weekCalendar').click(function () {
  $('#calendarForm').load('/calendar/calendarWeek.jsp');
  $('#monthCalendar').attr('class', '');
  $(this).attr('class', 'currentCalendar');
});

$('#monthCalendar').click(function () {
  $('#calendarForm').load('/calendar/calendarMonth.jsp');
  $('#weekCalendar').attr('class', '');
  $(this).attr('class', 'currentCalendar');
});