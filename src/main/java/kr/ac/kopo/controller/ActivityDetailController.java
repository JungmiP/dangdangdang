package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.ActivityService;
import kr.ac.kopo.vo.ActivityVO;

public class ActivityDetailController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int no = Integer.parseInt(request.getParameter("no"));
		ActivityService service = new ActivityService();
		ActivityVO activity = service.searchActivity(no);
		request.setAttribute("activity", activity);
		
		return "/activity/activityDetail.jsp";
	}

}
