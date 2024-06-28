package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.TeacherVO;

public class TeacherDAO {
	private SqlSession session;
	public TeacherDAO() {
		session = new MyBatisConfig().getInstance();
	}
	
	public List<TeacherVO> selectAll() {
		List<TeacherVO> list = session.selectList("dao.TeacherDAO.selectAll");
		return list;
	}
	
}
