$(() => {
  const $mainContainer = $('#mainContainer');
  const classList = $mainContainer.attr('class').split(/\s+/);

  function getParameter(strParamName) {
    let arrResult = null;
    if (strParamName) {
      arrResult = location.search.match(new RegExp(`[&?]${strParamName}=(.*?)(&|$)`));
      return arrResult && arrResult[1] ? arrResult[1] : null;
    }
    return null;
  }

  $.each(classList, (index, item) => {
    if (item === 'login') {
      $mainContainer.load('/joinheader/joinHeader.jsp');
    } else if (item === 'logout') {
      $.ajax({
        type: 'POST',
        url: '/joinheader/logout.jsp',
        success() {
          alert('로그아웃!');
          $(location).attr('href', '/index.jsp');
        },
      });
    } else if (item === 'condition') {
      $mainContainer.load('/joinheader/condition.jsp');
    } else if (item === 'diary') {
      $mainContainer.load(`/diary/diaryList.jsp?record=${getParameter('record')}`);
    } else if (item === 'memo') {
      $mainContainer.load('/memo/memoWrite.jsp');
    } else if (item === 'explorer') {
      $mainContainer.load('/explorer/explorer.jsp');
    } else if (item === 'calendar') {
      $mainContainer.load(`/calendar/calendar.jsp?plan=${getParameter('plan')}`);
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
