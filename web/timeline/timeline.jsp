<%@ page contentType="text/html;charset=UTF-8" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.min.css">
<div id="timeLineBase">
<span class="light-green-text flex-center"
      style="font-family: 'Julius Sans One', sans-serif; font-size: 22pt">Time Line</span>
</div>
<div id="scroll" class="overflow-auto myScroll mt-2" style="max-height: 43vh">
    <div class="list-group list-group-flush" id="timeLineArea">
        <%--타임라인 컨텐츠--%>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/timeline.js"></script>