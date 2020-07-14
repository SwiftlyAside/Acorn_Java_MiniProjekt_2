// scroll이 클릭 됐을 때
// 게시된 div의 id --> 현재 height가 97px임, 97*n <= x < 97*(n+1) 일때의 div체크
// id가 갖고 있는 날짜를 가져와 띄우기.

// tooltip setting
const $scroller = $('#scroll');
$(() => {
  $scroller.tooltip({ /* boundary: 'window' */});
});
$scroller.attr('data-placement', 'right');

// tooltip scroll handle
$('.myScroll').on('scroll', $.throttle(125, () => {
  $scroller.attr('data-original-title', `${$scroller.scrollTop()}`);
  $scroller.tooltip('show');
}));
