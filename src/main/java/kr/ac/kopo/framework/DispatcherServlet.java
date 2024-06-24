package kr.ac.kopo.framework;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet extends HttpServlet{
	
	private HandlerMapping mappings; 
	
	// HandlerMapping 클래스를 한번만 호출할 수 있도록 init메소드에서 생성
	@Override
	public void init(ServletConfig config) throws ServletException {
		// web.xml에서 설정한 initParam 가져오기
		String propLoc = config.getInitParameter("propLoc");
		
		mappings = new HandlerMapping(propLoc);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		uri = uri.substring(request.getContextPath().length());
		System.out.println("요청 uri: " + uri);
		
		try {
			Controller control = mappings.getController(uri);
			String callPage = control.handleRequest(request, response);
						
			RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
			dispatcher.forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		
		
		
	}
	
}
