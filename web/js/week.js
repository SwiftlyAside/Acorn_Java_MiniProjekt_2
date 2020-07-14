$(document).ready(function () {
  let days = {sun: 0, mon:1, tue:2, wed:3, thu: 4, fri: 5, sat: 6};

  $('#right').unbind('click');
  $('#left').unbind('click');

  $('#right').click(() => {
    console.log('right');
  });

  $('#left').click(() => {
    console.log('left');
  });

  var today = new Date();
  let startDate = today.getDate() - today.getDay();

  function todayWeek() {

    $('.myWeek').each(function (idx) {
      $(this).html(startDate++);
      if (idx == today.getDay()) $(this).css('background-color', '#A9F5A9');

    });

  }

  todayWeek();
})