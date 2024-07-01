<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.vo.ClassVO"%>
<%@page import="kr.ac.kopo.vo.MemberVO"%>
<%@page import="kr.ac.kopo.service.ClassService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//MemberVO member = (MemberVO)request.getSession().getAttribute("member");
	//String teacherId = member.getId();
	String date = request.getParameter("date");
	ClassVO classVo = new ClassVO();
	//classVo.setTeacherId(teacherId);
	classVo.setTeacherId("lora");
	classVo.setClassDate(date);
	ClassService service = new ClassService();
	List<ClassVO> list = service.searchClassListByDate(classVo);
	Gson gson = new Gson();
	String jsonString = gson.toJson(list);
	
	request.setAttribute("classList", jsonString);
	
%>
${classList}