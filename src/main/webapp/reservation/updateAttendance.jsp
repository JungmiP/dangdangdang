<%@page import="kr.ac.kopo.service.ClassService"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>

<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String str = request.getParameter("classNoList");
	
	Gson gson = new Gson();
	List<Map<String, Integer>> list = gson.fromJson(str, new TypeToken<List<Map<String, Integer>>>(){}.getType());
	
	ClassService service = new ClassService(); 
	for(Map<String,Integer> map: list){
		service.changeAttendance(map.get("classNo"));
	}	
%>