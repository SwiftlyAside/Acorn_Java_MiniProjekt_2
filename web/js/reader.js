$(() => {
  $('#dayFrom').datepicker({});
  $('#dayTo').datepicker({
    setDate: new Date(),
    autoclose: true,
  });

  $('.toast').toast();

  $.post('/explorer/readerController.jsp', (html) => {
    $(html).insertAfter('#leftButton');
  });

  $('[data-toggle="tooltip"]').tooltip();

  $('#leftButton').click(() => {
    $.post('/explorer/readerController.jsp', {
      move: 'left',
    }, (html) => {
      if (!html.includes('OUTOFINDEX')) {
        $('.readerElement').remove();
        $(html).insertAfter('#leftButton');
      }
    });
  });

  $('#rightButton').click(() => {
    $.post('/explorer/readerController.jsp', {
      move: 'right',
    }, (html) => {
      if (!html.includes('OUTOFINDEX')) {
        $('.readerElement').remove();
        $(html).insertAfter('#leftButton');
      }
    });
  });
});
