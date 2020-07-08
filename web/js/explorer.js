$(() => {
  $('#media').load('/explorer/explorerController.jsp?target=media');

  $('a[data-toggle="tab"]').on('shown.bs.tab', (e) => {
    const target = e.target.getAttribute('aria-controls');
    $(`#${target}`).load(`/explorer/explorerController.jsp?target=${target}`);
  });
});
