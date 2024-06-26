package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.PassService;
import kr.ac.kopo.vo.PassVO;

public class PassController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PassService service = new PassService();
		List<PassVO> passList = service.searchAll();
		request.setAttribute("passList", passList);
		return "/payment/pass.jsp";
	}

}
