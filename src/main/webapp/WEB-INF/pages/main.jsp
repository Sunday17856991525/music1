<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>在线音乐播放平台-首页面</title>
		
		<style type="text/css">
			#iframe1{
				width: 100%;
				margin: 0 0 1px;
				border: 0px;
			}
		</style>
		<script type="text/javascript">
			
			var layer = null;
			layui.use('layer', function(){
			  layer = layui.layer;
			});
			
			function setIframeHeight() {
				var iframe = document.getElementById("iframe1");
				iframe.height = 0 + "px";
				var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
				if (iframeWin.document.body) {
					iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
				}
			}
			
			
			function doPlay(id){
				layer.open({
					title:'播放音乐',
					offset: '100px',
					type: 2,
					area: ['570px', '450px'], //宽高
					content: '${ctx}/goPlay/' + id
				});
			}
			
		</script>
	</head>
	<body>
		<div class="layui-layout layui-layout-admin">
		  
		  <%@ include file="head.jsp" %>
		  
		  <div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
			  <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
			  <ul class="layui-nav layui-nav-tree"  lay-filter="test">
				<li class="layui-nav-item layui-this"><a href="${ctx}/allmusic" target="main"><i class="layui-icon layui-icon-set-sm" ></i>所有音乐</a></li>
				<li class="layui-nav-item"><a href="${ctx}/mymusic" target="main"><i class="layui-icon layui-icon-set-sm" ></i>我的音乐</a></li>
				<li class="layui-nav-item"><a href="${ctx}/mymusic" target="main"><i class="layui-icon layui-icon-set-sm" ></i>我的收藏</a></li>
			  </ul>
			</div>
		  </div>
		  
		  <div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="padding: 15px;">
			  <iframe src="${ctx}/allmusic" id="iframe1" name="main" onload="setIframeHeight()">
			  </iframe>
			</div>
		  </div>
		  
		  <div class="layui-footer">
			<!-- 底部固定区域 -->
			© layui.com - 底部固定区域
		  </div>
		</div>
		<script>
		//JavaScript代码区域
		layui.use('element', function(){
		  var element = layui.element;
		  
		});
		</script>
	</body>
</html>
