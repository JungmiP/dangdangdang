package kr.ac.kopo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {
	private String encoding = null;
	
	public void init(FilterConfig config) throws ServletException {
		this.encoding = config.getInitParameter("encoding");
		System.out.println(config.getFilterName() + "필터 시작");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if(request.getCharacterEncoding() == null) {
			if(encoding != null) {
				request.setCharacterEncoding(encoding);
				response.setCharacterEncoding(encoding);
			}
		}
		chain.doFilter(request, response);
	}

}
