<%@page import="Service.RecordsService"%>
<%@page import="Service.IRecordsService"%>
<%@page import="DAO.RecordsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)session.getAttribute("userId");
	String recordNo = request.getParameter("recordNo");
	IRecordsService recordserv = new RecordsService();
	
	recordserv.delDiaryDAO(recordNo, userId);
%>
