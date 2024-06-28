package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.dao.ReservationDAO;
import kr.ac.kopo.vo.ReservationVO;

public class ReservationService {
	private ReservationDAO reserveDao = new ReservationDAO();
	
	
	
	public List<ReservationVO> searchByToday(){
		List<ReservationVO> list = reserveDao.selectByReserveDate();
		return list;
	}
	
	public List<ReservationVO> searchByReserveDate(String reserveDate){
		List<ReservationVO> list = reserveDao.selectByReserveDate(reserveDate);
		return list;
	}
	
	public void createReserve(ReservationVO reserve) {
		reserveDao.insert(reserve);
	}
}