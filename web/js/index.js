$(() => {
  const $mainContainer = $('#mainContainer');
  const classList = $mainContainer.attr('class').split(/\s+/);
  $.each(classList, (index, item) => {
    if (item === 'login') {
      $mainContainer.load('/joinheader/joinHeader.jsp');
    } else if (item === 'diary') {
      $mainContainer.load('/diary/diaryList.jsp');
    } else if (item === 'explorer') {
      $mainContainer.load('/explorer/explorer.jsp');
    } else if (item === 'calendar') {
      $mainContainer.load('/calendar/calendar.jsp');
    } else if (item === 'reader') {
      $mainContainer.load('/explorer/reader.jsp');
    }
  });

  $('#searchButton').click(() => {
    $mainContainer.load(`/explorer/explorer.jsp?search=${$('#searchText').val()}`);
  });
});
