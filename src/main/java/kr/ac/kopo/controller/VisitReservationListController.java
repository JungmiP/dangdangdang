package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.ReservationService;
import kr.ac.kopo.vo.ReservationVO;

public class VisitReservationListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String date = request.getParameter("date");
		ReservationService service = new ReservationService();
		
		List<ReservationVO> list = service.searchByReserveDate(date);
		request.setAttribute("visitList", list);
		return "/reservation/visitReservationList.jsp";
	}

}
