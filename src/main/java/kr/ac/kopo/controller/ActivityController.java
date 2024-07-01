package kr.ac.kopo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.ActivityService;
import kr.ac.kopo.vo.ActivityVO;
import kr.ac.kopo.vo.DogVO;

public class ActivityController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<DogVO> dogList = (List<DogVO>)request.getSession().getAttribute("dogList");
		if(dogList != null) {
			Map<String, List<ActivityVO>> activityMap = new HashMap<>();
			ActivityService service = new ActivityService();
			for(DogVO dog : dogList) {
				int no = dog.getNo();
				List<ActivityVO> list = service.searchActivityByDogNo(no);
				activityMap.put(dog.getName(), list);
			}
			request.setAttribute("activityMap", activityMap);
		}
				
		
		return "/activity/activity.jsp";
	}

}
