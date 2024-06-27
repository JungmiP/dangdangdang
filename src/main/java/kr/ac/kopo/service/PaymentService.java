package kr.ac.kopo.service;

import kr.ac.kopo.dao.PassDAO;
import kr.ac.kopo.dao.PaymentDAO;
import kr.ac.kopo.dao.SubscriptionDAO;
import kr.ac.kopo.vo.PaymentVO;
import kr.ac.kopo.vo.SubscriptionVO;

public class PaymentService {
	private PaymentDAO paymentDao = new PaymentDAO();
	private SubscriptionDAO subscriptionDao = new SubscriptionDAO();
	private PassDAO passDao = new PassDAO();
	
	public void createPayment(PaymentVO pay) {
		paymentDao.insert(pay);		
						
		SubscriptionVO sub = passDao.selectForSub(pay.getPassNo());
		sub.setMemberId(pay.getMemberId());
		sub.setPaymentNo(pay.getNo());		
		
		subscriptionDao.insert(sub);
	}
}
