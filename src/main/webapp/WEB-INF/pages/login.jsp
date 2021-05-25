<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>在线音乐播放平台-登录页面</title>
		
		<style type="text/css">
			#main{
				width:400px;
				margin:100px auto;
				padding-right:140px;
			}
			h1{
				
				text-align: center;
				margin-bottom: 20px;
				margin-left:90px;
			}
		</style>
		<script type="text/javascript">
			if (window != top){
				top.location.href = location.href;
			}
		</script>
	</head>
	<body>
		<div id="main">
			<h1>在线音乐播放平台</h1>
			<form class="layui-form" action="${ctx}/login" method="post">
			  <div class="layui-form-item">
			  	<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
				  <input type="text" name="username" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
				</div>
			  </div>
			  <div class="layui-form-item">
			  	<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
				  <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
				</div>
			  </div>
			  
			  <div class="layui-form-item">
				<div class="layui-input-block">
				  <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="formDemo">立即提交</button>
				</div>
			  </div>
			  <div class="layui-form-item">
				<div class="layui-input-block">
					<span style="color:red">${error}</span>
				</div>
			  </div>
			</form>
			
		</div>
		<script type="text/javascript">
			layui.use('form', function(){
			  var form = layui.form;
			});
		</script>
	</body>
</html>
