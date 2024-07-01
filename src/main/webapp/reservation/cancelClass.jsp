<%@page import="kr.ac.kopo.service.ClassService"%>
<%@page import="kr.ac.kopo.vo.ClassVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	ClassVO classVo = new ClassVO();
	classVo.setNo(no);
	classVo.setStatus("C");
	
	ClassService service = new ClassService();
	service.updateStatus(classVo);	
%>