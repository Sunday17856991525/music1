package com.iflytek.om.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.iflytek.om.dao.CollectionDao;
import com.iflytek.om.service.CollectionService;
import com.iflytek.om.util.DBUtil;

public class CollectionServiceImpl implements CollectionService {

	public void addCollection(Integer uid ,Integer mid) {

		SqlSession session = DBUtil.sf.openSession();
		CollectionDao cd = session.getMapper(CollectionDao.class);	
		
		Map map = new HashMap();
		map.put("uid", uid);
		map.put("mid", mid);
		cd.addCollection(map);
		session.commit();
		session.close();



	}

}
