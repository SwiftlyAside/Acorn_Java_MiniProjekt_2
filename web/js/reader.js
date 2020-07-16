$(() => {
  $.post('/explorer/readerController.jsp', (html) => {
    $(html).insertAfter('#leftButton');
  });

  const $dateRangePicker = $('#dateRangePicker');
  let startDate = $('#start').datepicker('getDate');
  let endDate = $('#end').datepicker('getDate');

  $dateRangePicker.datepicker();
  $dateRangePicker.on('changeDate', () => {
    startDate = $('#start').datepicker('getDate');
    endDate = $('#end').datepicker('getDate');
    $.post('/explorer/readerController.jsp', {
      timeFrom: startDate.getTime(),
      timeTo: endDate.getTime(),
    }, (html) => {
      $('.readerElement').remove();
      $(html).insertAfter('#leftButton');
    });
  });

  $('#start').datepicker('setDate', new Date('2000-01-01'));
  $('#end').datepicker('setDate', new Date());

  $('[data-toggle="tooltip"]').tooltip();

  $('#WeekButton, #MonthButton').click((e) => {
    const updatedDate = new Date($('#end').datepicker('getDate'));
    if (e.target.value === 'week') {
      updatedDate.setDate(updatedDate.getDate() - 7);
      $('#start').datepicker('setDate', updatedDate);
    } else if (e.target.value === 'month') {
      updatedDate.setDate(updatedDate.getDate() - 30);
      $('#start').datepicker('setDate', updatedDate);
    }
  });

  $('#leftButton').click(() => {
    $.post('/explorer/readerController.jsp', {
      move: 'left',
      timeFrom: startDate.getTime(),
      timeTo: endDate.getTime(),
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
      timeFrom: startDate.getTime(),
      timeTo: endDate.getTime(),
    }, (html) => {
      if (!html.includes('OUTOFINDEX')) {
        $('.readerElement').remove();
        $(html).insertAfter('#leftButton');
      }
    });
  });
});
