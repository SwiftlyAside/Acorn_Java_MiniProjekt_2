<%@ page import="Service.PlanService" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    public String checkTarget(String target, Map<String, String> data) {
        if ("plan".contentEquals(target))
            return new PlanService().storePlan(data);
        else if ("task".contentEquals(target))
            return null;// taskservice.fn
        else
            return "Please check target";
    }
%>

<%
    String target = request.getParameter("target");

    String userId = request.getParameter("userId");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");

    Map<String, String> planData = new HashMap<>();
    planData.put("userId", userId);
    planData.put("title", title);
    planData.put("content", content);
    planData.put("startDate", startDate);
    planData.put("endDate", endDate);
%>

<%=checkTarget(target, planData)%>