$(document).ready(function(){
	$('input#login_btn').on('click', function(){
		
		if($('input#login_id').val() == ''){
			$('input#login_id').focus();
			alert('아이디를 입력');
			return;
		}else if($('input#login_pass').val() == ''){
			$('input#login_pass').focus();
			alert('비밀번호를 입력');
			return;
		}
		var params = $('.frm_login').serialize();
		$.ajax({
			type : 'POST',
			url : '/joinheader/loginProc.jsp',
			data : params,
			dataType : 'json',
			success : function(data){
				if(data.boolean == 'true'){
					alert(params.userId + '님 환영합니다.')
					$(location).attr('href', '/index.jsp');
				}else{
					alert('로그인 실패입니다.')
					$(location).attr('href', '/index.jsp?open=login');
				}
			},
			error : function(){
				console.log('로그인 실패');
			}
		}).done(function(data) {
			
		});
	})
	$('input#login_findbtn').on('click', function(){
		$('.login_container').load('/joinheader/joinHeaderController.jsp?target=findForm');
	})
})