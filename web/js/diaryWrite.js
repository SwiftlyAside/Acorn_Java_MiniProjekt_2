$(document).ready(function(){
	var time = getCurrentTime();
	$('#Dwrite_time').html("<p class='header text-left Dwrite_headerPadding'>" + time + "</p>");
	
	navigator.geolocation.getCurrentPosition((position) => {
		var lat = position.coords.latitude;
		var lon = position.coords.longitude;
		$('.frm_Dwrite').append("<input type='hidden' name='geoInfo' value='" + position.coords + "' />");	//전달값
		var weatherUrl = 'http://api.openweathermap.org/data/2.5/weather?lat=' + lat + '&lon=' + lon + '&appid=dd584ccaea0405b403b4ade0ef7e5e9c';
		
		/* data.weather[0]
		 * .main -> 날씨
		 * .icon -> 아이콘
		 * */
		$.ajax({
			type : 'POST',
			url : weatherUrl,
			dataType : 'json',
			success : function(data, status){
				$('.Dwrite_weather').html(data.weather[0].main + "<img class='img_weather' src='http://openweathermap.org/img/wn/" 
						+ data.weather[0].icon + "@2x.png'>");
				$('.frm_Dwrite').append("<input type='hidden' name='weather' value='" + data.weather[0] + "' />");	//전달값
			}
		})
	});
	$('#Dwrite_okbtn').click(function(){
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
		var params = $('.frm_Dwrite').serialize();
		$.ajax({
			type : 'POST',
			url : '/diary/diaryWriteProc.jsp',
			data : params,
			success : function(data){
				$('.Dwrite').append(data);
			}
		}).done(function(data) {
			$(location).attr('href', '/index.jsp?open=diary');
		});
		
	});
	
	//썸머노트
	$('#summernote').summernote({
		placeholder: '내용 입력',
		tabsize: 1,
		height: 350,
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
	$('.frm_Dwrite').append("<input type='hidden' name='recordDate' value='" 
			+ date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate()
			+ "' />");	//전달값
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