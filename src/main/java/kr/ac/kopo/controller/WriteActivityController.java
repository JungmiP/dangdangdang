package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.ClassService;
import kr.ac.kopo.vo.ClassVO;

public class WriteActivityController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int classNo = Integer.parseInt(request.getParameter("classNo"));
		ClassService service = new ClassService();
		ClassVO classVo = service.searchOne(classNo);
		request.setAttribute("classVo", classVo);
		return "/activity/writeActivity.jsp";
	}

}
