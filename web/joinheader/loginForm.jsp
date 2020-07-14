<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/loginForm.css" rel="stylesheet">
<div class='container'>
	<form class="form-horizontal frm_login">
		<div class='form-group'>
			<input type='text' name='id' class="form-control col-md-auto txt" placeholder='ID 입력'/>
		</div>
		<div class='form-group'>
			<input type='password' name='pass' class="form-control col-md-auto txt" placeholder='Password 입력' />
			<input type='button' class='btn btn-link' value='forget password?' />
		</div>
		<div class='form-group'>
			<input type='button' value='GO' class="form-control btn btn-default btn_submit" />
		</div>
	</form>
</div>