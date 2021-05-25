package com.iflytek.om.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iflytek.om.domain.Music;
import com.iflytek.om.domain.PageBean;
import com.iflytek.om.domain.User;
import com.iflytek.om.domain.vo.MusicVO;
import com.iflytek.om.service.CollectionService;
import com.iflytek.om.service.MusicService;
import com.iflytek.om.service.impl.CollectionServiceImpl;
import com.iflytek.om.service.impl.MusicServiceImpl;
import com.iflytek.om.util.Util;

@Controller
public class MusicController{
	
	private MusicService ms = new MusicServiceImpl();
	private CollectionService cs = new CollectionServiceImpl();
	
	
	@RequestMapping("main")
	public String index() {
		return "main";
	}
	
	@RequestMapping("allmusic")
	public String allMusic(Model model,HttpSession session) {
		return this.query("", model, null ,session);
	}
	
	@RequestMapping("mymusic")
	public String myMusic(HttpSession session , Model model) {
		int uid = ((User)session.getAttribute("user")).getId();
		List<Music> list = ms.getMyMusic(uid);
		model.addAttribute("list", list);
		return "mymusic";
	}
	
	@RequestMapping("goupload")
	public String goUpload() {
		return "upload";
	}
	
	@RequestMapping("upload")
	public String upload(Music music , MultipartFile file , HttpSession session) {
		
		String ex = file.getOriginalFilename().split("\\.")[1];
		String filename = Util.getRandomName()+ "." + ex;
		
		
		File tofile = new File("e:/musicpath" , filename);
		
		try {
			file.transferTo(tofile);
			
			// 保存数据库
			User user = (User)session.getAttribute("user");
			music.setUploadName(filename);
			music.setUploadUser(user);
			ms.addMusic(music);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mymusic";
	}
	
	
	@RequestMapping("goPlay/{id}")
	public String goPlay(@PathVariable("id") Integer id , Model model) {
		Music m = ms.getMusicById(id);
		model.addAttribute("m", m);
		return "play";
	}
	
	
	@RequestMapping("query")
	public String query(String name , Model model , Integer pageNum ,HttpSession session) {
		
		// 当前页码
		int pageSize = 1;
		if(pageNum != null) {
			pageSize = pageNum.intValue();
		}
		
		// 数据总数
		int totalCount = ms.getMusicListCount(name);
		// 每页显示4个
		int everyPageSize = 4;
		
		int start = (pageSize - 1) * everyPageSize;
		int end = everyPageSize;
		
		PageBean pb = new PageBean();
		pb.setEveryPageSize(everyPageSize);
		pb.setPageSize(pageSize);
		pb.setTotalCount(totalCount);
		
		int uid = ((User)session.getAttribute("user")).getId();
		
		List<MusicVO> list = ms.getMusicListInfo(name , start , end , uid);
		model.addAttribute("mlist", list);
		model.addAttribute("name", name);
		model.addAttribute("pb", pb);
		return "allmusic";
		
	}
	
	@RequestMapping("collection")
	@ResponseBody
	private void collection(Integer mid , HttpSession session ) {
		int uid = ((User)session.getAttribute("user")).getId();
		cs.addCollection(uid, mid);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}