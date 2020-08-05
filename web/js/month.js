$(document).ready(() => {
  $('#todayButton').unbind('click');
  $('#right').unbind('click');
  $('#left').unbind('click');
  $('#sd1 > input').unbind('change');
  $('#makePlanDiv > button').unbind('click');
  $('#makeTaskDiv > button').unbind('click');

  // overflow 적용 func
  const overFn = function () {
    $('#monthBody tr div[id]').attr('class', 'overflow-auto');
  };

  const getPlan = function f() {
    $.ajax({
      type: 'POST',

      url: '/calendar/calendarController.jsp?target=month',

      data: {
        currentDate: today.getTime(),
      },

      dataType: 'json',

      success(json) {
        const day = [];
        for (const i in json) {
          // 10일 이하의 날짜를 한 자리수로 받기 위한 조건식
          const idx = json[i].startTime.substring(8, 10) < 10 ? 9 : 8;
          day[i] = json[i].startTime.substring(idx, 10);
        }
        console.log(day);

        for (const i in day) {
          $(`#${day[i]}`).append(`<li id="${json[i].no}">${json[i].title}</li>`);
          $(`#${day[i]}`).click(() => {
            alert(`${json[i].content}`);
          });
        }
      },

      error(html) {
        alert('오류가 있습니다ㅠㅠㅠ 관리자에게 문의하세요!');
      },
    });
  };

  var today = new Date();
  const date = new Date();

  function prevCalendar() {
    today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
    buildCalendar();
  }

  function nextCalendar() {
    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
    buildCalendar();
  }

  function buildCalendar() {
    const doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
    const lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
    const tbCalendar = document.getElementById('monthBody');

    $('#sd1>input').val(`${today.getFullYear()}/${today.getMonth() + 1}/${today.getDate()}`);

    while (tbCalendar.rows.length > 2) {
      tbCalendar.deleteRow(tbCalendar.rows.length - 1);
    }

    let row = null;
    row = tbCalendar.insertRow();
    let cnt = 0;

    for (let i = 0; i < doMonth.getDay(); i++) {
      row.insertCell();
      cnt += 1;
    }

    for (let i = 1; i <= lastDate.getDate(); i += 1) {
      const cell = row.insertCell();
      cell.innerHTML = `<div>${i}</div>` + `<div id=${i}>` + '</div>';
      cnt += 1;
      if (cnt % 7 == 1) {
        cell.innerHTML = `${'<div>' + '<font color=#F79DC2>'}${i}</font></div>` + `<div id=${i}>` + '</div>';
      }
      if (cnt % 7 == 0) {
        cell.innerHTML = `${'<div>' + '<font color=skyblue>'}${i}</font></div>` + `<div id=${i}>` + '</div>';
        row = tbCalendar.insertRow();
      }
      if (today.getFullYear() === date.getFullYear()
        && today.getMonth() === date.getMonth()
        && i === date.getDate()) {
        cell.bgColor = '#9FF781';
      }
    }
    overFn();
    getPlan();
  }

  // monthly calendar button
  $('#todayButton').click(() => {
    $('#monthBody tr').remove();
    today = new Date();
    buildCalendar();
  });
  $('#right').click(() => {
    $('#monthBody tr').remove();
    nextCalendar();
    $('#sd1').datepicker('update', today);
  });
  $('#left').click(() => {
    $('#monthBody tr').remove();
    prevCalendar();
    $('#sd1').datepicker('update', today);
  });

  // datepicker attach calendar
  $('#sd1 > input').change(function () {
    $('#monthBody tr').remove();
    const date = $(this).val().split('/');
    today = new Date(date[0], date[1] - 1, date[2]);
    buildCalendar();
  });

  buildCalendar();
});
