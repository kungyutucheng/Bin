<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/tagslib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>设置</title>
	</head>
	<body>
		<div>
			<blockquote class="layui-elem-quote">用户名：<%=pageContext.getSession().getAttribute("backup_user") %></blockquote>
			<blockquote class="layui-elem-quote">角色：管理员</blockquote>
			<button type="button" class="layui-btn" id="revisePwdBtn" onclick="showRevisePwd(this)">修改密码</button>
			<form id="revisePwdForm" style="border: 1px #ddd dashed;display: none;padding: 10px 0;margin-top: 10px;">
				<div class="layui-form-item">
					<div class="layui-form-label">
						新密码
					</div>
					<div class="layui-input-block">
						<input type="password" class="layui-input width100" />
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-form-label">
						确认密码
					</div>
					<div class="layui-input-block">
						<input type="password" class="layui-input width100" />
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button type="button" class="layui-btn">修改</button>
					</div>
				</div>
			</form>
		</div>
		<script type="text/javascript">
			function showRevisePwd(obj){
				$("#revisePwdForm").slideToggle();
				var text = $(obj).text() == "修改密码"?"收起":"修改密码";
				$(obj).text(text);
			}
		</script>
	</body>
</html>
