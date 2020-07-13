<%@ page import="Service.ExplorerService" %>
<%@ page import="Service.IExplorerService" %><%--
  Date: 2020-07-09
  Time: 오전 10:13

  모아보기 요소

--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    IExplorerService service = ExplorerService.getInstance();

%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reader.css">
<script src="${pageContext.request.contextPath}/js/reader.js"></script>
<div class="modal-header">

</div>
<div class="modal-body flex-center" style="height: 70vh">
    <div class="row flex-grow-1 py-5">
        <div class="col-1 flex-center align-self-center">
            <button class="btn bg-transparent" data-toggle="tooltip" data-placement="bottom" title="이전 일기"><i
                    class="fas fa-chevron-left"></i></button>
        </div>
        <div class="col-xl-5 px-2" style="height: 70vh; overflow-x: hidden; overflow-y: auto">
            <h1>OVERFLOW TEST</h1>
            <h1>~~~~~~~~~~~~~</h1>
            <h1>~~~~~~~~~~~~~</h1>
            <h1>~~~~~~~~~~~~~</h1>
            <h1>HEECHAN HWANGNAM STYLE</h1>
            <h1>HEECHAN HWANGNAM STYLE</h1>
        </div>
        <div class="col px-2 flex-xl-grow-1 border-left" style="height: 70vh; overflow-x: hidden; overflow-y: auto">
            <p>
                <iframe frameborder="0" src="//www.youtube.com/embed/NNnpsdjmykU" class="note-video-clip"></iframe>
                <br></p>
        </div>
        <div class="col-1 flex-center align-self-center">
            <button class="btn bg-transparent" data-toggle="tooltip" data-placement="bottom" title="다음 일기"><i
                    class="fas fa-chevron-right"></i></button>
        </div>
    </div>
</div>
