$(() => {
  function toggleOpen(e) {
    $(e.target)
      .prev('.card-header')
      .find('.expand-icon')
      .text('remove_circle');
  }
  function toggleClose(e) {
    $(e.target)
      .prev('.card-header')
      .find('.expand-icon')
      .text('add_circle');
  }
  $('.panel-group').on('hidden.bs.collapse', toggleClose);
  $('.panel-group').on('shown.bs.collapse', toggleOpen);

  $.ajax({
    type: 'POST',
    url: '/diary/diaryListProc.jsp',
    dataType: 'json',
    success(data) {
      console.log(data);
      for (var i = 0; i < data.length; i++) {
        console.log(`data[i].weather : ${data[i].weather}`);
        $(`.Dlist_title${i}`).append(`${data[i].recordDate}&nbsp&nbsp&nbsp<b>${data[i].title}</b>`);
        $(`.Dlist_content${i}`).append(data[i].content);
        $(`.Dlist_weather${i}`).append(data[i].weather);
        $(`.Dlist_condition${i}`).append(data[i].condition);
        $(`.Dlist_geoInfo${i}`).append(data[i].geoInfo);
      }

      for (var i = 0; i < data.length; i++) {
        console.log(`data[i].recordNo : ${data[i].recordNo}`);
        $(`.Dlist_delbtn${i}`).on('click', () => {
          const durl = `/diary/diaryDeleteProc.jsp?recordNo=${data[i].recordNo}`;
          $.ajax({
            type: 'POST',
            url: durl,
            success() {
              $(location).attr('href', '/index.jsp?open=diary');
            },
          });
        });
      }
    },
    error(xhr, status, error) {
      console.log(status);
    },
  });
});
