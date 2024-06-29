package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.TeacherDAO;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.SubscriptionService;

import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.SubscriptionVO;
import kr.ac.kopo.vo.TeacherVO;

public class ClassReservationController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO member = (MemberVO) request.getSession().getAttribute("member");
		if(member != null) {
			//선생님 이름 목록 조회, 서비스로 바꾸기
			TeacherDAO teacherDao = new TeacherDAO();
			List<TeacherVO> teacherList = teacherDao.selectAll();
			request.setAttribute("teacherList", teacherList);
			
			// 유효한 이용권 리스트 조회 후 등록
			SubscriptionService subscriptionService = new SubscriptionService();
			// memberId 세션에서 받아오는 걸로 바꿀 것
			List<SubscriptionVO> subList =  subscriptionService.searchValidSub(member.getId());
			request.setAttribute("subList", subList);			
		}		
		return "/reservation/classReservation.jsp";
	}
}
