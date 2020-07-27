<%@page import="Service.LoginService"%>
<%@page import="Service.ILoginService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	String userPass = request.getParameter("userPass");
	String str = "{\"boolean\":\"false\"}";
	ILoginService loginserv = new LoginService();
	if(loginserv.checkLogin(userId, userPass)){
		session.setAttribute("userId", userId);
		str = "{\"boolean\":\"true\",\"userId\":\"" + userId + "\"}";
	}
%>
<%=str%>