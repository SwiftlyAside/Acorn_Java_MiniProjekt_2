<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id='div_membershipForm'>
	<div id='div_joinName'>
		<input type='text' name='joinName' id='txt_joinName' placeholder='이름 입력' />
		<br/>
		<label id='lbl_joinNameAlert'></label>
	</div>
	<div id='div_joinId'>
		<input type='text' name='joinId' id='txt_joinId' placeholder='ID 입력' />
	</div>
	<div id='div_joinPass'>
		<input type='password' name='joinPass' id='txt_joinPass' placeholder='Password 입력' />
		<br/>
		<input type='password' name='joinPassOk' id='txt_joinPassOk' placeholder='Password확인 입력' />
		<br/>
		<label id='lbl_joinPassAlert'></label>
	</div>
	<div id='div_joinEmail'>
		<input type='text' name='joinEmail' id='txt_joinEmail' placeholder='Email 입력' />
	</div>
	<div id='div_joinAuthNum'>
		<input type='text' name='joinAuthNum' id='txt_joinAuthNum' placeholder='인증번호 입력' />
	</div>
	<div id='div_joinBtns'>
		<input type='button' id='btn_cancel' value='X' />
		<input type='button' id='btn_submit' value='O' />
	</div>
</div>