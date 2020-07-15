<%@page import="DTO.RecordsDTO"%>
<%@page import="Service.RecordsService"%>
<%@page import="Service.IRecordsService"%>
<%@page import="org.apache.tomcat.jni.Local"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="records" class="DTO.RecordsDTO"></jsp:useBean>
<%
	IRecordsService recordserv = new RecordsService();
	//String userId = (String)session.getAttribute("userId");
	String userId = "sglee";
	Date recordDate = Date.valueOf(request.getParameter("recordDate"));
	System.out.println("recordDate : " + recordDate);
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String geoInfo = request.getParameter("geoInfo");
	String weather = request.getParameter("weather");
	
	//String condition = (String)session.getAttribute("condition");
	String condition = "fine";
	
	records.setUserId(userId);
	records.setRecordDate(recordDate);
	records.setTitle(title);
	records.setContent(content);
	records.setGeoInfo(geoInfo);
	records.setWeather(weather);
	records.setCondition(condition);
	
	recordserv.setDiaryDAO(records);	
%>