package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.ReservationService;
import kr.ac.kopo.vo.ReservationVO;

public class ReserveFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ReservationVO reserve = new ReservationVO();
		reserve.setReserveDate(request.getParameter("time"));
		reserve.setDetail(request.getParameter("detail"));
		reserve.setMemberId(request.getParameter("memberId"));
		
		ReservationService service = new ReservationService();
		service.createReserve(reserve);
		request.setAttribute("msg", "예약이 완료되었습니다.");
		
		return "/visitReserve.do";
	}

}
