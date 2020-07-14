<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page
        import="DTO.MediaDTO, DTO.PlansDTO, DTO.RecordsDTO, Service.ExplorerService, java.io.IOException, java.util.List, java.time.LocalDate, java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    public void generateMediaTable(List<MediaDTO> list, JspWriter out) {
        for (int i = 0; i < list.size(); i++) {
            try {
                if (i % 3 == 0)
                    out.print("<div class='row'>");
                out.print("<div class='col-3 border-lightgreen rounded'>");
                out.print("<a class='view overlay zoom' href='#'>" + list.get(i).getMedia() + "</a></div>");
                if (i % 3 == 2 || i == list.size() - 1)
                    out.print("</div>");
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    public void generateGroupedMediaTable(Map<LocalDate, List<MediaDTO>> groupedMediaMap, String group, JspWriter out) {
        for (Map.Entry<LocalDate, List<MediaDTO>> entry : groupedMediaMap.entrySet()) {
            try {
                switch (group) {
                    case "year":
                        out.print("<h1>" + entry.getKey().getYear() + "</h1>");
                        break;
                    case "month":
                        out.print("<h1>" + entry.getKey().getMonth() + "</h1>");
                        break;
                    case "day":
                        out.print("<h1>" + entry.getKey() + "</h1>");
                        break;
                }
                generateMediaTable(entry.getValue(), out);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void generateRecordTable(List<RecordsDTO> list, JspWriter out) {
        for (int i = 0; i < list.size(); i++) {
            try {
                if (i % 3 == 0)
                    out.print("<div class='row'>");
                out.print("<div class='col-3 border-lightgreen rounded'>");
                out.print("<a class='view overlay zoom' href='#'>" + list.get(i).getTitle() + "</a></div>");
                if (i % 3 == 2 || i == list.size() - 1)
                    out.print("</div>");
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    public void generateGroupedRecordTable(Map<LocalDate, List<RecordsDTO>> groupedRecordMap, String group, JspWriter out) {
        for (Map.Entry<LocalDate, List<RecordsDTO>> entry : groupedRecordMap.entrySet()) {
            try {
                switch (group) {
                    case "year":
                        out.print("<h1>" + entry.getKey().getYear() + "</h1>");
                        break;
                    case "month":
                        out.print("<h1>" + entry.getKey().getMonth() + "</h1>");
                        break;
                    case "day":
                        out.print("<h1>" + entry.getKey() + "</h1>");
                        break;
                }
                generateRecordTable(entry.getValue(), out);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void generatePlanTable(List<PlansDTO> list, JspWriter out) {
        for (int i = 0; i < list.size(); i++) {
            try {
                if (i % 3 == 0)
                    out.print("<div class='row'>");
                out.print("<div class='col-3 border-lightgreen rounded'>");
                out.print("<a class='view overlay zoom' href='#'>" + list.get(i).getPlanTitle() + "</a></div>");
                if (i % 3 == 2 || i == list.size() - 1)
                    out.print("</div>");
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    public void generateGroupedPlanTable(Map<LocalDate, List<PlansDTO>> groupedPlanMap, String group, JspWriter out) {
        for (Map.Entry<LocalDate, List<PlansDTO>> entry : groupedPlanMap.entrySet()) {
            try {
                switch (group) {
                    case "year":
                        out.print("<h1>" + entry.getKey().getYear() + "</h1>");
                        break;
                    case "month":
                        out.print("<h1>" + entry.getKey().getMonth() + "</h1>");
                        break;
                    case "day":
                        out.print("<h1>" + entry.getKey() + "</h1>");
                        break;
                }
                generatePlanTable(entry.getValue(), out);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
%>
<%
    ExplorerService service = ExplorerService.getInstance();
    String search = request.getParameter("search");
%>
<div class="overflow-auto p-2" style="height: 70vh">
    <h4><%=search == null || "".contentEquals(search) ? "" : search + "로 검색한 결과"%>
    </h4>
    <%
        // target: 탭 중 하나의 이름
        String target = request.getParameter("target");
        String group = request.getParameter("group");
        String orderBy = request.getParameter("orderBy");
        String desc = request.getParameter("desc") != null ? "desc " : "";
        String conditional;
        List<MediaDTO> mediaDTOList;
        List<RecordsDTO> diaryList;
        List<RecordsDTO> recordsList;
        List<PlansDTO> plansList;

        // admin 부분에는 유저 이름을 입력받아야 함
        String conditional1 = ("date".contentEquals(orderBy) ? ExplorerService.ORDER_RECORD_DATE : ExplorerService.ORDER_RECORD_TITLE) + desc;
        switch (target) {
            case "media":
                conditional = conditional1;
                mediaDTOList = service.getAllMedias("admin", conditional);
                if (!"all".contentEquals(group))
                    generateGroupedMediaTable(service.getGroupedMedias(mediaDTOList, group), group, out);
                else
                    generateMediaTable(mediaDTOList, out);
                break;
            case "diary":
                conditional = conditional1;
                diaryList = service.getAllDiaries("admin", conditional);
                generateRecordTable(diaryList, out);
                break;
            case "record":
                conditional = conditional1;
                recordsList = service.getAllRecords("admin", conditional);
                generateRecordTable(recordsList, out);
                break;
            case "plan":
                conditional = ("date".contentEquals(orderBy) ? ExplorerService.ORDER_PLAN_DATE : ExplorerService.ORDER_PLAN_TITLE) + desc;
                plansList = service.getAllPlans("admin", conditional);
                generatePlanTable(plansList, out);
                break;
        }
    %>
</div>