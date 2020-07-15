<%@ page import="DTO.RecordsDTO, Service.ExplorerService, Service.IExplorerService, java.util.List" %><%--
  User: iveci
  Date: 2020-07-15
  Time: 10:10
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    // 인덱스에 해당하는 페이지 생성
    public String generatePage(int index, List<RecordsDTO> diaries) {
        StringBuffer buffer = new StringBuffer();
        if (index >= diaries.size())
            buffer.append("<h2>더이상 일기가 없습니다.</h2>");
        else {
            buffer.append(diaries.get(index).getRecordDate())
                    .append("<h1>").append(diaries.get(index).getTitle())
                    .append("</h1>")
                    .append(diaries.get(index).getContent());
        }
        return buffer.toString();
    }
%>
<%
    // 처리
    IExplorerService service = ExplorerService.getInstance();
    List<RecordsDTO> diaries = service.getAllDiaries("admin", "");
    int index = -2;
    if (request.getParameter("readerIndex") != null)
        index = Integer.parseInt(request.getParameter("readerIndex"));

    if (index == -2)
        index = diaries.size() - 1;
    if (index < 0 || index >= diaries.size())
        out.print(-1);
    else {
%>
<%--일기장 좌측 --%>
<div class="col readerElement">
    <%=generatePage(index, diaries)%>
</div>
<%--일기장 우측 --%>
<div class="col border-left readerElement">
    <%=generatePage(index + 1, diaries)%>
</div>
<%
    }
%>