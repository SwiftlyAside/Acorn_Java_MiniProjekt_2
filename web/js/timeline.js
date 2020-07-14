// scroll이 클릭 됐을 때
// 게시된 div의 id --> 현재 height가 97px임, 97*n <= x < 97*(n+1) 일때의 div체크
// id가 갖고 있는 날짜를 가져와 띄우기.

var checkInScrollbar = function(mouseX){
  if( 23 <= mouseX && mouseX < 245){
    return true;
  }
}

// tooltip setting
$(function () {
  $('#scroll').tooltip({ /*boundary: 'window'*/})
})
$('#scroll').attr('data-placement', 'right');

// tooltip scroll handel
var limit = -1; // or 0

$('.myScroll').on('scroll',function () {
  if (limit == 0) {
    return;
  }

  limit = -1;

  $('#scroll').attr('data-original-title', `${$('#scroll').scrollTop()}`);
  $('#scroll').tooltip('show');

  setTimeout(function () {
    limit = 0;
  }, 250);

  // let type = $(this).index();
  // console.log(type);
});