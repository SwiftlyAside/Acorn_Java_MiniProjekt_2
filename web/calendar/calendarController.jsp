<%@ page import="Service.PlanService" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public String checkTarget(String target, Map<String, String> data, String currentDate) {
        if ("plan".contentEquals(target))
            return new PlanService().storePlan(data);
        else if ("task".contentEquals(target))
            return null;// taskservice.fn
        else if ("month".contentEquals(target)) {
            // json으로 형으로 전달하기 위한 StringBuilder
            StringBuilder sb = new StringBuilder();

            // diary service 에서 데이터 로드 요청
                // to do..

            // plan service 에서 데이터 로드 요청
            String monthlyPlan = new PlanService().getMonthlyPlans(data.get("userId"), currentDate);

            // task service 에서 데이터 로드 요청
                // to do..

            // builder append.
            return monthlyPlan;
        } else if ("week".contentEquals(target)) {

            return null;
        }
        else{}
            return "Please check target";
    }
%>
<%
    String target = request.getParameter("target");

    String userId = (String) session.getAttribute("userId");
//    String userId = request.getParameter("userId");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");

    String currentDate = request.getParameter("currentDate");
//    System.out.print(currentDate);

    Map<String, String> planData = new HashMap<>();
    planData.put("userId", userId);
    planData.put("title", title);
    planData.put("content", content);
    planData.put("startDate", startDate);
    planData.put("endDate", endDate);
%>
<%=checkTarget(target, planData, currentDate)%>