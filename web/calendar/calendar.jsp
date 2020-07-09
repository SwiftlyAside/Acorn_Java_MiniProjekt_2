<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">

<div id="calendarBaseDiv" class="card-header">
    <div class="row">
        <div id="todayDiv" class="col text-center my-auto">
            <input type="button" id="todayButton" value="오늘">
        </div>
        <div id="sd1" class="input-group date col my-auto">
            <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
        </div>
        <div id="dateMoveDiv" class="col my-auto text-center">
            <a href="<%--a태그는 새 요청, ajax?--%>"><i class="fas fa-chevron-circle-left"></i></a>
            <a href=""><i class="fas fa-chevron-circle-right"></i></a>
        </div>
        <div id="changeCalendarFormDiv" class="col-5 my-auto">
            <input type="button" id="weekCalendar" value="주">
            <input type="button" id="monthCalendar" value="월">
        </div>
        <div id="makePlanDiv" class="col my-auto text-right">
            <a><i class="fas fa-tasks"></i>일정 만들기</a>
        </div>
        <div id="makeTaskDiv" class="col my-auto">
            <a><i class="fas fa-stopwatch"></i>작업 기록하기</a>
        </div>
    </div>
</div>
<div id="calendarForm" class="card-body">
is testing for changing directory name
</div>

<script src="${pageContext.request.contextPath}/js/calendar.js"></script>

