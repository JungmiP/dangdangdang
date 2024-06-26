package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.dao.PassDAO;
import kr.ac.kopo.vo.PassVO;

public class PassService {
	private PassDAO passDao = new PassDAO();
	
	public List<PassVO> searchAll(){
		List<PassVO> list = passDao.selectAll();
		return list;
	}
}
