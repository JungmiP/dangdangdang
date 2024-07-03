package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.ActivityService;
import kr.ac.kopo.vo.ActivityVO;
import kr.ac.kopo.vo.MemberVO;

public class ActivityListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO member = (MemberVO)request.getSession().getAttribute("member");
		String teacherId = member.getId();
		ActivityService service = new ActivityService();
		List<ActivityVO> list = service.searchAllActivity(teacherId);
		request.setAttribute("activityList", list);
		return "/activity/activityList.jsp";
	}

}
