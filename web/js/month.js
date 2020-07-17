$(document).ready(function () {

  $('#todayButton').unbind('click');
  $('#right').unbind('click');
  $('#left').unbind('click');
  $('#sd1 > input').unbind('change');
  $('#makePlanDiv > button').unbind('click');
  $('#makeTaskDiv > button').unbind('click');

  // overflow 적용 func
  var overFn = function () {
    $('#monthBody tr div[id]').attr('class', 'overflow-auto');
  }

  let getPlan = function f() {
    $.ajax({
      type: 'POST',

      url: '/calendar/calendarController.jsp?target=month',

      data: {
        currentDate: today.getTime()
      },

      dataType: 'json',

      success(json) {
        let data = [];
        for (let i in json)
          if ( json[i][3].split('-')[3] < 10)
            data.push(json[i][3].split('-')[2].substring(1,2));
          else
            data.push(json[i][3].split('-')[2]);

        console.log(data);

        for (let i = 0; i < json.length; i++) {
          console.log(data[i]);
          $(`#${data[i]}`).append(`<li id="${json[i][0]}">${json[i][1]}</li>`);
          $(`#${data[i]} > [id=${json[i][0]}]`).click(function () {
            alert(`내용 : ${json[i][2]}`);
          });
        }

      },

      error(html) {
        alert('오류가 있습니다ㅠㅠㅠ 관리자에게 문의하세요!');
      }
    })
  }

// 오늘 날짜
// 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
  var today = new Date();

// today의 Date를 세어주는 역할
  var date = new Date();

//이전 달
  function prevCalendar() {

    today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
    buildCalendar(); //달력 cell 만들어 출력
  }

//다음 달
  function nextCalendar() {

    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());

    buildCalendar();
  }

  function buildCalendar() {
    var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
    var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
    var tbCalendar = document.getElementById("monthBody");

    $('#sd1>input').val(today.getFullYear() + "/" + (today.getMonth() + 1) + "/" + today.getDate());

    while (tbCalendar.rows.length > 2) {
      //열을 지워줌
      //기본 열 크기는 body 부분에서 2로 고정되어 있다.
      tbCalendar.deleteRow(tbCalendar.rows.length - 1);
      //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지
      //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
    }
    var row = null;
    row = tbCalendar.insertRow();
    //테이블에 새로운 열 삽입//즉, 초기화
    var cnt = 0;// count, 셀의 갯수를 세어주는 역할
    // 1일이 시작되는 칸을 맞추어 줌
    for (let i = 0; i < doMonth.getDay(); i++) {
      /*이번달의 day만큼 돌림*/
      row.insertCell();//열 한칸한칸 계속 만들어주는 역할
      cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
    }
    /*달력 출력*/
    for (let i = 1; i <= lastDate.getDate(); i++) {
      //1일부터 마지막 일까지 돌림
      let cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
      cell.innerHTML = '<div>' + i + '</div>' + '<div id=' + i + '>' + '</div>';//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
      cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
      if (cnt % 7 == 1) {/*일요일 계산*/
        //1주일이 7일 이므로 일요일 구하기
        //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
        cell.innerHTML = '<div>' + "<font color=#F79DC2>" + i + '</font></div>' + '<div id=' + i + '>' + '</div>';
        //1번째의 cell에만 색칠
      }
      if (cnt % 7 == 0) {/* 1주일이 7일 이므로 토요일 구하기*/
        //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
        cell.innerHTML = '<div>' + "<font color=skyblue>" + i + '</font></div>' + '<div id=' + i + '>' + '</div>';
        //7번째의 cell에만 색칠
        row = tbCalendar.insertRow();
        //토요일 다음에 올 셀을 추가
      }
      /*오늘의 날짜에 노란색 칠하기*/
      if (today.getFullYear() == date.getFullYear()
        && today.getMonth() == date.getMonth()
        && i == date.getDate()) {
        //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
        cell.bgColor = "#9FF781";//셀의 배경색
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
  })
  $('#right').click(() => {
    $('#monthBody tr').remove();
    nextCalendar();
    $('#sd1').datepicker('update', today);
  })
  $('#left').click(() => {
    $('#monthBody tr').remove();
    prevCalendar();
    $('#sd1').datepicker('update', today);
  })
// datepicker attach calendar
  $('#sd1 > input').change(function () {
    $('#monthBody tr').remove();
    let date = $(this).val().split('/');
    today = new Date(date[0], date[1] - 1, date[2]);
    buildCalendar();
  })

  buildCalendar();
})

