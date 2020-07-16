<%@ page import="DTO.RecordsDTO, Service.ExplorerService, Service.IExplorerService, java.util.List, java.sql.Date" %><%--
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
    String move = request.getParameter("move");
    String timeFrom = request.getParameter("timeFrom");
    String timeTo = request.getParameter("timeTo");
    StringBuffer conditional = new StringBuffer();
    if (timeFrom != null)
        // 조건문에 첫번째 날짜 이전의 모든 일기 요청 추가
    {
        System.out.println("RECEIVED TIME FROM: " + new Date(Long.parseLong(timeFrom)));
        conditional.append(String.format("AND RECORDDATE >= '%s' ", new Date(Long.parseLong(timeFrom))));
    }
    if (timeTo != null)
        // 조건문에 두번째 날짜 이후의 모든 일기 요청 추가
    {
        System.out.println("RECEIVED TIME TO: " + new Date(Long.parseLong(timeTo)));
        conditional.append(String.format("AND RECORDDATE <= '%s' ", new Date(Long.parseLong(timeTo))));
    }
    conditional.append(ExplorerService.ORDER_RECORD_DATE);
    System.out.println(conditional);
    List<RecordsDTO> diaries = service.getAllDiaries("admin", conditional.toString());
    int index = -2;
    boolean error = false;
    if (move != null) {
        index = (int) session.getAttribute("index");
        switch (move) {
            case "left":
                if (index - 2 < 0)
                    error = true;
                else index -= 2;
                break;
            case "right":
                if (index + 2 >= diaries.size())
                    error = true;
                else index += 2;
                break;
        }
    }

    if (index == -2) {
        index = (diaries.size() - 1) % 2 == 0 ? diaries.size() - 1 : diaries.size() - 2;
    }
    if (error || diaries.size() == 0) {
        out.print("OUTOFINDEX");
    } else {
        session.setAttribute("index", index);
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