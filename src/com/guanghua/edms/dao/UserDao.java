package com.guanghua.edms.dao;

import com.guanghua.edms.domain.UserInfo;

public interface UserDao {
	
	public UserInfo getUserByUserName(String userName);
	
}
