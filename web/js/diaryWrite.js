$(document).ready(function(){
	var time = getCurrentTime();
	//console.log(time);
	//document.getElementById('Dwrite_time').innerHTML = time;
	$('#Dwrite_time').html(time);
	
	$('#Dwrite_okbtn').click(function(){
		console.log($('#Dwrite_txt_title').val());
		console.log($('.Dwrite_txt_txtarea').val());
		if($('#Dwrite_txt_title').val() == ''){
			alert('제목을 입력!');
			return;
		}
		if($('.Dwrite_txt_txtarea').val() == ''){
			alert('내용을 입력!');
			return;
		}
		if($('.Dwrite_txt_txtarea').val().length < 10){
			alert('내용이 너무 짧습니다!(10자이상 입력!)');
			return;
		}
		$mainContainer.load('/diary/diaryList.jsp');
		//$('.frm_Dwrite').attr('action', '/index.jsp?open=diary').submit();
	});
	
	//썸머노트
	$('#summernote').summernote({
		placeholder: '내용 입력',
		tabsize: 1,
		height: 350,
		lang: 'ko-KR',
		focus: true,
		toolbar: [
			['style', ['style']],
			['font', ['bold', 'underline', 'clear']],
			['color', ['color']],
			['para', ['ul', 'ol', 'paragraph']],
			['table', ['table']],
			['insert', ['link', 'picture', 'video']],
			['view', ['fullscreen', 'codeview', 'help']]
	   ]
	});
})
function getCurrentTime() {
	var date = new Date();
	var str = date.getFullYear()+'년 ';
	str += (date.getMonth()+1)+'월 ';
	str += date.getDate()+'일 ';
	str += whatDay(date.getDay())+'요일 ';
	return str;
}
function whatDay(day) {
	let dayArr = ['일', '월', '화', '수', '목', '금', '토'];
	return dayArr[day];
}