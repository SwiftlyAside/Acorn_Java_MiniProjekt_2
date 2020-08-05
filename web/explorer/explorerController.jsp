<%@ page
        import="DTO.MediaDTO, DTO.PlansDTO, DTO.RecordsDTO, Service.ExplorerService, java.io.IOException, java.time.LocalDate, java.util.List, java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    private final String divRow = "<div class='row'>";
    private final String divClose = "</div>";

    public void generateMediaTable(List<MediaDTO> list, JspWriter out) {
        for (int i = 0; i < list.size(); i++) {
            try {
                if (i % 3 == 0)
                    out.print(divRow);
                out.print("<div class='col-3 border-lightgreen rounded m-2'>");
                out.print("<a class='view overlay zoom' href='/index.jsp?open=diary&record=" +
                        list.get(i).getRecordNo() + "'>" + list.get(i).getMedia() + "</a></div>");
                if (i % 3 == 2 || i == list.size() - 1)
                    out.print(divClose);
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
                        out.print("<h2 class='my-2'>" + entry.getKey().getYear() + "</h2>");
                        break;
                    case "month":
                        out.print("<h2 class='my-2'>" + entry.getKey().getYear() + "&nbsp;" + entry.getKey().getMonth() + "</h2>");
                        break;
                    case "day":
                        out.print("<h2 class='my-2'>" + entry.getKey() + "</h2>");
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
                    out.print(divRow);
                out.print("<div class='col-3 border-lightgreen rounded m-2'>");
                out.print("<div class='row-1 font-weight-bold pale-text'>" + list.get(i).getRecordDate() + "</div>");
                out.print("<div class='row-1'><a class='view overlay zoom' href='/index.jsp?open=diary&record=" +
                        list.get(i).getRecordNo() + "'>" + list.get(i).getTitle() + "</a></div></div>");
                if (i % 3 == 2 || i == list.size() - 1)
                    out.print(divClose);
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
                        out.print("<h2 class='my-2'>" + entry.getKey().getYear() + "</h2>");
                        break;
                    case "month":
                        out.print("<h2 class='my-2'>" + entry.getKey().getYear() + "&nbsp;" + entry.getKey().getMonth() + "</h2>");
                        break;
                    case "day":
                        out.print("<h2 class='my-2'>" + entry.getKey() + "</h2>");
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
                    out.print(divRow);
                out.print("<div class='col-3 border-lightgreen rounded m-2'>");
                out.print("<div class='row-1 font-weight-bold pale-text'>" + list.get(i).getStartDate() + "</div>");
                out.print("<a class='view overlay zoom' href='/index.jsp?open=calendar&plan=" +
                        list.get(i).getPlanNo() + "'>" + list.get(i).getPlanTitle() + "</a></div>");
                if (i % 3 == 2 || i == list.size() - 1)
                    out.print(divClose);
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
                        out.print("<h2 class='my-2'>" + entry.getKey().getYear() + "</h2>");
                        break;
                    case "month":
                        out.print("<h2 class='my-2'>" + entry.getKey().getYear() + "&nbsp;" + entry.getKey().getMonth() + "</h2>");
                        break;
                    case "day":
                        out.print("<h2 class='my-2'>" + entry.getKey() + "</h2>");
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
        StringBuilder conditionalPlan = new StringBuilder();
        StringBuilder conditionalRecord = new StringBuilder();
        List<MediaDTO> mediaDTOList;
        List<RecordsDTO> diaryList;
        List<RecordsDTO> recordsList;
        List<PlansDTO> plansList;

        switch (target) {
            case "media":
                if (search != null)
                    conditionalRecord.append(String.format("AND R.TITLE LIKE '%%%s%%'", search));
                if ("date".contentEquals(orderBy)) conditionalRecord.append(ExplorerService.ORDER_RECORD_DATE);
                else conditionalRecord.append(ExplorerService.ORDER_RECORD_TITLE);
                conditionalRecord.append(desc);
                mediaDTOList = service.getAllMedias("admin", conditionalRecord.toString());
                if (!"all".contentEquals(group))
                    generateGroupedMediaTable(service.getGroupedMedias(mediaDTOList, group), group, out);
                else
                    generateMediaTable(mediaDTOList, out);
                break;
            case "diary":
                if (search != null)
                    conditionalRecord.append(String.format("AND TITLE LIKE '%%%s%%'", search));
                if ("date".contentEquals(orderBy)) conditionalRecord.append(ExplorerService.ORDER_RECORD_DATE);
                else conditionalRecord.append(ExplorerService.ORDER_RECORD_TITLE);
                conditionalRecord.append(desc);
                diaryList = service.getAllDiaries("admin", conditionalRecord.toString());
                if (!"all".contentEquals(group))
                    generateGroupedRecordTable(service.getGroupedRecords(diaryList, group), group, out);
                else
                    generateRecordTable(diaryList, out);
                break;
            case "record":
                if (search != null)
                    conditionalRecord.append(String.format("AND TITLE LIKE '%%%s%%'", search));
                if ("date".contentEquals(orderBy)) conditionalRecord.append(ExplorerService.ORDER_RECORD_DATE);
                else conditionalRecord.append(ExplorerService.ORDER_RECORD_TITLE);
                conditionalRecord.append(desc);
                recordsList = service.getAllRecords("admin", conditionalRecord.toString());
                if (!"all".contentEquals(group))
                    generateGroupedRecordTable(service.getGroupedRecords(recordsList, group), group, out);
                else
                    generateRecordTable(recordsList, out);
                break;
            case "plan":
                if (search != null)
                    conditionalPlan.append(String.format("AND PLANTITLE LIKE '%%%s%%'", search));
                if ("date".contentEquals(orderBy)) conditionalPlan.append(ExplorerService.ORDER_PLAN_DATE);
                else conditionalPlan.append(ExplorerService.ORDER_PLAN_TITLE);
                conditionalPlan.append(desc);
                plansList = service.getAllPlans("admin", conditionalPlan.toString());
                if (!"all".contentEquals(group))
                    generateGroupedPlanTable(service.getGroupedPlans(plansList, group), group, out);
                else
                    generatePlanTable(plansList, out);
                break;
        }
    %>
</div>