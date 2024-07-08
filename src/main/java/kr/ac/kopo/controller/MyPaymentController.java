package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.PaymentService;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.PaymentVO;

public class MyPaymentController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO member = (MemberVO)request.getSession().getAttribute("member");
		PaymentService service = new PaymentService();
		if(member != null) {
			List<PaymentVO> list = service.searchAll(member.getId());
			request.setAttribute("paymentList", list);
		}
		return "/myPage/myPayment.jsp";
	}

}
