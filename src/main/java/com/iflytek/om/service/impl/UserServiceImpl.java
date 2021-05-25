package com.iflytek.om.service.impl;

import org.apache.ibatis.session.SqlSession;

import com.iflytek.om.dao.UserDao;
import com.iflytek.om.domain.User;
import com.iflytek.om.service.UserService;
import com.iflytek.om.util.DBUtil;

public class UserServiceImpl implements UserService {

	
	public User getUserByNameAndPass(User u) {
		SqlSession session = DBUtil.sf.openSession();
		UserDao ud = session.getMapper(UserDao.class);
		return ud.getUserByNameAndPass(u);
	}
	
	
	
}
