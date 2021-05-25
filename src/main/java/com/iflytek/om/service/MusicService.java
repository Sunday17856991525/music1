package com.iflytek.om.service;

import java.util.List;

import com.iflytek.om.domain.Music;
import com.iflytek.om.domain.vo.MusicVO;

public interface MusicService {
	
	public List<Music> getAllMusic();
	public List<Music> getMyMusic(int id);
	public void addMusic(Music m);
	public Music getMusicById(int id);
	public List<MusicVO> getMusicListInfo(String name , int start , int end ,int uid);
	public int getMusicListCount(String name);
	
	
}
 