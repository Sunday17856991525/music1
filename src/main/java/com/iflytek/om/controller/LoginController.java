package com.iflytek.om.controller;

import com.iflytek.om.domain.User;
import com.iflytek.om.service.UserService;
import com.iflytek.om.service.impl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    private UserService us = new UserServiceImpl();

    @RequestMapping("index")
    public String index() {
        return "login";
    }

    @RequestMapping("login")
    public String login(User u, Model model, HttpSession session) {
        User result = us.getUserByNameAndPass(u);
        if (result == null) {
            model.addAttribute("error", "用户名密码错误，请重新输入");
            return "login";
        } else {
            session.setAttribute("user", result);
            return "redirect:/main";
        }
    }


}
