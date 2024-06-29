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
	//request.setAttribute("tmp", list.get(0).get("teacherId"));
	System.out.print(list.get(0).get("cnt"));

%>
