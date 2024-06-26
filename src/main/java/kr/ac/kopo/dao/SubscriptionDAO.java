package kr.ac.kopo.dao;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.SubscriptionVO;

public class SubscriptionDAO {
	private SqlSession session;

	public SubscriptionDAO() {
		session = new MyBatisConfig().getInstance();
	}
	
	
	public void insert(SubscriptionVO sub) {
		session.insert("dao.SubscriptionDAO.insert", sub);
		session.commit();
	}
	
	
}
