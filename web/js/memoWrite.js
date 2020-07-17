$(document).ready(function(){
	$('#Rwrite_okbtn').click(function(){
		if($('#Rwrite_txt_title').val() == ''){
			alert('제목을 입력!');
			return;
		}
		if($('.Rwrite_txt_txtarea').val() == ''){
			alert('내용을 입력!');
			return;
		}
		if($('.Rwrite_txt_txtarea').val().length < 10){
			alert('내용이 너무 짧습니다!(10자이상 입력!)');
			return;
		}
		var params = $('.frm_Rwrite').serialize();
		$.ajax({
			type : 'POST',
			url : '/memo/memoWriteProc.jsp',
			data : params,
			success : function(data){
				$('.Rwrite').append(data);
			}
		}).done(function(data) {
			$(location).attr('href', '/index.jsp?open=explorer');
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