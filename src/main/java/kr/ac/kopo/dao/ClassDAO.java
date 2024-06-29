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
	public List<Map<String, Object>> selectCntPerTeacher(String date){
		List<Map<String, Object>> list = session.selectList("dao.ClassDAO.selectCntPerTeacher", date);
		return list;
	} 
	
	// 수업 등록
	public void insert(ClassVO classVo) {
		session.insert("dao.ClassDAO.insert", classVo);
		session.commit();
	}
	
}
