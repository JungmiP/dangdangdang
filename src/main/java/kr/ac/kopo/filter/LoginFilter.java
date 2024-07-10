package kr.ac.kopo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.vo.MemberVO;

public class LoginFilter implements Filter {
	
	
	public void init(FilterConfig config) throws ServletException {
		
		System.out.println(config.getFilterName() + "필터 시작");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		String id= httpRequest.getParameter("id");
		MemberVO member = new MemberDAO().selectById(id);
		
		if(member != null)
			httpRequest.getSession().setAttribute("member", member);
		
		chain.doFilter(request, response);
	}

}
