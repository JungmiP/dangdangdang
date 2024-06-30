package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.ReservationService;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.ReservationVO;

public class VisitReservationController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReservationService service = new ReservationService();
		List<ReservationVO> reserveList = service.searchByToday();
		if(reserveList != null)
			request.setAttribute("reserveList", reserveList);
		MemberVO member = (MemberVO)request.getSession().getAttribute("member");
		List<ReservationVO> myReserveList = service.searchByMemberId(member.getId());
		if(myReserveList != null)
			request.setAttribute("myReserveList", myReserveList);
		
		return "/reservation/visitReservation.jsp";
	}

}
