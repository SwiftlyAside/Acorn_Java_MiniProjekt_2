$(document).ready(function(){
	
	//이름 체크
	$('input#txt_joinName').on('blur', function(){
		var name = $('input#txt_joinName').val();
		var nameReg = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		if(!nameReg.test(name)){
			AlertLabel('#lbl_joinIdAlert', '이름형식이 아닙니다.', 'red');
		}
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
					var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
					if(!idReg.test(id)){
						AlertLabel('#lbl_joinIdAlert', '아이디 형식은 영문자 조합!', 'red');
					}else if(data.boolean == 'true'){
						AlertLabel('#lbl_joinIdAlert', '중복된 아이디입니다.', 'red');
					}else if (id == "") { 
						AlertLabel('#lbl_joinIdAlert', '아이디를 입력하세요.', 'red');
					}else{
						AlertLabel('#lbl_joinIdAlert', '사용가능합니다', 'green');
					}
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
		}
	})

function ComparePwok(pw, pwok){
	if(pw == ''){	
		AlertLabel('label#lbl_joinPassAlert', '비밀번호 입력!', 'red');
		return;
	}
	if(pw.length < 4){
		AlertLabel('label#lbl_joinPassAlert', '비밀번호는 4자리 이상 입력!', 'red');
		return;
	}
	if(pwok == pw){
		AlertLabel('label#lbl_joinPassAlert', '비밀번호가 일치합니다.', 'green');
	}else{
		AlertLabel('label#lbl_joinPassAlert', '비밀번호가 서로 다릅니다.', 'red');
	}
}
function AlertLabel(id, text, color){
	$(id).html(text);
	$(id).css({'color' : color, 'font-size' : '12px'});
}
function CheckEmail(email){
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

	if (email == '' || !re.tesst(email)) {
		AlertLabel('label#lbl_joinEmailAlert', '이메일 형식을 맞춰주세요', 'red');
		return false;
	}
	AlertLabel('label#lbl_joinEmailAlert', '알맞는 이메일형식', 'green');
	return true;
}
function getSHA512(str){
	
	MessageDigest md = MessageDigest.getInstance("SHA-512");
	md.update(str.getBytes());
	String hex = String.format("%0128x", Integer.toHexString(0xff & md.digest()));
	
	return hex;
}
}