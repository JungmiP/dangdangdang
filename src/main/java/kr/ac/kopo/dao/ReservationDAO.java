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
	
	public List<ReservationVO> selectByMemberId(String memberId){
		List<ReservationVO> list = session.selectList("dao.ReservationDAO.selectByMemberId", memberId);
		return list;
	}
	
	public int delete(int no) {
		int result = session.delete("dao.ReservationDAO.delete", no);
		session.commit();
		return result;
	}
	
	public void insert(ReservationVO reserve) {
		session.insert("dao.ReservationDAO.insert", reserve);
		session.commit();
	}

	public void updateStatus(ReservationVO reserve) {
		session.update("dao.ReservationDAO.updateStatus", reserve);
		session.commit();
		
	}
	
	
	
}
