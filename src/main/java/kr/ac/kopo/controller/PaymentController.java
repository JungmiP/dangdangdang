package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;

public class PaymentController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] passNos = request.getParameterValues("no");
		request.setAttribute("passNoList", passNos);
		return "/payment/payment.jsp";
	}

}
