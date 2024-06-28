package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.TeacherDAO;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.SubscriptionService;
import kr.ac.kopo.vo.DogVO;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.SubscriptionVO;
import kr.ac.kopo.vo.TeacherVO;

public class ClassReservationContorller implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO member = new MemberVO();
		member.setId("user");
		member.setName("사용자");
		request.getSession().setAttribute("member", member);
		
		List<DogVO> dogList = new ArrayList<>();
		
		DogVO dog = new DogVO();
		dog.setNo(11);
		dog.setMemberId("user");
		dog.setName("몽이");
		dog.setBirthDate("2020-01-15");
		dog.setBreedCode(2);
		dogList.add(dog);
		
		DogVO dog2 = new DogVO();
		dog2.setNo(12);
		dog2.setMemberId("user");
		dog2.setName("까망이");
		dog2.setBirthDate("2019-05-08");
		dog2.setBreedCode(1);
		dogList.add(dog2);
	
		request.getSession().setAttribute("dogList", response);
		
		//선생님 이름 목록 조회, 서비스로 바꾸기
		TeacherDAO teacherDao = new TeacherDAO();
		List<TeacherVO> teacherList = teacherDao.selectAll();
		request.setAttribute("teacherList", teacherList);
		
		// 유효한 이용권 리스트 조회 후 등록
		SubscriptionService subscriptionService = new SubscriptionService();
		// memberId 세션에서 받아오는 걸로 바꿀 것
		List<SubscriptionVO> subList =  subscriptionService.searchValidSub(member.getId());
		request.setAttribute("subList", subList);
		return "/reservation/classReservation.jsp";
	}

}
