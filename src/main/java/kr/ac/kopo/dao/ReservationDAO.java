package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.ReservationVO;

public class ReservationDAO {
	private SqlSession session;

	public ReservationDAO() {
		session = new MyBatisConfig().getInstance();
	}
	
	public List<ReservationVO> selectAll(){
		List<ReservationVO> list = session.selectList("dao.ReservationDAO.selectAll");
		return list;
	}
	
	public List<ReservationVO> selectByReserveDate(){
		List<ReservationVO> list = session.selectList("dao.ReservationDAO.selectByReserveDate");
		return list;
	}

	public List<ReservationVO> selectByReserveDate(String reserveDate){
		List<ReservationVO> list = session.selectList("dao.ReservationDAO.selectByReserveDate", reserveDate);
		return list;
	}
	
	public void insert(ReservationVO reserve) {
		session.insert("dao.ReservationDAO.insert", reserve);
		session.commit();
	}
	
	
	
}
