/*function getPosition() {
//스크롤 총 높이
  var t = $('#scroll').scrollHeight;
//현재 스크롤 위치
  t = t + ',' + $('#scroll').scrollTop;
//위치를 뿌려준다
  console.log(t);
}*/
console.log($('#scroll').scrollHeight);
console.log($('#scroll').scroll().scrollHeight);
console.log($('#scroll').scrollTop);

/*$('#scroll').addEventListener("scroll", function () {
  console.log($(this).scrollTop);

})*/
$('#scroll').click(function () {
  console.log('컨텐츠 클릭');
});