<%@page import="Service.IRecordsService" %>
<%@page import="Service.RecordsService" %>
<%@page import="java.sql.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:useBean id="records" class="DTO.RecordsDTO"/>
<%
    IRecordsService recordserv = new RecordsService();
    String userId = (String)session.getAttribute("userId");
    
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    String condition = (String)session.getAttribute("condition");

    records.setUserId(userId);
    records.setTitle(title);
    records.setContent(content);
    records.setCondition(condition);

    recordserv.setMemeDAO(records);
%>