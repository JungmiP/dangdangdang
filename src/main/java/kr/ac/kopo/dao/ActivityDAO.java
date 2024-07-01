package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.ActivityVO;

public class ActivityDAO {
	private SqlSession session;
	
	
	public ActivityDAO() {
		session = new MyBatisConfig().getInstance();
	}

	public ActivityVO selectByNo(int no) {
		ActivityVO activity = session.selectOne("dao.ActivityDAO.selectByNo", no);
		return activity;
	}
	
	public List<ActivityVO> selectByDate(ActivityVO activity){
		List<ActivityVO> list = session.selectList("dao.ActivityDAO.selectByDate", activity);
		return list;
	}
	
	public void insert(ActivityVO activity) {
		int no = session.insert("dao.ActivityDAO.insert", activity);
		session.commit();
		
	}

	public List<ActivityVO> selectByDogNo(int dogNo) {
		List<ActivityVO> list = session.selectList("dao.ActivityDAO.selectByDogNo", dogNo);
		return list;
	}

}
