package kr.ac.kopo.service;

import kr.ac.kopo.dao.RefundDAO;
import kr.ac.kopo.dao.SubscriptionDAO;
import kr.ac.kopo.vo.RefundVO;

public class RefundService {
	private RefundDAO refundDao;
	private SubscriptionDAO subscriptionDao;
	
	public RefundService() {
		refundDao = new RefundDAO();
		subscriptionDao = new SubscriptionDAO();
	}
	
	public void insert(RefundVO refund) {
		refundDao.insert(refund);
		subscriptionDao.setZeroRemainClass(refund.getPaymentNo());
	}	
	
}
