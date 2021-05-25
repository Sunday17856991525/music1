package com.iflytek.om.listener;

import java.io.Reader;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.iflytek.om.util.DBUtil;

public class InitListener implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	public void contextInitialized(ServletContextEvent arg0) {
		
		try {
			
			// 读取mybatis.xml
			Reader reader = Resources.getResourceAsReader("mybatis.xml");
			// 构建sessionfactory
			DBUtil.sf = new SqlSessionFactoryBuilder().build(reader);
			
			System.out.println("session加载完成");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("session加载失败");
		}
		
	}

}
