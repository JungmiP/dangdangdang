package kr.ac.kopo.framework;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

// uri와 Controller를 맵핑해주는 클래스
public class HandlerMapping {
	private Map<String, Controller> mappings;
	
	
	
	// uri와 controller 인스턴스를 맵에 저장
	public HandlerMapping(String propLoc) {
		mappings = new HashMap<>();
		
		Properties prop = new Properties();
		try(
			
			InputStream is = new FileInputStream(propLoc);
				
		){
			prop.load(is);
			Set<Object> keys = prop.keySet();
			
			for(Object key : keys) {
				String className = prop.getProperty(key.toString());
				
				// reflaction? 동적으로 클래스명을 이용해서 런타임시 클래스 생성
				Class<?> clz = Class.forName(className);
				Constructor<?> constructor = clz.getConstructor();
				Controller control = (Controller)constructor.newInstance();
				mappings.put(key.toString(), control);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Controller getController(String uri) {
		return mappings.get(uri);
	}
}
