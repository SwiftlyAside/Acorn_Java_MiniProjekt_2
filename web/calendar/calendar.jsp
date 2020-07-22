<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">

<div id="calendarBaseDiv" class="card-header">
    <div class="row">
        <div id="todayDiv" class="col text-center my-auto">
            <button type="button" id="todayButton" class="btn btn-light-green lighten-1">오늘</button>
        </div>
        <div id="sd1" class="input-group date col my-auto" style="padding-top: 7px">
            <input type="text" class="form-control"><span class="input-group-addon"><h2>
            <i class="fas fa-calendar-alt"></i></h2></span>
        </div>
        <div id="dateMoveDiv" class="col my-auto text-center">
            <i id="left" class="fas fa-chevron-circle-left"></i>
            <i id="right" class="fas fa-chevron-circle-right"></i>
        </div>
        <div id="changeCalendarFormDiv" class="col-4 my-auto">
            <button type="button" id="weekCalendar" class="btn">주</button>
            <button type="button" id="monthCalendar" class="btn btn-light-green lighten-1">월</button>
        </div>
        <div id="makePlanDiv" class="col-2 my-auto text-right">
            <button type="button" class="btn btn-light-green lighten-1 btn-primary" data-toggle="modal"
                    data-target="#planModal">
                <span class="fas fa-tasks"></span>일정 만들기
            </button>
        </div>
        <div id="makeTaskDiv" class="col-2 my-auto">
            <button type="button" class="btn btn-light-green lighten-1 btn-primary" data-toggle="modal"
                    data-target="#taskModal">
                <span class="fas fa-stopwatch"></span>작업 기록하기
            </button>
        </div>
    </div>
</div>
<div id="calendarForm" class="card-body">
</div>


<!-- Central Modal -->
<!-- Plan Modal -->
<div class="modal fade" id="planModal" tabindex="-1" role="dialog" aria-labelledby="planModalLabel"
     aria-hidden="true">

    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog-centered modal-dialog" role="document">


        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100 text-center" id="planModalLabel">일정</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" id="planCloseIcon">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-3">
                <div class="md-form mb-5">
                    <input type="text" id="planTitle" class="form-control validate"/>
                    <label data-error="wrong" data-success="right" for="planTitle">일정 제목</label>
                </div>
                <div>
                    <textarea id="planContent" placeholder="내용" style="width: 436px; height: 320px"></textarea>
                </div>
                <div class="table">
                    <div class="row" style="height: 120px">
                        <div class="col md-form mb-5">
                            <div id="sd2" class="input-group date col my-auto" style="padding-top: 7px; padding-left: 0px; height: 70px">
                                <input type="text" id="planStartDate" class="form-control validate"><span
                                    class="input-group-addon"><h2><i class="fas fa-calendar-alt"></i></h2></span>
                                <label data-error="wrong" data-success="right" for="planStartDate">시작</label>
                            </div>
                            <div class="input-group date col my-auto" style="padding-top: 7px; padding-left: 0px; margin-top: -7px">
                                <input type="text" id="starTime" class="form-control validate">
                                <label data-error="wrong" for="starTime">시작시간</label>
                            </div>
                        </div>
                        <div class="col md-form mb-5">
                            <div id="sd3" class="input-group date col my-auto" style="padding-top: 7px; padding-left: 0px; height: 70px">
                                <input type="text" id="planEndDate" class="form-control validate"><span
                                    class="input-group-addon"><h2><i class="fas fa-calendar-alt"></i></h2></span>
                                <label data-error="wrong" data-success="right" for="planEndDate">종료</label>
                            </div>
                            <div class="input-group date col my-auto" style="padding-top: 7px; padding-left: 0px; margin-top: -7px">
                                <input type="text" id="endTime" class="form-control validate">
                                <label data-error="wrong" for="endTime">종료시간</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer flex-center">
                <button type="button" id="planWrite" class="btn btn-primary btn-sm" data-dismiss="modal">저장</button>
                <button type="button" id="planClose" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<!-- Task Modal -->
<div class="modal fade" id="taskModal" tabindex="-1" role="dialog" aria-labelledby="taskModalLabel"
     aria-hidden="true">

    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog-centered modal-dialog" role="document">


        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100 text-center" id="taskModalLabel">작업</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" id="taskClose" >&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="md-form mb-5">
                    <input type="text" id="taskTitle" class="form-control validate"/>
                    <label data-error="wrong" data-success="right" for="taskTitle">작업 제목</label>
                </div>
                <div>
                    <div class="timer" data-timer="0" style="width: 468px; height: 120px"></div>
                </div>
            </div>
            <div class="modal-footer flex-center">
                <button type="button" class="btn btn-primary btn-sm start">시작</button>
                <button type="button" class="btn btn-danger btn-sm stop">정지</button>
                <button type="button" class="btn btn-secondary btn-sm restart">다시 시작</button>
                <button type="button" id="taskWrite" class="btn btn-light-green btn-sm destroy" data-dismiss="modal">작업 기록</button>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/calendar.js"></script>
