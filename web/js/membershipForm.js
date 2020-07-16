$(document).ready(function(){
	
	//이름 체크
	$('input#txt_joinName').on('blur', function(){
		var name = $('input#txt_joinName').val();
		CheckName(name);
	})
	//아이디 체크
	$('input#txt_joinId').on('change', function(){
		var id = $("input#txt_joinId").val(); 
		$.ajax({
			type : 'POST',
			url : 'joinheader/jsonIds.jsp?userId=' + id,
			dataType : 'json',
			success : function(data, status){
				//console.log(data.boolean);
				CheckId(id, data.boolean);
			}
		});
		
	})
	//비밀번호 체크
	$('input#txt_joinPass').on('blur', function(){
		var pw = $('input#txt_joinPass').val();
		var pwok = $('input#txt_joinPassOk').val();
		ComparePwok(pw, pwok);
	});
	$('input#txt_joinPassOk').on('blur', function(){
		var pw = $('input#txt_joinPass').val();
		var pwok = $('input#txt_joinPassOk').val();
		ComparePwok(pw, pwok);
	});
	
	//이메일 체크
	$('.mem_sendBtn').on('click', function(){
		var email = $('input#txt_joinEmail').val();
		if(CheckEmail(email)){
			$('input#txt_joinAuthNum').css('display', 'block');
			$('input#txt_joinEmail').attr({'readonly' : 'readonly'});
			
			$('.mem_sendBtn').attr({'value' : '인증'});
			//인증번호 삽입
		}
	})
	$('input#btn_cancel').on('click', function(){
		history.back();
	})
	$('input#btn_submit').on('click', function(){
		var name = $('input#txt_joinName');
		var id = $("input#txt_joinId"); 
		var pw = $('input#txt_joinPass');
		var pwok = $('input#txt_joinPassOk');
		var email = $('input#txt_joinEmail');
		var auth = $('input#txt_joinAuthNum');
		
		if(!CheckName(name.val())){
			name.focus();
			return;
		}	
		//아이디중복확인
		$.ajax({
			type : 'POST',
			url : '/joinheader/jsonIds.jsp?userId=' + id.val(),
			dataType : 'json',
			success : function(data, status){
				//console.log(data.boolean);
				if(!CheckId(id.val(), data.boolean)){
					id.focus();
					return;
				}
			}
		});
		if(!ComparePwok(pw.val(), pwok.val())){
			pw.focus();
			return;
		}
		if(!CheckEmail(email.val())){
			email.focus();
			return;
		}
		if(auth.val() == ''){
			alert('인증번호 미입력!');
			return;
		}
		var params = $('.frm_membership').serialize();
		$.ajax({
			type : 'POST',
			url : '/joinheader/membershipProc.jsp',
			data : params,
			success : function(){
				alert('회원가입을 축하합니다.');
			},
			error : function(){
				console.log('회원가입 실패');
			}
		}).done(function(data) {
			$(location).attr('href', '/index.jsp');
		});
	})
})
function CheckName(name){
	var nameReg = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	if(!nameReg.test(name)){
		AlertLabel('#lbl_joinNameAlert', '이름형식이 아닙니다.', 'red');
		return false;
	}else{
		AlertLabel('#lbl_joinNameAlert', '', 'green');
	}
	return true;
}
function CheckId(id, data){
	var idReg = /^[a-z]+[a-z0-9]{4,19}$/g;
	if(!idReg.test(id)){
		AlertLabel('#lbl_joinIdAlert', '아이디 형식은 영문자 조합!', 'red');
		return false;
	}else if(data == 'true'){
		AlertLabel('#lbl_joinIdAlert', '중복된 아이디입니다.', 'red');
		return false;
	}else if (id == "") { 
		AlertLabel('#lbl_joinIdAlert', '아이디를 입력하세요.', 'red');
		return false;
	}else{
		AlertLabel('#lbl_joinIdAlert', '사용가능합니다', 'green');
	}
	return true;
}
function ComparePwok(pw, pwok){
	if(pw == ''){	
		AlertLabel('label#lbl_joinPassAlert', '비밀번호 입력!', 'red');
		return false;
	}
	if(pw.length < 4){
		AlertLabel('label#lbl_joinPassAlert', '비밀번호는 4자리 이상 입력!', 'red');
		return false;
	}
	if(pwok == pw){
		AlertLabel('label#lbl_joinPassAlert', '비밀번호가 일치합니다.', 'green');
		return true;
	}else{
		AlertLabel('label#lbl_joinPassAlert', '비밀번호가 서로 다릅니다.', 'red');
		return false;
	}
}
//라벨
function AlertLabel(id, text, color){
	$(id).html(text);
	$(id).css({'color' : color, 'font-size' : '12px'});
}
function CheckEmail(email){
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

	if (email == '' || !re.test(email)) {
		AlertLabel('label#lbl_joinEmailAlert', '이메일 형식을 맞춰주세요', 'red');
		return false;
	}
	AlertLabel('label#lbl_joinEmailAlert', '알맞는 이메일형식', 'green');
	return true;
}
function CheckAuth(){
	
}
/*function getSHA512(str){
	
	MessageDigest md = MessageDigest.getInstance("SHA-512");
	md.update(str.getBytes());
	String hex = String.format("%0128x", Integer.toHexString(0xff & md.digest()));
	
	return hex;
}*/
