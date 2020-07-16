<%--
  Date: 2020-07-09
  Time: 오전 10:13

  모아보기 요소
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reader.css">
<script src="${pageContext.request.contextPath}/js/reader.js?v=<%=Math.random()%>"></script>
<%--모아보기 네비게이션 바--%>
<div class="modal-header flex-1">
    <div class="btn-toolbar py-2" role="toolbar" aria-label="Toolbar with button groups">
        <div class="input-daterange input-group my-auto ex-btn-order" id="dateRangePicker">
            <input type="text" class="input-sm form-control " name="start" id="start"/>
            <span class="input-group-addon my-auto">&nbsp;to&nbsp;</span>
            <input type="text" class="input-sm form-control" name="end" id="end"/>
        </div>
        <div class="btn-group btn-group-toggle my-auto" data-toggle="buttons" id="orderTypeGroup">
            <label class="btn btn-secondary btn-blue-grey ex-btn-order my-auto active">
                <input type="radio" name="options" id="WeekButton" value="week" checked>1주일
            </label>
            <label class="btn btn-secondary btn-blue-grey ex-btn-order my-auto">
                <input type="radio" name="options" id="MonthButton" value="month">1개월
            </label>
        </div>
    </div>
</div>
<div class="modal-body flex-center my-2" style="height: 70vh">
    <div class="row flex-grow-1 py-5">
        <%--일기장 좌측 버튼--%>
        <div class="col-1 flex-center align-self-center" id="leftButton">
            <button class="btn bg-transparent" data-toggle="tooltip" data-placement="bottom" title="이전 일기"><i
                    class="fas fa-chevron-left"></i></button>
        </div>
        <%--일기장 우측 버튼--%>
        <div class="col-1 flex-center align-self-center" id="rightButton">
            <button class="btn bg-transparent" data-toggle="tooltip" data-placement="bottom" title="다음 일기"><i
                    class="fas fa-chevron-right"></i></button>
        </div>
    </div>
</div>