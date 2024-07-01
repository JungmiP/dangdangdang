package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.SubscriptionService;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.SubscriptionVO;

public class MySubscriptionController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO member = (MemberVO)request.getSession().getAttribute("member");
		SubscriptionService service = new SubscriptionService();
		List<SubscriptionVO> list = service.searchAll(member.getId());
		request.setAttribute("subscriptionList", list);
		return "/subscription/mySubscription.jsp";
	}

}
