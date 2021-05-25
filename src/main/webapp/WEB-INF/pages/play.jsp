<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<blockquote class="layui-elem-quote">播放音乐</blockquote>
		
		<div id="main" style="padding:15px;margin:40px auto;margin-left:40px">
			<div id="skPlayer"></div>
			<script src="skPlayer.min.js"></script>
			<script src="${ctx}/resources/player/skPlayer.min.js" type="text/javascript"></script>
		</div>
		<script type="text/javascript">
			//layui.use('form', function(){
			//  var form = layui.form;
			//});
			
			var player = new skPlayer({
                autoplay: true,
                //可选项,自动播放,默认为false,true/false
                listshow: true,
                //可选项,列表显示,默认为true,true/false
                mode: 'listloop',
                //可选项,循环模式,默认为'listloop'
                //'listloop',列表循环
                //'singleloop',单曲循环
                music: {
                    //必需项,音乐配置
                    type: 'file',
                    //必需项,网易云方式指定填'cloud'
                    source: [
							//必需项,音乐文件数组
								{
									name: '${m.name}',
									//必需项,歌名
									author: '${m.singer}-${m.special}',
									//必需项,歌手
									src: '${ctx}/musicpath/${m.uploadName}',
									//必需项,音乐文件
									cover: '${ctx}/resources/player/cover.jpg'
									//必需项,封面图片
								}
							]
                }
            });
			
		</script>
	</body>
</html>
