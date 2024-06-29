package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.vo.DogVO;
import kr.ac.kopo.vo.MemberVO;

public class LoginController implements Controller{

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
	
		request.getSession().setAttribute("dogList", dogList);
		return "/index.jsp";
	}
	
}
