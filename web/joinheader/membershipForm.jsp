<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/membershipForm.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/membershipForm.js"></script>
<div class='container'>
	<form class="form-horizontal frm_membership">
		<div class='form-group'>
			<input type='text' name='userName' class='form-control col-md-auto stxt' id='txt_joinName' placeholder='이름 입력' />
			<label id='lbl_joinNameAlert'></label>
		</div>
		<div class='form-group'>
			<input type='text' name='userId' class='form-control col-md-auto stxt' id='txt_joinId' placeholder='ID 입력' />
			<label id='lbl_joinIdAlert'></label>
		</div>
		<div class='form-group'>
			<input type='password' name='userPass' class='form-control col-md-auto ltxt' id='txt_joinPass' placeholder='Password 입력' />
			<input type='password' name='joinPassOk' class='form-control col-md-auto ltxt' id='txt_joinPassOk' placeholder='Password 재입력' />
			<label id='lbl_joinPassAlert'></label>
		</div>
		<div class='form-group' style='margin-bottom: 0px;'>
			<input type='email' name='userEmail' class='form-control col-md-auto ltxt' id='txt_joinEmail' placeholder='Email 입력' />
			<label id='lbl_joinEmailAlert'></label>
		</div>
		<div class='form-group' style='padding: 0px;'>
			<div class='row'>
				<div class='col-md-8 mem_auth' style='padding: 0px;'>
					<input type='text' name='joinAuthNum' class='form-control col-md-auto stxt' id='txt_joinAuthNum' placeholder='인증번호' style='display: none;' />
				</div>
				<div class='col-md-4'>
					<input type='button' class='form-control btn btn-default btn_member mem_sendBtn' value='보내기' />
				</div>
			</div>
		</div>
		<div class='form-group'>
			<div class='col'></div>
			<div class='col mem_divbtn'>
				<input type='button' id='btn_cancel' class='form-control btn btn-default btn_member' value='X' />
				<input type='button' id='btn_submit' class='form-control btn btn-default btn_member' value='O' />
			</div>
		</div>
	</form>
</div>