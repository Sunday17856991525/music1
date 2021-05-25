<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="layui-header">
	<div class="layui-logo">在线音乐播放平台</div>
	<!-- 头部区域（可配合layui已有的水平导航） -->
	<ul class="layui-nav layui-layout-right">
	  <li class="layui-nav-item">
		<a href="javascript:;">
		  <i class="layui-icon layui-icon-username" style="font-size: 20px;"></i>
		  ${sessionScope.user.username}
		</a>
		<dl class="layui-nav-child">
		  <dd><a href="">修改密码</a></dd> 
		</dl>
	  </li>
	  <li class="layui-nav-item"><a href="${ctx}/exit">退了</a></li>
	</ul>
  </div>
