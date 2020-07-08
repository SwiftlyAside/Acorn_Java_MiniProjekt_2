<%--
  Date: 2020-07-08
  Time: 오전 10:35
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<script src="${pageContext.request.contextPath}/js/explorer.js"></script>
<div class="card-body">
    <div class="pmd-tabs mb-3">
        <div class="pmd-tab-active-bar" style="width: 106px; left: 0;"></div>
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li role="presentation" class="pb-1 active">
                <a id="media-tab" data-toggle="tab" href="#media" role="tab" aria-controls="media"
                   style="font-size: 20px !important;"><i class="fas fa-compact-disc mr-2"></i>미디어</a>
            </li>
            <li role="presentation" class="pb-1">
                <a id="diary-tab" data-toggle="tab" href="#diary" role="tab" aria-controls="diary"
                   style="font-size: 20px !important;"><i class="fas fa-book mr-2"></i>다이어리</a>
            </li>
            <li role="presentation" class="pb-1">
                <a id="note-tab" data-toggle="tab" href="#note" role="tab" aria-controls="note"
                   style="font-size: 20px !important;"><i class="far fa-sticky-note mr-2"></i>메모</a>
            </li>
            <li role="presentation" class="pb-1">
                <a id="plan-tab" data-toggle="tab" href="#plan" role="tab" aria-controls="plan"
                   style="font-size: 20px !important;"><i class="fas fa-briefcase mr-2"></i>작업</a>
            </li>
        </ul>
    </div>
    <div>
        <%--
        여기는 네비게이터가 들어간다.
        --%>
        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab"
                   aria-controls="nav-home" aria-selected="true">Home</a>
                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab"
                   aria-controls="nav-profile" aria-selected="false">Profile</a>
                <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab"
                   aria-controls="nav-contact" aria-selected="false">Contact</a>
            </div>
        </nav>
    </div>
    <div class="tab-content">
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
</div>
