package com.iflytek.om.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class SessionInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 获得请求的url
		String url  = request.getRequestURL().toString();
		
		if(url.contains("resources")) {
			return true;
		}else {
			// index  login不需要拦截 需要在springmvc.xml里配置
			HttpSession session = request.getSession();
			if(session.getAttribute("user") == null) {
				response.sendRedirect("index");
				return false;
			}else {
				return true;
			}
		}
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
