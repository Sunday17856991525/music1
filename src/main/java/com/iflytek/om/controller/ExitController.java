package com.iflytek.om.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExitController {
	
	@RequestMapping("exit")
	public String index(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/index"; // 默认forward
	}
	
}
