package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.dao.ClassDAO;
import kr.ac.kopo.dao.SubscriptionDAO;
import kr.ac.kopo.vo.ClassVO;

public class ClassService {
	private ClassDAO classDao;
	private SubscriptionDAO subscriptionDao;
	
	public ClassService() {
		classDao = new ClassDAO();
		subscriptionDao = new SubscriptionDAO();
	}
	
	public List<ClassVO> searchAll(){
		List<ClassVO> list = classDao.selectAll();
		return list;
	}
	
	public void createClass(ClassVO classVo) {
		classDao.insert(classVo);
		// 이용권 하나 빼기
		subscriptionDao.subtractClass(classVo.getSubscriptionNo());
	}
	
	public List<Map<String, Object>> searchCntPerTeacher(String date){
		int param = Integer.parseInt(date);
		List<Map<String, Object>> list = classDao.selectCntPerTeacher(param);
		return list;
	}
	
	public List<ClassVO> searchClassListByDate(ClassVO classVo){
		List<ClassVO> list = classDao.selectByDate(classVo);
		return list;
	}
	
	// class 출석 체크 변경
	public void changeAttendance(int classNo) {
		classDao.updateAttendance(classNo);
	}
	
	
	// class 예약 삭제
	public void removeClass(ClassVO classVo) {
		// 이용권 하나 회복
		subscriptionDao.addClass(classVo.getSubscriptionNo());
		classDao.delete(classVo.getNo());
	}

	public ClassVO searchOne(int classNo) {
		ClassVO classVo = classDao.selectByNo(classNo);
		return classVo;
		
	}
}
