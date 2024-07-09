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
//		MemberVO member = new MemberVO();
//		member.setId("pjm330");
//		member.setName("박정미");
//		
//		
//		 
//		//member.setId("lora");
//		//member.setName("로라");
//		//member.setAdmin("A");
//		
//		request.getSession().setAttribute("member", member);
//		if(member.getAdmin() != null) {
//			return "/admin.jsp";
//		}
//		
//		List<DogVO> dogList = new ArrayList<>();
//		
//		DogVO dog = new DogVO();
//		dog.setNo(13);
//		dog.setMemberId("pjm330");
//		dog.setName("두부");
//		dog.setBirthDate("2020-01-15");
//		dog.setBreedCode(3);
//		dogList.add(dog);
//		
//		DogVO dog2 = new DogVO();
//		dog2.setNo(14);
//		dog2.setMemberId("pjm330");
//		dog2.setName("콩이");
//		dog2.setBirthDate("2019-05-08");
//		dog2.setBreedCode(4);
//		dogList.add(dog2);
//		
//		request.getSession().setAttribute("dogList", dogList);
		return "redirect:http://172.31.9.175:8080/loginForm";
	}
	
}
