package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.SubscriptionVO;

public class SubscriptionDAO {
	private SqlSession session;

	public SubscriptionDAO() {
		session = new MyBatisConfig().getInstance();
	}
	
	// 이용권 하나 삽입
	public void insert(SubscriptionVO sub) {
		session.insert("dao.SubscriptionDAO.insert", sub);
		session.commit();
	}
	
	// memberId로 유효한 이용권 리스트 조회
	public List<SubscriptionVO> selectValidSub(String memberId){
		List<SubscriptionVO> list = session.selectList("dao.SubscriptionDAO.selectValidSub", memberId);
		return list;
	}
	
	
}
