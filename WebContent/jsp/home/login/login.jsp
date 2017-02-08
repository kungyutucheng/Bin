<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ include file="/common/tagslib.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<style>
			.login-wrapper {
				background: url("${basePath }/img/login_bg.jpg") 50% 0 no-repeat;
				height: 488px;
			}
			
			.login-wrapper .container {
				width: 990px;
				padding-top: 30px;
			}
			
			.login-wrapper .container .login-box {
				width: 420px;
				height: 408px;
				margin-left: 680px;
				padding: 20px;
			}
			
			.login-box {
				width: 420px;
				height: 408px;
				padding: 20px;
				background-color: #fff;
			}
			
			.ico {
				display: inline-block;
				vertical-align: middle;
				background-repeat: no-repeat;
			}
			
			.ico-user,
			.ico-lock,
			.ico-notice {
				width: 16px;
				height: 16px;
				background-repeat: no-repeat;
				background-image: url("${basePath }/img/common_z.png");
			}
			
			.ico-user {
				background-position: -338px -318px;
			}
			
			.ico-lock {
				background-position: -312px -318px
			}
			
			.ico-notice {
				background-position: -364px -318px
			}
			
			
		</style>
	</head>

	<body>
		<div>
			<img src="${basePath }/img/logo.png" style="margin: 20px 0px 20px 60px;">
		</div>
		<div class="login-wrapper">
			<div class="container">
				<div class="login-box">
					<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
						<ul class="layui-tab-title">
							<li class="layui-this">登录</li>
							<li>注册</li>
						</ul>
						<div class="layui-tab-content">
							<div class="layui-tab-item layui-show">
								<form id="loginForm">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon"><span class="ico ico-user"></span></div>
											<div class="email_autocomplete1">
												<input autofocus="autofocus" type="email" class="form-control" id="lAccount" name="account" placeholder="邮箱">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon"><span class="ico ico-lock"></span></div>
											<div class="email_autocomplete1">
												<input type="password" class="form-control" name="pwd" id="lPwd" placeholder="密码">
											</div>
										</div>
									</div>
									<div>
										<button type="button" class="btn btn-primary form-control" onclick="login();">登录</button>
									</div>
								</form>
							</div>
							<div class="layui-tab-item">
								<form id="registerForm">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon"><span class="ico ico-user"></span></div>
											<div class="email_autocomplete1">
												<input type="email" class="form-control" id="rAccount" name="account" placeholder="邮箱">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon"><span class="ico ico-lock"></span></div>
											<div class="email_autocomplete1">
												<input type="password" class="form-control" name="pwd" id="rPwd" placeholder="密码">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon"><span class="ico ico-lock"></span></div>
											<div class="email_autocomplete1">
												<input type="password" class="form-control" id="confirmPwd" placeholder="确认密码">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="input-group">
											<div class="email_autocomplete1">
												<input type="text" style="width:80px;" class="form-control" name="verifyCode" id="verifyCode" placeholder="验证码">
												<img src="${basePath }/kaptcha.jpg" style="margin-left:15px;cursor:pointer;" onclick="reloadVerifyCode(this);" id="verifyCodeImg">
											</div>
										</div>
									</div>
									<div>
										<button type="button" class="btn btn-primary form-control" onclick="register();">注册</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="${basePath }/js/md5.js"></script>
		<script>
			//Demo
			layui.use('element', function() {
				var element = layui.element();

			});

			//监听loginForm下所有输入框的回车事件
			$("#loginForm input").bind("keyup",function(event){
				if(event.keyCode == 13){
					login();
				}
			});
			
			
			$("#registerForm input").bind("keyup",function(event){
				if(event.keyCode == 13){
					register();
				}
			});
			
			//重新加载验证码图片
			function reloadVerifyCode(obj){
				$(obj).attr("src","${basePath}/kaptcha.jpg");
			}
			
			
			function register(){
				var account = $("#rAccount").val();
				var pwd = hex_md5($("#rPwd").val());
				var confirmPwd = hex_md5($("#confirmPwd").val());
				var verifyCode = $("#verifyCode");
				
				$.ajax({
					url:"${basePath}/home/login/register",
					method:"POST",
					beforeSend:function(xhr){
						if(account == ""){
							layer.msg("账户不能为空");
							return false;
						}
						if(pwd == ""){
							layer.msg("密码不能为空");
							return false;
						}
						if(confirmPwd == ""){
							layer.msg("确认密码不能为空");
							return false;
						}
						if(pwd != confirmPwd){
							layer.msg("密码与确认密码不匹配");
							return false;
						}
						if(verifyCode.val() == ""){
							layer.msg("请输入验证码");
							return false;
						}
						return true;
					},
					data:{
						account:account,
						pwd:pwd,
						verifyCode:verifyCode.val()
					}
				}).done(function(data){
					data = $.parseJSON(data);
					layer.msg(data.msg);
					if(!data.success){
						$("#verifyCodeImg").attr("src","${basePath}/kaptcha.jpg");
					}
				}).fail(function(jqXHR) {
					response = $.parseJSON(jqXHR.responseText);
					layer.msg(response.msg);
				});
			}
			
			function login(){
				var account = $("#lAccount").val();
				var pwd = hex_md5($("#lPwd").val());
				$.ajax({
					url:"${basePath}/home/login/login",
					method:"POST",
					beforeSend:function(xhr){
						if(account == ""){
							layer.msg("请输入账号");
							return false;
						}
						if(pwd == ""){
							layer.msg("请输入密码");
							return false;
						}
						return true;
					},
					data:{
						account : account,
						pwd : pwd
					}
				}).done(function(data){
					data = $.parseJSON(data);
					layer.msg(data.msg);
					if(data.success){
						//跳转至首页
						window.location = "${basePath}" + data.data;
					}
				}).fail(function(jqXHR) {
					response = $.parseJSON(jqXHR.responseText);
					layer.msg(response.msg);
				});
			}
		</script>
	</body>

</html>