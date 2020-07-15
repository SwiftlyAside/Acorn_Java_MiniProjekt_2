$(() => {
  $('#dayFrom').datepicker({});
  $('#dayTo').datepicker({
    setDate: new Date(),
    autoclose: true,
  });

  $.post('/explorer/readerController.jsp', (html) => {
    $(html).insertAfter('#leftButton');
  });

  $('[data-toggle="tooltip"]').tooltip();

  $('#leftButton').click(() => {
    console.log('왼쪽');
  });

  $('#rightButton').click(() => {
    console.log('오른쪽');
  });
});
