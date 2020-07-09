<%@ page import="Service.ExplorerService" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    ExplorerService service = new ExplorerService();
    String target = request.getParameter("target");
%>
<div class="card-body">
    <h4><%=target%></h4>
    <%--fullsize--%>
    <%--<img src="https://img.youtube.com/vi/tmERJ0R_vaE/0.jpg">--%>
    <%--small thumbnails--%>
    <div class="row">
<%--        <div class="col view overlay zoom">
            <img src="https://img.youtube.com/vi/tmERJ0R_vaE/1.jpg">
        </div>
        <div class="col view overlay zoom">
            <img src="https://img.youtube.com/vi/tmERJ0R_vaE/2.jpg">
        </div>
        <div class="col view overlay zoom">
            <img src="https://img.youtube.com/vi/tmERJ0R_vaE/3.jpg">
        </div>--%>
        <div class="col view overlay zoom">
            <%=service.getAllMedias("admin", "")%>
        </div>
    </div>
    <%--embed player--%>
    <%--<p><iframe frameborder="0" src="//www.youtube.com/embed/tmERJ0R_vaE" width="640" height="360" class="note-video-clip"></iframe><br></p>--%>
</div>