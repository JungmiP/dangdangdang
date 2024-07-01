package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.dao.ReservationDAO;
import kr.ac.kopo.vo.ReservationVO;

public class ReservationService {
	
	private ReservationDAO reserveDao;
	
	public ReservationService() {
		reserveDao = new ReservationDAO();
	}

	
	public List<ReservationVO> searchByToday(){
		List<ReservationVO> list = reserveDao.selectByReserveDate();
		return list;
	}
	
	public List<ReservationVO> searchByReserveDate(String reserveDate){
		List<ReservationVO> list = reserveDao.selectByReserveDate(reserveDate);
		return list;
	}
	
	public void updateStatus(ReservationVO reserve) {
		reserveDao.updateStatus(reserve);
	}
	
	public int removeReserve(int no) {
		int result = reserveDao.delete(no);
		return result;
	}
	
	public void createReserve(ReservationVO reserve) {
		reserveDao.insert(reserve);
	}


	public List<ReservationVO> searchByMemberId(String memberId) {
		List<ReservationVO> list = reserveDao.selectByMemberId(memberId);
		return list;
	}
}
