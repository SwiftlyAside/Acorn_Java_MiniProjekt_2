<%@page import="java.util.ArrayList"%>
<%@page import="DTO.RecordsDTO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.RecordsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public String strParsing(String str){
	String temp = str.replaceAll("\"", "'");
	//temp = temp.replaceAll("", "");
	return temp;
}
%>
<%
	//String userId = (String)session.getAttribute("userId");
	String userId = "sglee";
	RecordsDAO recordsdao = RecordsDAO.getInstance();
	
	List<RecordsDTO> recordList = new ArrayList<RecordsDTO>();
	
	recordList = recordsdao.getDiary(userId, "order by recordDate desc");
	StringBuffer sb = new StringBuffer();
	sb.append("[");
	for(int i=0;i<recordList.size();i++){
		RecordsDTO recordsdto = recordList.get(i);
		sb.append(String.format(
			"{\"recordNo\":\"%s\","
		    + "\"recordDate\":\"%s\","
		    + "\"title\":\"%s\"," 
	        + "\"content\":\"%s\","
	        + "\"geoInfo\":\"%s\","
	        + "\"weather\":\"%s\","
	        + "\"condition\":\"%s\"},", 
		    recordsdto.getRecordNo(),
		    recordsdto.getRecordDate(),
		    strParsing(recordsdto.getTitle()),
		    strParsing(recordsdto.getContent()),
		    strParsing(recordsdto.getGeoInfo()),
		    strParsing(recordsdto.getWeather()),
		    recordsdto.getCondition()
		));
	}
	String str = sb.toString();
	int pos = str.lastIndexOf(",");
	str = str.substring(0, pos) + "]";
%>
<%=str%>