<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/tagslib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人信息</title>
		<style type="text/css">
		</style>
	</head>
	<body style="height:100%;">
		<div class="container-fluid iframe-offset-y">
			<form class="layui-form">
				<div class="layui-form-item">
					<div class="layui-form-label">用户名</div>
					<div class="layui-input-block">
						<div class="layui-inline">
							<input class="layui-input" required lay-verify="required"
							 name="name" type="text" value="${user.name }"/>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-form-label">性别</div>
					<div class="layui-input-block">
						<c:choose>
							<c:when test="${user.gender == 1 }">
							<input type="radio" name="gender" value="1" title="男" checked/>
							<input type="radio" name="gender" value="2" title="女"/>
							<input type="radio" name="gender" value="3" title="保密"/>
							</c:when>
							<c:when test="${user.gender == 2 }">
							<input type="radio" name="gender" value="1" title="男"/>
							<input type="radio" name="gender" value="2" title="女" checked/>
							<input type="radio" name="gender" value="3" title="保密"/>
							</c:when>
							<c:when test="${user.gender == 3 }">
							<input type="radio" name="gender" value="1" title="男"/>
							<input type="radio" name="gender" value="2" title="女"/>
							<input type="radio" name="gender" value="3" title="保密" checked/>
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-form-label">生日</div>
					<div class="layui-input-block">
						 <input type="text" name="birthday" 
						 value='<fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd"/>'
						  lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off"
						   class="layui-input" onclick="layui.laydate({elem: this})">
						<!-- <div class="layui-inline">
							<select name="year">
								<option>1994</option>
								<option>1992</option>
							</select>
						</div>
						<div class="layui-inline">
							<select name="month">
								<option>4</option>
								<option>5</option>
							</select>
						</div>
						<div class="layui-inline">
							<select name="day">
								<option>1</option>
								<option>2</option>
							</select>
						</div> -->
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-form-label">
						积分
					</div>
					<div class="layui-input-block" style="padding-top: 10px;">
						${user.score }
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-form-label">
						等级
					</div>
					<div class="layui-input-block" style="padding-top: 10px;">
						金牌会员
					</div>
				</div>
				<div>
					<div class="layui-form-label">
						余额
					</div>
					<div class="layui-input-block" style="padding-top: 10px;">
						${user.balance }
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="updateUser">提交</button>
					</div>
				</div>
				<input type="hidden" name="id" value="${user.id }">
			</form>
		</div>
		<script>
		layui.use(['form','laydate'], function(){
			var form = layui.form();
		  	var laydate = layui.laydate;
			//监听提交
			form.on('submit(updateUser)', function(data){
		    	$.post("${basePath}/home/user/update",data.field,function(result){
		    		result = $.parseJSON(result);
		    		layer.msg(result.msg);
		    		if(layer.success){
		    			window.location.reload();
		    		}
		    	});
		    	return false;
		  	});
		});
		</script>
	</body>
</html>
