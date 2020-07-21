<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/condition.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/condition.js"></script>
</head>
<body>
	<div class='container con_div'>
		<div class='row con_title'>
			<div class='col'>
				<h3>환영합니다. 000님</h3>
			</div>
		</div><br/>
		<div class='row con_qus'>
			<div class='col'>오늘 기분은 어떤가요?</div>
		</div><br/>
		<form class='frm_con'>
		<div class='row radio con_radio'>
			<div class='col'>
				<label>
					<img src='/img/con_fine.png' alt=''/>
					<br/>
					<input type='radio' name='condition' value='fine'/>
					Fine
				</label>
			</div>
			<div class='col'>
				<label>
					<img src='/img/con_good.png' alt=''/>
					<br/>
					<input type='radio' name='condition' value='good'/>
					Good
				</label>
			</div>
			<div class='col'>
				<label>
					<img src='/img/con_soso.png' alt=''/>
					<br/>
					<input type='radio' name='condition' value='soso'/>
					So-so
				</label>
			</div>
			<div class='col'>
				<label>
					<img src='/img/con_bad.png' alt=''/>
					<br/>
					<input type='radio' name='condition' value='bad'/>
					Bad
				</label>
			</div>
			<div class='col'>
				<label>
					<img src='/img/con_angry.png' alt=''/>
					<br/>
					<input type='radio' name='condition' value='angry'/>
					Angry
				</label>
			</div>
		</div><br/>
		</form>
		<div class='row'>
			<div class='col'>
				<a href="/index.jsp"><ins>넘어가겠습니다.</ins></a>
			</div>
			<div class='col' style="text-align: right;">
				<input class='btn condition_btn' type='button' value='제출' />
			</div>
		</div>
		
	</div>
</body>
</html>