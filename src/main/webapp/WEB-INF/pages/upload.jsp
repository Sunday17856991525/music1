<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<blockquote class="layui-elem-quote">上传音乐</blockquote>
		
		<div id="main" style="padding:15px;">
			<form class="layui-form" action="${ctx}/upload" method="post" id="myform" enctype="multipart/form-data">
				
			  <div class="layui-form-item">
				<label class="layui-form-label">歌曲名</label>
				<div class="layui-input-inline">
				  <input type="text" name="name" required  lay-verify="required" placeholder="请输入歌曲名" autocomplete="off" class="layui-input">
				</div>
			  </div>
			  <div class="layui-form-item">
				<label class="layui-form-label">歌手</label>
				<div class="layui-input-inline">
				  <input type="text" name="singer" required  lay-verify="required" placeholder="请输入歌手" autocomplete="off" class="layui-input">
				</div>
			  </div>
			  <div class="layui-form-item">
				<label class="layui-form-label">专辑</label>
				<div class="layui-input-inline">
				  <input type="text" name="special" required  lay-verify="required" placeholder="请输入专辑" autocomplete="off" class="layui-input">
				</div>
			  </div>
			  <div class="layui-form-item">
				<label class="layui-form-label">请选择文件</label>
				<div class="layui-input-inline">
				  <input type="file" name="file" required  lay-verify="required" placeholder="请选择文件" autocomplete="off" class="layui-input">
				</div>
			  </div>
			  
			  <div class="layui-form-item">
				<div class="layui-input-block">
				  <button class="layui-btn" type="submit" >上传</button>
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
