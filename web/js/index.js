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
    } else if (item === 'diaryWrite') {
        $mainContainer.load('/diary/diaryWrite.jsp');
    }
  });

  $('#timeLineDiv').load('/timeline/timeline.jsp');
  $('#scrollData').load('/timeline/scrollData.jsp');

  $('#searchButton').click(() => {
    $mainContainer.load(`/explorer/explorer.jsp?search=${$('#searchText').val()}`);
  });

  $('#readerAnchor').click(() => {
    $('#reader').load('/explorer/reader.jsp');
  });
});
