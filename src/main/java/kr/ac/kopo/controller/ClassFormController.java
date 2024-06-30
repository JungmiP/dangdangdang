package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.ClassService;
import kr.ac.kopo.vo.ClassVO;

public class ClassFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ClassVO classVo = new ClassVO();
		classVo.setDogNo(Integer.parseInt(request.getParameter("dogNo")));
		classVo.setTeacherId(request.getParameter("teacherId"));
		classVo.setClassDate(request.getParameter("date"));
		classVo.setSubscriptionNo(Integer.parseInt(request.getParameter("subNo")));
		
		ClassService service = new ClassService();
		service.createClass(classVo);
		
		request.setAttribute("msg", "수업 예약이 완료되었습니다.");
		
		return "/reservation/classReserve.jsp";
	}

}
