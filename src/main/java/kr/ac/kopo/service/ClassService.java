package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.dao.ClassDAO;
import kr.ac.kopo.vo.ClassVO;

public class ClassService {
	private ClassDAO classDao;
	
	public void createClass() {
		classDao = new ClassDAO();
		
	}
	
	public List<ClassVO> searchAll(){
		List<ClassVO> list = classDao.selectAll();
		return list;
	}
	
}
