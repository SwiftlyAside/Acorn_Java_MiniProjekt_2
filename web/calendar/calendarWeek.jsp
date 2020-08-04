<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/week.css"/>
<div>
    <div class="row">
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>

        <div class="col text-center font-weight-bold">일요일</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center font-weight-bold">월요일</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center font-weight-bold">화요일</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center font-weight-bold">수요일</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center font-weight-bold">목요일</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center font-weight-bold">금요일</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center font-weight-bold">토요일</div>
        <div class="col col-md-auto"></div>

    </div>

    <div class="row">
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>

        <div id="sun" class="col text-center myWeek"></div>
        <div class="col col-md-auto"></div>

        <div id="mon" class="col text-center myWeek"></div>
        <div class="col col-md-auto"></div>

        <div id="tue" class="col text-center myWeek"></div>
        <div class="col col-md-auto"></div>

        <div id="wed" class="col text-center myWeek"></div>
        <div class="col col-md-auto"></div>

        <div id="thu" class="col text-center myWeek"></div>
        <div class="col col-md-auto"></div>

        <div id="fri" class="col text-center myWeek"></div>
        <div class="col col-md-auto"></div>

        <div id="sat" class="col text-center myWeek"></div>
        <div class="col col-md-auto"></div>

    </div>

    <div class="row">

        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>

        <div id="allDay0" class="col">종일 일정 줄</div>
        <div class="col col-md-auto"></div>

        <div id="allDay1" class="col"></div>
        <div class="col col-md-auto"></div>

        <div id="allDay2" class="col"></div>
        <div class="col col-md-auto"></div>

        <div id="allDay3" class="col"></div>
        <div class="col col-md-auto"></div>

        <div id="allDay4" class="col"></div>
        <div class="col col-md-auto"></div>

        <div id="allDay5" class="col"></div>
        <div class="col col-md-auto"></div>

        <div id="allDay6" class="col"></div>
        <div class="col col-md-auto"></div>
    </div>
    <div class="overflow-auto" style="max-height: 70vh">
        <div class="row">
            <div>
                <div class="text-right p-3">
                    <span>오전 0시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 1시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 2시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 3시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 4시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 5시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 6시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 7시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 8시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 9시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 10시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 11시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 12시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 1시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 2시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 3시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 4시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 5시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 6시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 7시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 8시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 9시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 10시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 11시</span>
                </div>
            </div>
            <div class="row">
                <div id="blankDiv" class="col"></div>
                <div id="blankDiv2" class="col"></div>
            </div>
            <div id="dayBlockDiv" class="col">
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/week.js"></script>
