package kr.ac.kopo.dao;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.PaymentVO;

public class PaymentDAO {
	private SqlSession session;

	public PaymentDAO() {
		session = new MyBatisConfig().getInstance();
	}
	
	public void insert(PaymentVO pay) {
		session.insert("dao.PaymentDAO.insert", pay);
		session.commit();
	}

		
}
