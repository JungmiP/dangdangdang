package kr.ac.kopo.dao;

import org.apache.ibatis.session.SqlSession;

public class PaymentDAO {
	private SqlSession session;

	public PaymentDAO() {
		session = new MyBatisConfig().getInstance();
		System.out.println("session: "+ session);
	}
	
}
