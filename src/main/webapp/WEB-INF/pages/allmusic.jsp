<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		
		<script type="text/javascript">
			
			function doPlay(id){
				parent.doPlay(id);
			}
			
			function doCollection(mid,obj){
				$.post("${ctx}/collection","{mid:mid}",function(data){
					//收藏成功
					alert("收藏成功！");
					$(obj).parent().html('<a href="javascript:void(0)" class="layui-btn layui-btn-xs layui-btn-warm">已收藏</a>');
				});
			}
		</script>
		
	</head>
	<body>
		<blockquote class="layui-elem-quote">所有音乐</blockquote>
		
		<div id="content" style="text-align: center;">
			<form class="layui-form" action="${ctx}/query" method="post" id="myform">
				<div class="layui-input-inline">
					<label class="layui-input-inline">歌曲名：</label>
					<div class="layui-input-inline">
						<input type="text" class="layui-input" name="name" value="${name}" >
					</div>
				 </div>
				<div class="layui-input-inline">
					<div class="layui-input-inline">
						<button class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
					</div>
				 </div>
				<input type="hidden" id="pageSize" name="pageNum" value="" />
			</form>
		</div>
		
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
		  
		  <c:forEach items="${mlist}" var="o"> 
		  	 <tr>
			  <td>${o.id}</td>
			  <td>${o.name}</td>
			  <td>${o.singer}</td>
			  <td>${o.special}</td>
			  <td>${o.uploadUser.username}</td>
			  <td>${o.uploadTime}</td>
			  <td>
				  <button class="layui-btn layui-btn-xs" onclick="doPlay(${o.id})">播放</button>
				  
				  <span>
					  <c:choose>
					  	<c:when test="${o.collection == 0}"> 
					  		<a href="javascript:void(0)" onclick="doCollection(${o.id} , this)" class="layui-btn layui-btn-xs layui-btn-warm">收藏</a>
					  	</c:when>
					  	<c:otherwise>
					  		<a href="javascript:void(0)" class="layui-btn layui-btn-xs layui-btn-warm">已收藏</a>
					  	</c:otherwise>	
					  </c:choose>
				  </span>
				  
			  </td>
			</tr>
		  </c:forEach>
			
		  </tbody>
		</table>
		<div id="pagediv" style="text-align: right;">
			<div id="demo0"></div>
		</div>
		
		<script type="text/javascript">
			layui.use(['laypage', 'layer'], function(){
				var laypage = layui.laypage;
				laypage.render({
					elem: 'demo0' 
					,count: '${pb.totalCount}' //数据总数
					,limit: '${pb.everyPageSize}'  // 每页显示数
					,curr: '${pb.pageSize}'  // 当前页码
					,jump: function(obj, first){
		                //obj包含了当前分页的所有参数，比如：
		                //console.log(obj.curr);  //得到当前页，以便向服务端请求对应页的数据。
		                //console.log(obj.limit); //得到每页显示的条数
		                //首次不执行,使用原始的curr,后面需要自己通过回传来更新
		                var curr = obj.curr;
		                if(!first){
		                	$("#pageSize").val(obj.curr);
		                	$("#myform").submit();
		                }
		            }
				 });
			});
			
		</script>
		
		
		
		
		
	</body>
</html>
