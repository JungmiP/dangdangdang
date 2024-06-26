<%@page import="kr.ac.kopo.vo.PassVO"%>
<%@page import="kr.ac.kopo.dao.PassDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	PassDAO passDao = new PassDAO();
	PassVO pass = passDao.selectOne(no);
	request.setAttribute("pass", pass);
%>
${pass.price}