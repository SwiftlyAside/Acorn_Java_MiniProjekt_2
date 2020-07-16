<%@ page
        import="DTO.RecordsDTO, Service.ExplorerService, Service.IExplorerService, java.sql.Date, java.util.*, java.sql.Time, DTO.PlansDTO" %><%--
  User: iveci
  Date: 2020-07-16
  Time: 16:17
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    public class Timeline {
        String no;
        String title;

        public Timeline(String id, String title) {
            this.no = id;
            this.title = title;
        }

        public String getNo() {
            return no;
        }

        public void setNo(String no) {
            this.no = no;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }
    }

    public Map<Date, Timeline> getTimelineElements(List<RecordsDTO> records, List<RecordsDTO> diaries, List<PlansDTO> plans) {
        Map<Date, Timeline> timelineMap = new LinkedHashMap<>();
        for (RecordsDTO dto : records)
            timelineMap.put(dto.getRecordDate(), new Timeline(dto.getRecordNo(), dto.getTitle()));

        for (RecordsDTO dto : diaries)
            timelineMap.put(dto.getRecordDate(), new Timeline(dto.getRecordNo(), dto.getTitle()));

        for (PlansDTO dto : plans)
            timelineMap.put(dto.getStartDate(), new Timeline(dto.getPlanNo(), dto.getPlanTitle()));

        List<Map.Entry<Date, Timeline>> entryList = new LinkedList<>(timelineMap.entrySet());
        entryList.sort((o1, o2) -> o2.getKey().compareTo(o1.getKey()));

        Map<Date, Timeline> result = new LinkedHashMap<>();
        for (Map.Entry<Date, Timeline> entry : entryList)
            result.put(entry.getKey(), entry.getValue());
        return result;
    }

    public String generateDiariesTimeline(Map<Date, Timeline> timelineMap) {
        StringBuffer sb = new StringBuffer();
        for (Map.Entry<Date, Timeline> entry : timelineMap.entrySet()) {
            String description;
            if (entry.getValue().getNo().contains("D"))
                description = "일기를 작성했습니다.";
            else if (entry.getValue().getNo().contains("R"))
                description = "메모를 남겼습니다.";
            else
                description = "일정을 입력했습니다.";

            sb.append("<div class='list-group-item list-group-item-action waves-effect'>");
            sb.append(String.format("<span>%s</span><br>", entry.getKey()));
            sb.append(String.format("<span>%s</span><br>", description));
            sb.append(String.format("<a class='titleLink' href='/index.jsp?open=diary&record=%s'>%s</a><br>",
                    entry.getValue().getNo(), entry.getValue().getTitle()));
            sb.append("</div>");
        }
        return sb.toString();
    }
%>
<%
    IExplorerService service = ExplorerService.getInstance();

    List<RecordsDTO> records = service.getAllRecords("admin", ExplorerService.ORDER_RECORD_DATE + "DESC");
    List<RecordsDTO> diaries = service.getAllDiaries("admin", ExplorerService.ORDER_RECORD_DATE + "DESC");
    List<PlansDTO> plans = service.getAllPlans("admin", ExplorerService.ORDER_PLAN_DATE + "DESC");

    Map<Date, Timeline> timelineMap = getTimelineElements(records, diaries, plans);
%>
<%=generateDiariesTimeline(timelineMap)%>