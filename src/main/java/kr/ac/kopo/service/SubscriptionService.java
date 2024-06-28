package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.dao.SubscriptionDAO;
import kr.ac.kopo.vo.SubscriptionVO;

public class SubscriptionService {
	private SubscriptionDAO subscriptionDao;

	public SubscriptionService() {
		subscriptionDao = new SubscriptionDAO();
	}
	
	public List<SubscriptionVO> searchValidSub(String memberId){
		List<SubscriptionVO> list = subscriptionDao.selectValidSub(memberId);
		return list;
	}
	
	
}
