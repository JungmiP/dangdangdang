<%@page import="com.google.gson.Gson"%>
<%@page import="kr.ac.kopo.service.ClassService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.kopo.vo.ClassVO"%>
<%@page import="kr.ac.kopo.vo.DogVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	request.setCharacterEncoding("utf-8");
	String date = request.getParameter("date");
	List<DogVO> dogList = (List<DogVO>) request.getSession().getAttribute("dogList");
	if(dogList != null){
		List<ClassVO> list = new ArrayList<>();
		ClassService service = new ClassService();
		ClassVO classVo = new ClassVO();
		classVo.setClassDate(date);
		for(DogVO dog : dogList){
			int dogNo = dog.getNo();
			classVo.setDogNo(dogNo);
			ClassVO result = service.searchByDogNoAndDate(classVo);
			if(result != null){
				list.add(result);
			}
		}
		Gson gson = new Gson();
		String jsonString = gson.toJson(list);
		session.setAttribute("myClassList", jsonString);
	}
%>
${myClassList}