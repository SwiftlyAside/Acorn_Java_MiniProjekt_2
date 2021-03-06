<%--
  Date: 2020-07-08
  Time: 오전 10:35
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String search = request.getParameter("search");
    if (search == null) search = "";
%>
<script src="${pageContext.request.contextPath}/js/explorer.js"></script>
<div class="card-body">
    <%--네비게이터 탭--%>
    <input type="hidden" id="searchValue" value="<%=search%>">
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
            <a class="nav-link" id="record-tab" data-toggle="tab" href="#record" role="tab" aria-controls="record"
               aria-selected="false"><i class="far fa-sticky-note mr-2" style="font-size: 24px"></i>메모</a>
        </li>
        <li class="nav-item" style="font-size: 20px">
            <a class="nav-link" id="plan-tab" data-toggle="tab" href="#plan" role="tab" aria-controls="plan"
               aria-selected="false"><i class="fas fa-briefcase mr-2"></i>작업</a>
        </li>
    </ul>
    <%--네비게이터 정렬 탭--%>
    <div class="btn-toolbar py-2" role="toolbar" aria-label="Toolbar with button groups">
        <div class="btn-group btn-group-toggle btn-group-first" data-toggle="buttons" id="orderTypeGroup">
            <label class="btn btn-secondary btn-blue-grey ex-btn-order active">
                <input type="radio" name="options" id="byDateButton" checked>날짜
            </label>
            <label class="btn btn-secondary btn-blue-grey ex-btn-order">
                <input type="radio" name="options" id="byNameButton">이름
            </label>
        </div>
        <div class="btn-group btn-group-toggle btn-group-secondary" data-toggle="buttons">
            <label class="btn btn-secondary btn-blue-grey ex-btn-order">
                <input type="radio" name="options" value="year">년도
            </label>
            <label class="btn btn-secondary btn-blue-grey ex-btn-order">
                <input type="radio" name="options" value="month">월
            </label>
            <label class="btn btn-secondary btn-blue-grey ex-btn-order">
                <input type="radio" name="options" value="day">일
            </label>
            <label class="btn btn-secondary btn-blue-grey ex-btn-order active">
                <input type="radio" name="options" value="all" checked>전체
            </label>
            <button id="btnGroupDrop1" type="button" class="btn btn-info btn-blue-grey dropdown-toggle ex-btn-order" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-sort"></i>
            </button>
            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                <a class="dropdown-item" href="#" id="ascAnchor">오름차순</a>
                <a class="dropdown-item" href="#" id="descAnchor">내림차순</a>
            </div>
        </div>
    </div>

    <%--네비게이터 탭 내용--%>
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
        <div class="tab-pane fade " id="record" role="tabpanel" aria-labelledby="record-tab">
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
</div>
