package com.iflytek.om.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.iflytek.om.domain.Music;
import com.iflytek.om.domain.vo.MusicVO;

public interface MusicDao {
	
	
	public List<Music> getAllMusic();
	
	public List<Music> getMyMusic(int id);
	
	public void addMusic(Music m);
	
	public Music getMusicById(int id);
	
	public List<MusicVO> getMusicListInfo(Map map);
	
	public int getMusicListCount(@Param("name")String name);

}
	