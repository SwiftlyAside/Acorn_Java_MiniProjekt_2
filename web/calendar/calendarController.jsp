<%@ page import="Service.PlanService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    public String checkTarget(String target, String jsonData) {
        if ("plan".contentEquals(target))
            return new PlanService().storePlan(jsonData);
        else if ("task".contentEquals(target))
            return null;// taskservice.fn
        else
            return "Please check target";
    }
%>

<%
    String target = request.getParameter("target");
    String jsonData = request.getParameter("jsonData");
%>

<%=checkTarget(target, jsonData)%>