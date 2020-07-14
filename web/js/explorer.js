$(() => {
  let target = 'media';
  let orderBy = 'date';
  let group = 'all';
  let desc = '&desc=1';
  const searchParam = $('#searchValue').val();

  function loadPage(targetId) {
    $(`#${targetId}`).load(`/explorer/explorerController.jsp?target=${targetId}&search=${searchParam}&group=${group}&orderBy=${orderBy}${desc}`);
  }

  loadPage('media');

  $('a[data-toggle="tab"]').on('shown.bs.tab', (e) => {
    target = e.target.getAttribute('aria-controls');
    loadPage(target);
    navigator.geolocation.getCurrentPosition((ev) => {
      console.log(`${ev.coords.latitude}  AND  ${ev.coords.longitude}`);
    });
  });

  // 날짜, 이름 선택시
  $('.btn-group.btn-group-toggle.btn-group-first > .btn > input').click((e) => {
    orderBy = e.target.id === 'byDateButton' ? 'date' : 'name';
    loadPage(target);
  });

  // 년도, 월, 일, 전체 선택시
  $('.btn-group.btn-group-toggle.btn-group-secondary > .btn > input').click((e) => {
    group = e.target.value;
    loadPage(target);
  });

  // 오름차순, 내림차순 선택시
  $('.btn-group.btn-group-toggle.btn-group-secondary > .dropdown-menu > .dropdown-item').click((e) => {
    desc = e.target.id === 'ascAnchor' ? '' : '&desc=1';
    loadPage(target);
  });
});
