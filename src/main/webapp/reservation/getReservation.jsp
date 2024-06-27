<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.ac.kopo.vo.ReservationVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.service.ReservationService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String date = request.getParameter("date");
	ReservationService service = new ReservationService();
	List<ReservationVO> reserveList = service.searchByReserveDate(date);
	
	if(reserveList != null){
		List<String> result = new ArrayList<>();
		
		for(int i = 0; i < reserveList.size(); i++){
			result.add(reserveList.get(i).getReserveDate().substring(11, 16));
		}
		String json = new Gson().toJson(result);
		request.setAttribute("result", json);
	}
%>
${result}