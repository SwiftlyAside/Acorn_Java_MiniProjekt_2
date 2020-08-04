$(document).ready(() => {
  const days = [0, 1, 2, 3, 4, 5, 6];

  $('#todayButton').unbind('click');
  $('#right').unbind('click');
  $('#left').unbind('click');
  $('#sd1 > input').unbind('change');
  $('#makePlanDiv > button').unbind('click');
  $('#makeTaskDiv > button').unbind('click');

  let today = new Date();
  let currentMonth = today.getMonth();
  let currentMonthLastDate = new Date(today.getFullYear(), currentMonth + 1, 0);
  const currentDay = today.getDay();
  let startDate = today.getDate() - today.getDay();

  const getPlan = function f(source) {
    $.ajax({
      type: 'POST',
      url: '/calendar/calendarController.jsp?target=week',

      dataType: 'json',

      data: {
        currentWeek: source,
      },

      success(json) {
        /* 1. 시간으로 위치 찾고
        2. 요일 idx로 위치 찾자. */
        // 시간 위치: 임시로 0시
        const planDays = [];
        for (const i in json) {
          const idx = json[i].startTime.substring(8, 10) < 10 ? 9 : 8;
          planDays[i] = json[i].startTime.substring(idx, 10);
        }
        console.log(planDays);

        for (const day in planDays) {
          $(`#day0h_${planDays[day]}`).append(`<li id="${json[day].no}">${json[day].title}</li>`);
          $(`#day0h_${planDays[day]}`).click(() => {
            alert(`${json[day].content}`);
          });
        }
      },

      error(html) {
        alert('관리자에게 문의하세요');
      },
    });
  };

  function todayWeek(dateArr) {
    $('.myWeek').each(function (idx, arr) {
      arr = dateArr;
      $(this).html(arr[idx]);

      /* if (idx == today.getDay() && $(this).html() == today.getDate())
        $(this).css('background-color', '#A9F5A9');
      else
        $(this).css('background-color', ''); */
    });

    $('#sd1 > input').val(`${today.getFullYear()}/${currentMonth + 1}/${dateArr[0]}`);
    $('#sd1').datepicker('update', `${today.getFullYear()}/${currentMonth + 1}/${dateArr[0]}`);

    const source = `${currentMonth + 1}-${dateArr[0]}`;
    makeDayDiv(dateArr);
    getPlan(source);
  }

  function nextWeek() {
    startDate += 7;
    const tempCurrentLastDate = currentMonthLastDate.getDate();
    if (startDate > currentMonthLastDate.getDate()) {
      currentMonth += 1;
      if (currentMonth > 11) { /* 다음 연도로 넘어갈 때 */
      }
      currentMonthLastDate = new Date(today.getFullYear(), currentMonth + 1, 0);
      if (tempCurrentLastDate !== currentMonthLastDate.getDate()) {
        startDate -= tempCurrentLastDate;
      } else {
        startDate -= currentMonthLastDate.getDate();
      }
    }
    todayWeek(showDateArr(startDate));
  }

  function prevWeek() {
    startDate -= 7;
    if (startDate <= 0) {
      currentMonth -= 1;
      if (currentMonth < 0) { /* 이전 연도로 넘어갈 때 */
      }
      currentMonthLastDate = new Date(today.getFullYear(), currentMonth + 1, 0);
      startDate += currentMonthLastDate.getDate();
    }
    todayWeek(showDateArr(startDate));
  }

  function showDateArr(startDate) {
    const dateArr = [];
    for (const val of days) {
      dateArr.push(startDate + val);
    }

    dateArr.forEach((value, index, array) => {
      if (value > currentMonthLastDate.getDate()) {
        array[index] -= currentMonthLastDate.getDate();
      }
    });

    return dateArr;
  }

  let makeDayDiv = function (dateArr) {
    const dayBlockDiv = $('#dayBlockDiv');
    dayBlockDiv.html('');
    for (let hour = 0; hour < 24; hour += 1) {
      dayBlockDiv.append(`<div id=day${hour}h_ class='row'></div>`);
      for (let day = 0; day < 7; day += 1) {
        $(`#day${hour}h_`).append(`<div id=day${hour}h_${dateArr[day]} class='col'></div>`);
      }
    }
  };

  $('#todayButton').click(() => {
    const today = new Date();
    currentMonth = today.getMonth();
    startDate = today.getDate() - today.getDay();
    todayWeek(showDateArr(startDate));
  });

  $('#right').click(() => {
    nextWeek();
  });

  $('#left').click(() => {
    prevWeek();
  });

  $('#sd1 > input').change(function () {
    const date = $(this).val().split('/');
    today = new Date(date[0], date[1] - 1, date[2]);
    currentMonth = today.getMonth();
    currentMonthLastDate = new Date(today.getFullYear(), currentMonth + 1, 0);
    startDate = today.getDate() - today.getDay();
    if (startDate <= 0) {
      currentMonth -= 1;
      currentMonthLastDate = new Date(today.getFullYear(), currentMonth + 1, 0);
      startDate += currentMonthLastDate.getDate();
    }
    todayWeek(showDateArr(startDate));
  });

  todayWeek(showDateArr(startDate));
});
