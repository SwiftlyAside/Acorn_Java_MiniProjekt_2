// datepicker init
$('#sd1').datepicker({
  autoclose: true,
  format: 'yyyy/m/dd'
});

$('#sd2').datepicker({
  autoclose: true,
  format: 'yyyy/m/dd'
});

$('#sd3').datepicker({
  autoclose: true,
  format: 'yyyy/m/dd'
});

// calendar 기본 화면 및 월/주 변경 처리
$(function () {
  $('#calendarForm').load('/calendar/calendarMonth.jsp');
  $('#monthCalendar').attr('class', 'btn btn-light-green lighten-1');
  console.log('페이지가 열렸다');
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


// timeCircles 초기화 및 각 버튼 로직
let timer = $('.timer').TimeCircles({start: false});

$('.start').click(function () {
  timer.start();
});
$('.stop').click(function () {
  timer.stop();
});
$('.restart').click(function () {
  timer.restart();
});
$('.destroy').click(function () {
  $('#taskTitle').val('');
  timer.destroy();
  timer = $('.timer').TimeCircles({start: false});
});

$('#planClose').click(function () {
  $('#planTitle').val('');
  $('#planContent').val('');
  $('#planStartDate').val('');
  $('#planEndDate').val('');
});

$('#planCloseIcon').click(function () {
  $('#planTitle').val('');
  $('#planContent').val('');
  $('#planStartDate').val('');
  $('#planEndDate').val('');
});

$('#taskClose').click(function () {
  $('#taskTitle').val('');
  timer.destroy();
  timer = $('.timer').TimeCircles({start: false});
});

// plan, task 저장 임시 logic
$('#makePlanDiv > button').click(() => {
  $('#monthBody tr div[id]').append('<li>plan</li>');
});

$('#makeTaskDiv > button').click(() => {
  $('#monthBody tr div[id]').append('<li>task</li>');
});