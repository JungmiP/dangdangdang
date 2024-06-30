<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.service.ClassService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String date = request.getParameter("date");
	
	ClassService service = new ClassService();
	List<Map<String, Object>> list = service.searchCntPerTeacher(date);
	//Gson써서 넘기기
	Gson gson = new GsonBuilder().create();
	String json = gson.toJson(list);
	request.setAttribute("tmp", json);
%>
${tmp}