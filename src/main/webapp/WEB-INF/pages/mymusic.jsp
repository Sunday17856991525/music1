<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<blockquote class="layui-elem-quote">我的音乐</blockquote>
		
		<a href="${ctx}/goupload" class="layui-btn">上传音乐</a>
		
		<table class="layui-table">
		  <colgroup>
			<col width="60">
			<col>
			<col width="150">
			<col width="150">
			<col width="150">
			<col width="150">
			<col width="150">
		  </colgroup>
		  <thead>
			<tr>
			  <th>编号</th>
			  <th>歌曲名</th>
			  <th>歌手</th>
			  <th>专辑</th>
			  <th>上传者</th>
			  <th>上传时间</th>
			  <th>操作</th>
			</tr> 
		  </thead>
		  <tbody>
		  
		  <c:forEach items="${list}" var="o"> 
		  	 <tr>
			  <td>${o.id}</td>
			  <td>${o.name}</td>
			  <td>${o.singer}</td>
			  <td>${o.special}</td>
			  <td>${o.uploadUser.username}</td>
			  <td>${o.uploadTime}</td>
			  <td>
				  <button class="layui-btn layui-btn-xs" onclick="">播放</button>
				  <button class="layui-btn layui-btn-xs" onclick="">收藏</button>
			  </td>
			</tr>
		  </c:forEach>
			
		  </tbody>
		</table>
		
	</body>
</html>
