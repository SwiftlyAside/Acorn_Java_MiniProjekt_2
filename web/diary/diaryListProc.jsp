<%@page import="DAO.RecordsDAO" %>
<%@page import="DTO.RecordsDTO" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%!
    public String strParsing(String str) {
        String temp = str.replaceAll("\"", "'");
        return temp;
    }
%>
<%
    String userId = (String) session.getAttribute("userId");
    RecordsDAO recordsdao = RecordsDAO.getInstance();

    List<RecordsDTO> recordList;

    recordList = recordsdao.getDiary(userId, "order by recordDate desc");
    StringBuffer sb = new StringBuffer();
    sb.append("[");
    for (RecordsDTO recordsdto : recordList) {
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