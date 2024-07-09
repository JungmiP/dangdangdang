package kr.ac.kopo.dao;

import java.util.List;

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
	
	public List<PaymentVO> selectAll(){
		List<PaymentVO> list = session.selectList("dao.PaymentDAO.selectAll");
		return list;
	}
	
	public List<PaymentVO> selectAll(String memberId){
		List<PaymentVO> list = session.selectList("dao.PaymentDAO.selectAll", memberId);
		return list;
	}
	
	public List<PaymentVO> selectByMemberId(String memberId){
		List<PaymentVO> list = session.selectList("dao.PaymentDAO.selectByMemberId", memberId);
		return list;
	}

	public List<PaymentVO> selectAllPaging(PaymentVO payment){
		List<PaymentVO> list = session.selectList("dao.PaymentDAO.selectAllPaging", payment);
		return list;
	}
	
	public int selectCount() {
		return session.selectOne("dao.PaymentDAO.selectCount");
	}
}
