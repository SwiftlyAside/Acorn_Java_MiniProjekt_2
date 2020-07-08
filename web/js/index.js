$(() => {
  const $mainContainer = $('#mainContainer');
  const classList = $mainContainer.attr('class').split(/\s+/);
  $.each(classList, (index, item) => {
    if (item === 'diary') {
      $mainContainer.load('/calendar/calendar.jsp');
    } else if (item === 'explorer') {
      $mainContainer.load('/explorer/explorer.jsp');
    } else if (item === 'calendar') {
      $mainContainer.load('/calendar/calendar.jsp');
    } else if (item === 'reader') {
      $mainContainer.load('/calendar/calendar.jsp');
    }
  });
});
