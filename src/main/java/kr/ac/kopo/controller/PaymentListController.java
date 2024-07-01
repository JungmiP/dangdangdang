package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.PaymentService;
import kr.ac.kopo.vo.PaymentVO;

public class PaymentListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PaymentService service = new PaymentService();
		List<PaymentVO> list = service.searchAll();
		request.setAttribute("paymentList", list);
		return "/payment/paymentList.jsp";
	}

}
