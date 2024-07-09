package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.dao.PassDAO;
import kr.ac.kopo.dao.PaymentDAO;
import kr.ac.kopo.dao.SubscriptionDAO;
import kr.ac.kopo.util.Paging;
import kr.ac.kopo.vo.PaymentVO;
import kr.ac.kopo.vo.SubscriptionVO;

public class PaymentService {
	
	private PaymentDAO paymentDao;
	private SubscriptionDAO subscriptionDao;
	private PassDAO passDao;
	
	public PaymentService() {
		paymentDao = new PaymentDAO();
		subscriptionDao = new SubscriptionDAO();
		passDao = new PassDAO();
	}

	public void createPayment(PaymentVO pay) {
		paymentDao.insert(pay);		
						
		SubscriptionVO sub = passDao.selectForSub(pay.getPassNo());
		sub.setMemberId(pay.getMemberId());
		sub.setPaymentNo(pay.getNo());		
		
		subscriptionDao.insert(sub);
	}
	
	public List<PaymentVO> searchAll(){
		List<PaymentVO> list = paymentDao.selectAll();
		return list;
	}
	
	public List<PaymentVO> searchAll(String memberId){
		List<PaymentVO> list = paymentDao.selectAll(memberId);
		return list;
	}

	public List<PaymentVO> searchByMemberId(String memberId){
		List<PaymentVO> list = paymentDao.selectByMemberId(memberId);
		return list;
	}
	
	public List<PaymentVO> searchAllPaging(PaymentVO payment){
		if(payment.getPaging() == null) {
			payment.setPaging(new Paging());
		}
		
		int count = paymentDao.selectCount();
		payment.getPaging().setRecordTotalCount(count);
		List<PaymentVO> list = null;
		if(count > 0) {
			payment.getPaging().processOne();
			list = paymentDao.selectAllPaging(payment);
		}
		return list;
	}
}
