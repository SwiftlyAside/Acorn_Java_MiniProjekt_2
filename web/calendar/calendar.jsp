<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">

<div id="calendarBaseDiv" class="card-header">
    <div class="row">
        <div id="todayDiv" class="col text-center my-auto">
            <button type="button" id="todayButton" class="btn btn-light-green lighten-1">오늘</button>
        </div>
        <div id="sd1" class="input-group date col my-auto" style="padding-top: 7px">
            <input type="text" class="form-control"><span class="input-group-addon"><h2><i class="fas fa-calendar-alt"></i></h2></span>
        </div>
        <div id="dateMoveDiv" class="col my-auto text-center">
            <a href="<%--a태그는 새 요청, ajax?--%>"><i class="fas fa-chevron-circle-left"></i></a>
            <a href=""><i class="fas fa-chevron-circle-right"></i></a>
        </div>
        <div id="changeCalendarFormDiv" class="col-4 my-auto">
            <button type="button" id="weekCalendar" class="btn">주</button>
            <button type="button" id="monthCalendar" class="btn btn-light-green lighten-1">월</button>
        </div>
        <div id="makePlanDiv" class="col-2 my-auto text-right">
            <button type="button" class="btn btn-light-green lighten-1"><span class="fas fa-tasks"></span>일정 만들기</button>
        </div>
        <div id="makeTaskDiv" class="col-2 my-auto">
            <button type="button" class="btn btn-light-green lighten-1"><span class="fas fa-stopwatch"></span>작업 기록하기</button>
        </div>
    </div>
</div>
<div id="calendarForm" class="card-body">
</div>

<script src="${pageContext.request.contextPath}/js/calendar.js"></script>

