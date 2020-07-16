<%@page import="Service.IRecordsService" %>
<%@page import="Service.RecordsService" %>
<%@page import="java.sql.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:useBean id="records" class="DTO.RecordsDTO"/>
<%
    IRecordsService recordserv = new RecordsService();
    String userId = (String)session.getAttribute("userId");
    
    Date recordDate = Date.valueOf(request.getParameter("recordDate"));
    System.out.println("recordDate : " + recordDate);
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String geoInfo = request.getParameter("geoInfo");
    String weather = request.getParameter("weather");

    String condition = (String)session.getAttribute("condition");

    records.setUserId(userId);
    records.setRecordDate(recordDate);
    records.setTitle(title);
    records.setContent(content);
    records.setGeoInfo(geoInfo);
    records.setWeather(weather);
    records.setCondition(condition);

    recordserv.setDiaryDAO(records);
%>