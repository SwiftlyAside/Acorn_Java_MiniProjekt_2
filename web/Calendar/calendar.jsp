<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="calendarBaseDiv">
    <div id="todayDiv">
        <input type="button" id="todayButton" value="오늘">
    </div>
    <div id="sd1" class="input-group date">
        <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
    </div>
    <div id="dateMoveDiv">
        <a href="<%--calendarform에 전달할 조건? 이벤트?--%>"><i class="fas fa-chevron-circle-left"></i></a>
        <a href=""><i class="fas fa-chevron-circle-right"></i></a>
    </div>
    <div id="changeCalendarForm">
        <input type="button" id="weekCalendar" value="주">
        <input type="button" id="monthCalendar" value="월">
    </div>
    <div id="makePlanDiv">
        <a><i class="fas fa-tasks"></i>일정 만들기</a>
    </div>
    <div id="makeTask">
        <a><i class="fas fa-stopwatch"></i>작업 기록하기</a>
    </div>
</div>
<div id="calendarForm"></div>
<script src="${pageContext.request.contextPath}/calendar/js/calendar.js"></script>

