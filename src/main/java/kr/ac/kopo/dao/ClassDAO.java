package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.ClassVO;

public class ClassDAO {
	SqlSession session;

	public ClassDAO() {
		session = new MyBatisConfig().getInstance();
	}
	
	public List<ClassVO> selectAll(){
		List<ClassVO> list = session.selectList("dao.ClassDAO.selectAll");
		return list;
	}
	
	
}
