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
	})
	$('input#login_findbtn').on('click', function(){
		$('.login_container').load('/joinheader/joinHeaderController.jsp?target=findForm');
	})
})