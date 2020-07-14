<%@page import="Service.MembershipService"%>
<%@page import="Service.IMembershipService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	IMembershipService memberserv = new MembershipService();
%>
{"boolean" : "<%=memberserv.isChkUserId(userId) %>"}