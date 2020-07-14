$(document).ready(function () {

  $('#right').removeEventListener('click');
  $('#left').removeEventListener('click');

  $('#right').click(() => {
    /* $('#monthBody tr').remove();
     nextCalendar();
     $('#sd1').datepicker('update', today);*/
    console.log('right');
  });

  $('#left').click(() => {
    console.log('left');
  });
})