package kr.ac.kopo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.ClassVO;

public class ClassDAO {
	SqlSession session;

	public ClassDAO() {
		session = new MyBatisConfig().getInstance();
	}
	
	// 모든 수업 조회
	public List<ClassVO> selectAll(){
		List<ClassVO> list = session.selectList("dao.ClassDAO.selectAll");
		return list;
	}
	
	// 해당 날짜에 선생님 당 수업 수 조회
	public List<Map<String, Object>> selectCntPerTeacher(int date){
		List<Map<String, Object>> list = session.selectList("dao.ClassDAO.selectCntPerTeacher", date);
		return list;
	} 
	
	// 날짜별 선생님 별 수업 조회
	public List<ClassVO> selectByDate(ClassVO classVo){
		List<ClassVO> list = session.selectList("dao.ClassDAO.selectByDate", classVo);
		return list;
	}
	
	
	// 수업 등록
	public void insert(ClassVO classVo) {
		session.insert("dao.ClassDAO.insert", classVo);
		session.commit();
	}

	public void delete(int no) {
		session.delete("dao.ClassDAO.delete", no);
		session.commit();		
	}

	public void updateAttendance(int classNo) {
		session.update("dao.ClassDAO.updateAttendance", classNo);
		session.commit();
	}

	public ClassVO selectByNo(int classNo) {
		ClassVO classVo = session.selectOne("dao.ClassDAO.selectByNo", classNo);
		return classVo;
	}

	public void updateStatus(ClassVO classVo) {
		session.update("dao.ClassDAO.updateStatus", classVo);
	}
	
	
	public ClassVO selectByDogNoAndDate(ClassVO classVo) {
		return session.selectOne("dao.ClassDAO.selectByDogNoAndDate", classVo);
	}
}
