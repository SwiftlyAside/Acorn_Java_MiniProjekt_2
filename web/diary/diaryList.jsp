<%@page import="DTO.RecordsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="DAO.RecordsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/diaryList.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/diaryList.js"></script>

<div class="container nonPadding Dlist">
	<!-- Add-Button -->
	<div class="card" id='div_addarea'>
		<div class="card-header-addbtn" id="subheadingAdd" style="background-color: #FFF2CC; text-align: center; height: 60px;">
			<h5 class="mb-0">
				<a class="list-group-item list-group-item-action waves-effect" id="a_writePage" href="${pageContext.request.contextPath}/index.jsp?open=diaryWrite" style="background-color: #FFF2CC; padding: .75rem 1.25rem; border: 0px;">
             				<i class="expand-icon material-icons">add_circle</i>
				</a>
			</h5>
		</div>
	</div>
	<!-- Panel-Group -->
	<div class="panel-group Dlist_diaryList" id="accordion2">
		
	<!-- Card -->
	<%
		String userId = (String)session.getAttribute("userId");
	
		RecordsDAO recordsdao = RecordsDAO.getInstance();
		
		List<RecordsDTO> recordList = new ArrayList<RecordsDTO>();
		
		recordList = recordsdao.getDiary(userId, "order by recordDate desc");
		
		for(int i=0;i<recordList.size();i++){
	%>
		<div class="card">
			<div class="card-header" id="subheading<%=i %>" style="background-color: #D6E8C8;">
				<h5 class="mb-0">
					
					<button class="btn btn-link nonPadding" data-toggle="collapse" data-target="#subcollapse<%=i %>" aria-expanded="true" aria-controls="collapse<%=i %>">
						<p class="text-left nonMargin Dlist_title<%=i%>">
							<i class="expand-icon material-icons">add_circle</i>
						</p>
					</button>
				</h5>
			</div>

			<div id="subcollapse<%=i %>" class="collapse" aria-labelledby="subheading<%=i %>" data-parent="#accordion2">
				<div class="card-body">
					<p class="text-left Dlist_content<%=i%>">
					</p>
				</div>
				<div class='card-footer nonMargin row' style='padding: 5px;'>
					<div class='col-2 nonMargin'>
						<p class='text-center nonMargin Dlist_bg Dlist_weather<%=i%>'></p>
					</div>
					<div class='col-2 nonMargin'>
						<p class="text-center nonMargin Dlist_bg Dlist_condition<%=i%>"></p>
					</div>
					<div class='col-2 nonMargin'>
						<p class="text-center nonMargin Dlist_bg Dlist_geoInfo<%=i%>"></p>
					</div>
					<div class='col-4 nonMargin'></div>
					<div class='col-2 nonMargin'>
						<input class='btn Dlist_delbtn<%=i %>' type='button' value='X'/>
					</div>
				</div>
			</div>
		</div>
	<%} %>
	</div>
</div>