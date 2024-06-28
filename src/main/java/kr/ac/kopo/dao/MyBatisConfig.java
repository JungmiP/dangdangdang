package kr.ac.kopo.dao;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConfig {
	private SqlSession session;
	protected MyBatisConfig() {
		try {
			String resource = "/bin/mybatis-config.xml";
			
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sqlSessionFactory.openSession();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	protected SqlSession getInstance() {
		return session;
	}
}
