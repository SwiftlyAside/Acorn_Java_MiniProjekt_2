<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/joinHeader.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/joinHeader.js"></script>
<div class="card-body" id="div_joinheader">
    <ul class="nav nav-tabs" id="myTab" role="tablist">  
        <li class="nav-item" style="font-size: 20px">
            <a class="nav-link active" id="loginForm-tab" data-toggle="tab" href="#loginForm" role="tab" aria-controls="loginForm"
               aria-selected="true"><i class="fas fa-compact-disc mr-2"></i>Login</a>
        </li>
        <li class="nav-item" style="font-size: 20px">
            <a class="nav-link" id="membershipForm-tab" data-toggle="tab" href="#membershipForm" role="tab" aria-controls="membershipForm"
               aria-selected="false"><i class="fas fa-book mr-2"></i>Membership</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="loginForm" role="tabpanel" aria-labelledby="loginForm-tab">
            <%--
            네비게이터 (날짜, 이름) (년도, 월, 일, 전체, (ASC, DESC))
            MediaDAO에 의해 정렬된 값 표시
            --%>
        </div>
        <div class="tab-pane fade" id="membershipForm" role="tabpanel" aria-labelledby="membershipForm-tab">
            <%--
            네비게이터 (날짜, 이름) (년도, 월, 전체 (ASC, DESC))
            RecordsDAO에 의해 정렬된 값 표시
            --%>
        </div>
    </div>
</div>