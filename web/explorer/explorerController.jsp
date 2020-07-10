<%@ page import="DTO.MediaDTO, Service.ExplorerService, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    ExplorerService service = ExplorerService.getInstance();
    String target = request.getParameter("target");
    List<MediaDTO> mediaDTOList = service.getAllMedias("admin", "");
%>
<div class="overflow-auto p-2" style="height: 70vh">
    <h4><%=target%>
    </h4>
    <%--fullsize--%>
    <%--<img src="https://img.youtube.com/vi/tmERJ0R_vaE/0.jpg">--%>
    <%--small thumbnails--%>
    <div class="row">
        <%--                <div class="col view overlay zoom">
                            <img src="https://img.youtube.com/vi/tmERJ0R_vaE/1.jpg">
                        </div>
                        <div class="col view overlay zoom">
                            <img src="https://img.youtube.com/vi/NNnpsdjmykU/2.jpg">
                        </div>
                        <div class="col view overlay zoom">
                            <img src="https://img.youtube.com/vi/tmERJ0R_vaE/3.jpg">
                        </div>--%>
        <div class="col view overlay zoom">
            <a><%=mediaDTOList.get(0).getMedia()%>
            </a>
        </div>
    </div>
    <%--embed player--%>
    <h1>OVERFLOW TEST</h1>
    <h1>~~~~~~~~~~~~~</h1>
    <h1>~~~~~~~~~~~~~</h1>
    <h1>~~~~~~~~~~~~~</h1>
    <h1>HEECHAN HWANGNAM STYLE</h1>
    <h1>HEECHAN HWANGNAM STYLE</h1>
    <h1>HEECHAN HWANGNAM STYLE</h1>
    <h1>HEECHAN HWANGNAM STYLE</h1>
    <h1>THIS IS HEECHAN HWANGNAM STYLE</h1>
    <p>
        <iframe frameborder="0" src="//www.youtube.com/embed/NNnpsdjmykU" width="640" height="360"
                class="note-video-clip"></iframe>
        <br></p>
    <p>
        <iframe frameborder="0" src="//www.youtube.com/embed/tmERJ0R_vaE" width="640" height="360"
                class="note-video-clip"></iframe>
        <br></p>
</div>