package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.PassVO;

public class PassDAO {
	private SqlSession session;

	public PassDAO() {
		session = new MyBatisConfig().getInstance();
		System.out.println("session: " + session);
	}
	
	public List<PassVO> selectAll() {
		List<PassVO> list = session.selectList("dao.PassDAO.selectAll");
		return list;
	}
	
	public PassVO selectOne(int no) {
		PassVO pass = session.selectOne("dao.PassDAO.selectByNo", no);
		return pass;
	}
	
	public void insert() {
		
	}
	
}
