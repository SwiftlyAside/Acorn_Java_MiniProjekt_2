$(() => {
  const searchParam = $('#searchValue').val();
  $('#media').load(`/explorer/explorerController.jsp?target=media&search=${searchParam}`);

  $('a[data-toggle="tab"]').on('shown.bs.tab', (e) => {
    const target = e.target.getAttribute('aria-controls');
    $(`#${target}`).load(`/explorer/explorerController.jsp?target=${target}&search=${searchParam}`);
  });

  $('#summer').summernote();

  $('#clickbutton').click(() => {
    console.log($.parseHTML($('#summer').val()));
    $.post('/explorer/submitRecord.jsp', { content: $('#summer').val() }, (html) => {
      $('#res').html(html);
    });
  });
});
