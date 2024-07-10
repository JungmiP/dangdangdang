package kr.ac.kopo.dao;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.MemberVO;

public class MemberDAO {
	private SqlSession session;

	public MemberDAO() {
		session = new MyBatisConfig().getInstance();
	}
	
	public MemberVO selectById(String id) {
		MemberVO member = session.selectOne("dao.MemberDAO.selectById", id);
		return member;
	}
}
