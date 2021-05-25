package com.iflytek.om.dao;

import com.iflytek.om.domain.User;

public interface UserDao {
	
	public User getUserByNameAndPass(User u);
	
}
