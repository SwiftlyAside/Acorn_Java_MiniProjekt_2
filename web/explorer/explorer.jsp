<%--
  Date: 2020-07-08
  Time: 오전 10:35
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<script src="${pageContext.request.contextPath}/js/explorer.js"></script>
<div class="card-body">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" style="font-size: 20px">
            <a class="nav-link active" id="media-tab" data-toggle="tab" href="#media" role="tab" aria-controls="media"
               aria-selected="true"><i class="fas fa-compact-disc mr-2"></i>미디어</a>
        </li>
        <li class="nav-item" style="font-size: 20px">
            <a class="nav-link" id="diary-tab" data-toggle="tab" href="#diary" role="tab" aria-controls="diary"
               aria-selected="false"><i class="fas fa-book mr-2"></i>다이어리</a>
        </li>
        <li class="nav-item" style="font-size: 20px">
            <a class="nav-link" id="note-tab" data-toggle="tab" href="#note" role="tab" aria-controls="note"
               aria-selected="false"><i class="far fa-sticky-note mr-2" style="font-size: 24px"></i>메모</a>
        </li>
        <li class="nav-item" style="font-size: 20px">
            <a class="nav-link" id="plan-tab" data-toggle="tab" href="#plan" role="tab" aria-controls="plan"
               aria-selected="false"><i class="fas fa-briefcase mr-2"></i>작업</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="media" role="tabpanel" aria-labelledby="media-tab">
            <%--
            네비게이터 (날짜, 이름) (년도, 월, 일, 전체, (ASC, DESC))
            MediaDAO에 의해 정렬된 값 표시
            --%>
        </div>
        <div class="tab-pane fade" id="diary" role="tabpanel" aria-labelledby="diary-tab">
            <%--
            네비게이터 (날짜, 이름) (년도, 월, 전체 (ASC, DESC))
            RecordsDAO에 의해 정렬된 값 표시
            --%>
        </div>
        <div class="tab-pane fade" id="note" role="tabpanel" aria-labelledby="note-tab">
            <%--
            네비게이터 (날짜, 이름) (년도, 월, 일, 전체 (ASC, DESC))
            RecordsDAO에 의해 정렬된 값 표시
            --%>
        </div>
        <div class="tab-pane fade" id="plan" role="tabpanel" aria-labelledby="work-tab">
            <%--
            네비게이터 (날짜, 이름) (년도, 월, 일, 전체, (ASC, DESC))
            PlansDAO에 의해 정렬된 값 표시
            --%>
        </div>
    </div>
    <div style="display: none">
        <textarea id="summer"></textarea>
        <button id="clickbutton">click</button>
    </div>
    <div id="res"></div>
</div>
