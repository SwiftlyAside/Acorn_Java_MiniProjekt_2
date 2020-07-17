<%@page import="Service.MembershipService"%>
<%@page import="Service.IMembershipService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="users" class="DTO.UsersDTO"></jsp:useBean>
<%
	String userId = request.getParameter("userId");
	String userPass = request.getParameter("userPass");
	String userName = request.getParameter("userName");
	String userEmail = request.getParameter("userEmail");
	
	users.setUserId(userId);
	users.setUserPass(userPass);
	users.setUserName(userName);
	users.setUserEmail(userEmail);
	
	IMembershipService memberserv = new MembershipService();
	memberserv.insertDAO(users);
%>