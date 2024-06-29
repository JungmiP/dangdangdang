package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.dao.ClassDAO;
import kr.ac.kopo.vo.ClassVO;

public class ClassService {
	private ClassDAO classDao;
	
	public ClassService() {
		classDao = new ClassDAO();
		
	}
	
	public List<ClassVO> searchAll(){
		List<ClassVO> list = classDao.selectAll();
		return list;
	}
	
	public void createClass(ClassVO classVo) {
		classDao.insert(classVo);
	}
	
	public List<Map<String, Object>> searchCntPerTeacher(String date){
		List<Map<String, Object>> list = classDao.selectCntPerTeacher(date);
		return list;
	}
}
