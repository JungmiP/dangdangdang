package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.RefundService;
import kr.ac.kopo.vo.RefundVO;

public class RefundFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int paymentNo = Integer.parseInt(request.getParameter("paymentNo"));
		String reason = request.getParameter("reason");
		
		RefundVO refund = new RefundVO();
		refund.setPaymentNo(paymentNo);
		refund.setReason(reason);
		
		RefundService service = new RefundService();
		service.insert(refund);
		return null;
	}

}
