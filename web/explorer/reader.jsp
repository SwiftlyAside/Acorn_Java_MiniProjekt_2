<%@ page import="Service.ExplorerService" %>
<%@ page import="Service.IExplorerService, DTO.RecordsDTO, java.util.List" %><%--
  Date: 2020-07-09
  Time: 오전 10:13

  모아보기 요소

--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    IExplorerService service = ExplorerService.getInstance();
    List<RecordsDTO> diaries = service.getAllDiaries("admin", "");

%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reader.css">
<script src="${pageContext.request.contextPath}/js/reader.js"></script>
<%--모아보기 네비게이션 바--%>
<div class="modal-header flex-1">
    <div class="btn-toolbar py-2" role="toolbar" aria-label="Toolbar with button groups">
        <div class="col-2 my-auto">
            <input type="text" data-provide="datepicker" class="form-control">
        </div>
        <div class="col-1 my-auto">
            부터
        </div>
        <div class="col-2 my-auto">
            <input type="text" data-provide="datepicker" class="form-control">
        </div>
        <div class="col-1 my-auto">
            까지
        </div>
        <div class="btn-group btn-group-toggle my-auto" data-toggle="buttons" id="orderTypeGroup">
            <label class="btn btn-secondary btn-blue-grey ex-btn-order active">
                <input type="radio" name="options" id="byWeekButton" checked>1주일
            </label>
            <label class="btn btn-secondary btn-blue-grey ex-btn-order">
                <input type="radio" name="options" id="byMonthButton">1개월
            </label>
        </div>
    </div>
</div>
<div class="modal-body flex-center my-2" style="height: 70vh">
    <div class="row flex-grow-1 py-5">
        <%--일기장 좌측 버튼--%>
        <div class="col-1 flex-center align-self-center">
            <button class="btn bg-transparent" data-toggle="tooltip" data-placement="bottom" title="이전 일기"><i
                    class="fas fa-chevron-left"></i></button>
        </div>
        <%--일기장 좌측 --%>
        <div class="col readerElement">
            <%=diaries.get(0).getRecordDate()%>
            <h1><%=diaries.get(0).getTitle()%></h1>
            <%=diaries.get(0).getContent()%>
        </div>
        <%--일기장 우측 --%>
        <div class="col border-left readerElement">
        </div>
        <%--일기장 우측 버튼--%>
        <div class="col-1 flex-center align-self-center">
            <button class="btn bg-transparent" data-toggle="tooltip" data-placement="bottom" title="다음 일기"><i
                    class="fas fa-chevron-right"></i></button>
        </div>
    </div>
</div>
