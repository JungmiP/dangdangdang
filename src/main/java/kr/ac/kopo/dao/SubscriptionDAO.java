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
	
	public int delete(int no) {
		int result = session.delete("dao.SubscriptionDAO.delete", no);
		session.commit();
		return result;
	}

	public void subtractClass(int no) {
		session.update("dao.SubscriptionDAO.subtractRemainClasses", no);
		session.commit();
		
	}

	public void addClass(int no) {
		session.update("dao.SubscriptionDAO.addRemainClasses", no);
		session.commit();
		
	}
	
	public void setZeroRemainClass(int paymentNo) {
		session.update("dao.SubscriptionDAO.setZeroRemainClasses", paymentNo);
		session.commit();
		
	}
	
	
	public List<SubscriptionVO> selectAll(){
		List<SubscriptionVO> list = session.selectList("dao.SubscriptionDAO.selectAll");
		return list;
	}
	
	public List<SubscriptionVO> selectAll(String memberId){
		List<SubscriptionVO> list = session.selectList("dao.SubscriptionDAO.selectAll", memberId);
		return list;
	}
}
