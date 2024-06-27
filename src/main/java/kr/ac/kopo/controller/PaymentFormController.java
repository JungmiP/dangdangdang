package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.PaymentService;
import kr.ac.kopo.vo.PaymentVO;

public class PaymentFormController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		PaymentService service = new PaymentService();
		
		String memberId = request.getParameter("memberId");
		int passNo = Integer.parseInt(request.getParameter("pass"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String payMethod = request.getParameter("payMethod");
		
		PaymentVO payment = new PaymentVO();
		
		payment.setMemberId(memberId);
		payment.setPassNo(passNo);
		payment.setAmount(amount);
		payment.setPayMethod(payMethod);
		
		service.createPayment(payment);
		
		return "/payment/paymentResult.jsp";
	}

}
