package kr.ac.kopo.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.service.ActivityService;
import kr.ac.kopo.util.KopoFileNamePolicy;
import kr.ac.kopo.vo.ActivityVO;

public class ActivityFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	 	// 1. 인코딩 후 파라미터 추출
	 	// POST 방식일 땐 characterset 인코딩 필요
	 	request.setCharacterEncoding("utf-8");
	 	// 저장 폴더는 서버 안에 있어야함!
	 	String saveDirectory = "C:\\Projects\\dangdangdang\\src\\main\\webapp\\resources\\upload";
	 	//String realFolder= request.getServletContext().getRealPath("/upload");
	 	
	 	//cos.jar 매직넘버 형태로 넘어오는 파라미터 파싱을 위해 필요
	 	MultipartRequest multi = new MultipartRequest(
	 			request, saveDirectory, 1024*1024*5, "utf-8", new KopoFileNamePolicy());
		
	 	int dogNo = Integer.parseInt(multi.getParameter("dogNo"));
	 	String teacherId = multi.getParameter("teacherId");
	 	String activityDate = multi.getParameter("activityDate");
	 	String content = multi.getParameter("activityContent");
	 	String oriName = multi.getOriginalFileName("attachImg");
	 	String saveName = multi.getFilesystemName("attachImg");
	 	File f = multi.getFile("attachImg");
	 	long imgSize = f.length();
	 	 
	 	ActivityVO activity = new ActivityVO();
	 	activity.setDogNo(dogNo);
	 	activity.setTeacherId(teacherId);
	 	activity.setActivityDate(activityDate.substring(0, 10));
	 	activity.setContent(content);
	 	activity.setImgOriName(oriName);
	 	activity.setImgSaveName(saveName);
	 	activity.setImgSize(imgSize);
	 	
	 	ActivityService service = new ActivityService();
	 	
	 	service.createActivity(activity);
	 	
		return "/activityDetail.do?no="+activity.getNo();
	}

}
