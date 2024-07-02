package kr.ac.kopo.dao;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.RefundVO;

public class RefundDAO {
	SqlSession session;

	public RefundDAO() {
		session = new MyBatisConfig().getInstance();
	}

	public void insert(RefundVO refund) {
		session.insert("dao.RefundDAO.insert", refund);
		session.commit();
	}
	
}
