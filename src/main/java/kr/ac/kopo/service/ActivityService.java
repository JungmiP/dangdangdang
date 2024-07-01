package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.dao.ActivityDAO;
import kr.ac.kopo.vo.ActivityVO;

public class ActivityService {
	private ActivityDAO activityDao;
	
	
	public ActivityService() {
		activityDao = new ActivityDAO();
	}


	public void createActivity(ActivityVO activity) {
		activityDao.insert(activity);
	}


	public ActivityVO searchActivity(int no) {
		ActivityVO activity = activityDao.selectByNo(no);
		return activity;
	}


	public List<ActivityVO> searchActivityByDogNo(int dogNo) {
		List<ActivityVO> list = activityDao.selectByDogNo(dogNo);
		return list;
	}

}
