function loadPage(target, searchParam, group, orderBy, desc) {
  $(`#${target}`).load(`/explorer/explorerController.jsp?
    target=${target}
    &search=${searchParam}
    &group=${group}
    &orderBy=${orderBy}${desc}`);
}

let group = 'all';
let orderBy = 'date';
let desc = '&desc=1';
let target = 'media';

$(() => {
  const searchParam = $('#searchValue').val();

  $('#media').load(`/explorer/explorerController.jsp?target=media&search=${searchParam}`);

  $('a[data-toggle="tab"]').on('shown.bs.tab', (e) => {
    target = e.target.getAttribute('aria-controls');
    loadPage(target, searchParam);
  });

  $('#summer').summernote();

  $('#clickbutton').click(() => {
    console.log($.parseHTML($('#summer').val()));
    $.post('/explorer/submitRecord.jsp', { content: $('#summer').val() }, (html) => {
      $('#res').html(html);
    });
  });

  $('.btn-group.btn-group-toggle.btn-group-first > .btn > input').click((e) => {
    orderBy = e.target.id === 'byDateButton' ? 'date' : 'name';
  });

  $('.btn-group.btn-group-toggle.btn-group-secondary > .btn > input').click((e) => {
    group = e.target.value;
  });

  $('.btn-group.btn-group-toggle.btn-group-secondary > .dropdown-menu > .dropdown-item').click((e) => {
    desc = e.target.id === 'ascAnchor' ? '' : '&desc=1';
  });
});
