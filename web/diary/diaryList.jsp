<%@page import="DTO.RecordsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="DAO.RecordsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/diaryList.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/diaryList.js"></script>
</head>
<body>
<div class="container">
		<!-- Add-Button -->
		<div class="card" style="">
				<div class="card-header" id="subheadingAdd" style="background-color: #dd9; text-align: center; size: 100px;">
					<h5 class="mb-0">
						<a class="list-group-item list-group-item-action waves-effect" id="a_writePage" href="?open=diaryWrite" style="background-color: #dd9; border: 0px;">
               				<i class="expand-icon material-icons">add_circle</i>
						</a>
					</h5>
				</div>
		</div>
	<!-- Panel-Group -->
	<div class="panel-group" id="accordion2">
		
	<!-- Card -->
	<%
		String userId = "sglee";
		//String userId = (String)session.getAttribute("userId");
	
		RecordsDAO recordsdao = new RecordsDAO();
		
		List<RecordsDTO> recordList = new ArrayList<RecordsDTO>();
		
		recordList = recordsdao.getDiary(userId, "order by recordDate desc");
		
		for(int i=0;i<recordList.size();i++){
			RecordsDTO recordsdto = recordList.get(i);
	%>
		<div class="card">
			<div class="card-header" id="subheading<%=i %>" style="background-color: #cdb;">
				<h5 class="mb-0">
					<button class="btn btn-link" data-toggle="collapse" data-target="#subcollapse<%=i %>" aria-expanded="true" aria-controls="collapse<%=i %>">
						<i class="expand-icon material-icons">add_circle</i>
						<label style="text-align: left;"><%=recordsdto.getRecordDate() %></label>&nbsp;&nbsp;&nbsp;
                        <label style="text-align: center;"><%=recordsdto.getTitle() %></label>&nbsp;&nbsp;&nbsp;
					</button>
				</h5>
			</div>

			<div id="subcollapse<%=i %>" class="collapse" aria-labelledby="subheading<%=i %>" data-parent="#accordion2">
				<div class="card-body">
					<%=recordsdto.getContent() %>
				</div>
			</div>
		</div>
	<%} %>
		<!-- <div class="card">
			<div class="card-header" id="subheadingTwo">
				<h5 class="mb-0">
					<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#subcollapseTwo" aria-expanded="false" aria-controls="subcollapseTwo">
						<i class="expand-icon material-icons">add_circle</i>Collapsible Group Item #2
					</button>
				</h5>
			</div>
			<div id="subcollapseTwo" class="collapse" aria-labelledby="subheadingTwo" data-parent="#accordion2">
				<div class="card-body">
					Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-header" id="subheadingThree">
				<h5 class="mb-0">
					<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#subcollapseThree" aria-expanded="false" aria-controls="subcollapseThree">
						<i class="expand-icon material-icons">add_circle</i>Collapsible Group Item #3
					</button>
				</h5>
			</div>
			<div id="subcollapseThree" class="collapse" aria-labelledby="subheadingThree" data-parent="#accordion2">
				<div class="card-body">
					Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
				</div>
			</div>
		</div> -->
	</div>
</div>
</body>
</html>
