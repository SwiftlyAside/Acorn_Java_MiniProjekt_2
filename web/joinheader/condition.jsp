<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.condition{
		width: 500px;
		border: 2px solid;
		padding: 10px;
		box-sizing: border-box;
	}
	img{ width: 50px;}
	div.con_title{
		text-align: center;
		
	}
	div.con_radio{
		width: 500px;
		text-align: center;
	}
</style>
</head>
<body>
	<div class='container condition'>
		<div class='row con_title'>
			<div class='col'>
				<h3>환영합니다. 000님</h3>
			</div>
		</div><br/>
		<div class='row con_qus'>
			<div class='col'>오늘 기분은 어떤가요?</div>
		</div><br/>
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
		<div class='row'>
			<div class='col'>
				<ins>넘어가겠습니다.</ins>
			</div>
			<div class='col' style="text-align: right;">
				<input type='button' value='제출' />
			</div>
		</div>
		
	</div>
</body>
</html>