<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/findForm.css" rel="stylesheet">
<%-- <script src="${pageContext.request.contextPath}/js/membershipForm.js"></script> --%>
<div class='container'>
	<form class="form-horizontal frm_find">
		<div class='form-group'>
			<input type='text' name='joinId' class='form-control col-md-auto stxt' id='txt_joinId' placeholder='ID 입력' />
		</div>
		<div class='form-group'>
			<div class='row'>
				<div class='col-md-8 find_auth'>
					<input type='email' name='joinEmail' class='form-control col-md-auto ltxt' id='txt_joinEmail' placeholder='Email 입력' />
				</div>
				<div class='col-md-4'>
					<input type='button' class='form-control btn btn-default find_sendBtn' value='발송' />
				</div>
			</div>
		</div>
		<div class='form-group' style='padding: 0px;'>
			<div class='row div_find_auth'>
				<div class='col-md-8 find_auth'>
					<input type='text' name='joinAuthNum' class='form-control col-md-auto stxt' id='txt_joinAuthNum' placeholder='인증번호' style='display: block;' />
				</div>
				<div class='col-md-4'>
					<input type='button' class='form-control btn btn-default find_authBtn' value='인증' />
				</div>
			</div>
		</div>
		<div class='form-group'>
			<div class='div_find_pass'>
				<input type='password' name='joinPass' class='form-control col-md-auto ltxt' id='txt_joinPass' placeholder='Password 입력' />
				<input type='password' name='joinPassOk' class='form-control col-md-auto ltxt' id='txt_joinPassOk' placeholder='Password 재입력' />
			</div>
		</div>
		<div class='form-group'>
			<div class='col'></div>
			<div class='col find_divbtn'>
				<input type='button' id='btn_submit' class='form-control btn btn-default find_submitbtn' value='O' />
			</div>
		</div>
	</form>
</div>