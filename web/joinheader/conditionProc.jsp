<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String condition = "none";
	if(request.getParameter("condition") != null){
		condition = request.getParameter("condition");
		if(condition == "")	condition = "none";
	}
	session.setAttribute("condition", condition);
%>