$('#scroll').click(function () {
  console.log('컨텐츠 클릭');
  console.log($('#scroll').scrollTop());
});

// scroll이 클릭 됐을 때
// 게시된 div의 id --> 현재 height가 97px임, 97*n <= x < 97*(n+1) 일때의 div체크
// id가 갖고 있는 날짜를 가져와 띄우기.


var checkInScrollbar = function(mouseX){
  if( 230 <= mouseX && mouseX < 245){
    return true;
  }
}

$(document).mousedown(function(e){
  if( checkInScrollbar(e.clientX) ){
    $('#scrollData').text($('#scroll').scrollTop());
  }
});

document.addEventListener('mousemove', function (e) {
  if (checkInScrollbar(e.clientX)) {
    $('#scrollData').text($('#scroll').scrollTop());
  }
});