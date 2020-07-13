<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="DTO.MediaDTO, Service.ExplorerService, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    ExplorerService service = ExplorerService.getInstance();
    String target = request.getParameter("target");
    String search = request.getParameter("search");
    List<MediaDTO> mediaDTOList = service.getAllMedias("admin", "");
%>
<div class="overflow-auto p-2" style="height: 70vh">
    <h4><%=search == null || "".contentEquals(search) ? "" : search + "로 검색한 결과"%>
    </h4>
    <%--fullsize--%>
    <%--<img src="https://img.youtube.com/vi/tmERJ0R_vaE/0.jpg">--%>
    <%--small thumbnails--%>
    <%--<div class="col view overlay zoom">
                    <img src="https://img.youtube.com/vi/tmERJ0R_vaE/1.jpg">
                </div>
                <div class="col view overlay zoom">
                    <img src="https://img.youtube.com/vi/NNnpsdjmykU/2.jpg">
                </div>
                <div class="col view overlay zoom">
                    <img src="https://img.youtube.com/vi/tmERJ0R_vaE/3.jpg">
                </div>--%>
    <%
        for (int i = 0; i < mediaDTOList.size(); i++) {
            System.out.println(mediaDTOList.size());
            if (i % 3 == 0)
                out.print("<div class='row'>");
    %>
        <div class="col-3">
            <a class="view overlay zoom" href="#"><%=mediaDTOList.get(i).getMedia()%>
            </a>
        </div>
    <%
            if (i % 3 == 2 || i == mediaDTOList.size() - 1)
                out.print("</div>");
        }
    %>
</div>