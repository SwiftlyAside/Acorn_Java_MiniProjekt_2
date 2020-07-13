<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String target = request.getParameter("target");
	String url = "";
	if("loginForm".contentEquals(target))	url = "/joinheader/loginForm.jsp";
	if("membershipForm".contentEquals(target))	url = "/joinheader/membershipForm.jsp";
%>
<jsp:forward page="<%=url %>"></jsp:forward>
<%-- <jsp:forward page="/joinheader/loginForm.jsp"></jsp:forward> --%>