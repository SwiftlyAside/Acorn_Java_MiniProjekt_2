$(document).ready(function () {
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

  function planModalClear() {
    $('#planTitle').val('');
    $('#planContent').val('');
    $('#planStartDate').val('');
    $('#planEndDate').val('');
    $('#starTime').val('');
    $('#endTime').val('');
  }

  $('#planClose').click(function () {
    planModalClear();
  });

  $('#planCloseIcon').click(function () {
    planModalClear();
  });

  $('#taskClose').click(function () {
    $('#taskTitle').val('');
    timer.destroy();
    timer = $('.timer').TimeCircles({start: false});
  });

  // plan, task 저장 임시 logic
  $('#makePlanDiv > button').click(() => {
    // $('#monthBody tr div[id]').append('<li>plan</li>');
  });

  $('#makeTaskDiv > button').click(() => {
    // $('#monthBody tr div[id]').append('<li>task</li>');
  });

  $('#planWrite').click(() => {
    // no -> p 붙이기
    // 객체에 저장하여 json 형식으로 data 구조화
    // cntroller 에 전달

    let data = {};
    data.userId = 'admin'; /*get from session..*/
    data.title = $('#planTitle').val();
    data.content = $('#planContent').val();
    data.starDate = $('#planStartDate').val() + $('#starTime').val();
    data.endDate = $('#planEndDate').val() + $('#endTime').val();

    let jsonData = JSON.stringify(data);
    console.log(jsonData);

    $.ajax({
      type: 'POST',
      url: '/calendar/calendarController.jsp?target=plan',
      data: {
        jsonData: jsonData
      },
      success: function (html) {
        alert(html);
      },
      dataType: 'html' /*success시 여기서 지정한 형식으로 parsing되어 들어온다*/

    })

    planModalClear();
  })

})
