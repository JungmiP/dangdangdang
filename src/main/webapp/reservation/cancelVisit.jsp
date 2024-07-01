<%@page import="kr.ac.kopo.vo.ReservationVO"%>
<%@page import="kr.ac.kopo.service.ReservationService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	ReservationService service = new ReservationService();
	ReservationVO reserve = new ReservationVO();
	reserve.setNo(no);
	reserve.setStatus("C");
	service.updateStatus(reserve);
%>