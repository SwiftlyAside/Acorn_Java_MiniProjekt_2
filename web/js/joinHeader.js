$(() => {
  $('#loginForm').load('/joinheader/joinHeaderController.jsp?target=loginForm');

  $('a[data-toggle="tab"]').on('shown.bs.tab', (e) => {
    const target = e.target.getAttribute('aria-controls');
    $(`#${target}`).load(`/joinheader/joinHeaderController.jsp?target=${target}`);
  });
});