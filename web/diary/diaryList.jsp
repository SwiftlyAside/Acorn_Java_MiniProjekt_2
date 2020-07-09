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
<style>
	.material-icons {
	vertical-align: middle;
	margin-right: 1em;
	}
	.btn{	padding: 0px;}
	.card-body{ min-height: 300px;}
	div.container{padding: 0px;}
</style>
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script> -->

<script>
$(function () {
	function toggleOpen(e) {
		$(e.target)
			.prev('.card-header')
			.find(".expand-icon")
			.text("remove_circle");
	}
	function toggleClose(e) {
		$(e.target)
			.prev('.card-header')
			.find(".expand-icon")
			.text("add_circle");
	}
	$('.panel-group').on('hidden.bs.collapse', toggleClose);
	$('.panel-group').on('shown.bs.collapse', toggleOpen);
});
</script>
</head>
<body>
<div class="container">
		<!-- Add-Button -->
		<div class="card" style="">
				<div class="card-header" id="subheadingAdd" style="background-color: #dd9; text-align: center; size: 100px;">
					<h5 class="mb-0">
						<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#subcollapseAdd" aria-expanded="false" aria-controls="subcollapseAdd">
							<i class="expand-icon material-icons">add_circle</i>
						</button>
					</h5>
				</div>
		</div>
	<!-- Panel-Group -->
	<div class="panel-group" id="accordion2">
		
	<!-- Card -->
	<%
		String userId = "sglee";
		//String userId = (String)session.getAttribute("userId");
	
		RecordsDAO records = new RecordsDAO();
		
		List<Map<String, String>> recordList = new ArrayList<Map<String, String>>();
		
		recordList = records.getDiaryList(userId);
		
		for(int i=0;i<recordList.size();i++){
			Map<String, String> recordMap = recordList.get(i);
	%>
		<div class="card">
			<div class="card-header" id="subheading<%=i %>" style="background-color: #cdb;">
				<h5 class="mb-0">
					<button class="btn btn-link" data-toggle="collapse" data-target="#subcollapse<%=i %>" aria-expanded="true" aria-controls="collapse<%=i %>">
						<i class="expand-icon material-icons">add_circle</i>
						<label style="text-align: left;"><%=recordMap.get("recordDate") %></label>&nbsp;&nbsp;&nbsp;
                        <label style="text-align: center;"><%=recordMap.get("title") %></label>&nbsp;&nbsp;&nbsp;
					</button>
				</h5>
			</div>

			<div id="subcollapse<%=i %>" class="collapse" aria-labelledby="subheading<%=i %>" data-parent="#accordion2">
				<div class="card-body">
					<%=recordMap.get("content") %>
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
