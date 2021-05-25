package com.iflytek.om.service.impl;

import com.iflytek.om.dao.MusicDao;
import com.iflytek.om.domain.Music;
import com.iflytek.om.domain.vo.MusicVO;
import com.iflytek.om.service.MusicService;
import com.iflytek.om.util.DBUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MusicServiceImpl implements MusicService {

	public List<Music> getAllMusic() {
		SqlSession session = DBUtil.sf.openSession();
		MusicDao md = session.getMapper(MusicDao.class);
		return md.getAllMusic();
	}

	public List<Music> getMyMusic(int id) {
		SqlSession session = DBUtil.sf.openSession();
		MusicDao md = session.getMapper(MusicDao.class);
		return md.getMyMusic(id);
	}

	public void addMusic(Music m) {
		SqlSession session = DBUtil.sf.openSession();
		MusicDao md = session.getMapper(MusicDao.class);
		md.addMusic(m);
		session.commit();
	}
	public Music getMusicById(int id) {
		SqlSession session = DBUtil.sf.openSession();
		MusicDao md = session.getMapper(MusicDao.class);
		return md.getMusicById(id);
	}

	public List<MusicVO> getMusicListInfo(String name , int start , int end ,int uid) {
		SqlSession session = DBUtil.sf.openSession();
		MusicDao md = session.getMapper(MusicDao.class);
		
		Map map = new HashMap();
		map.put("name", name);
		map.put("start", start);
		map.put("end", end); 	
		map.put("uid", uid);
		List<MusicVO> list = md.getMusicListInfo(map);
		session.close();
		return list;
	}	

	public int getMusicListCount(String name) {
		SqlSession session = DBUtil.sf.openSession();
		MusicDao md = session.getMapper(MusicDao.class);
		return md.getMusicListCount(name);
	}

}
