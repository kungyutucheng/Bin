<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>

<%@ include file="/common/tagslib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <style>
	    * {
			margin: 0;
			padding: 0;
		}
		
		html, body {
			height: 100%;
			width: 100%;
		}
        body {
            /* padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee; */
            background: url(${basePath}/img/login/login_bg.jpg) center no-repeat;
            background-size: 100% auto;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
            border:1px solid #eee;
            border-radius:10px;
            background:rgba(255,255,255,0.3);
            text-align:center;
        }
        .form-signin .form-signin-heading,
        .form-signin .checkbox,
        .form-signin .errorMsg {
            margin-bottom: 10px;
        }
        .form-signin .form-signin-heading{
        	font-weight:bold;
        }
        .form-signin .checkbox {
            font-weight: normal;
            text-align:left;
        }
        .form-signin .errorMsg{
        	text-align:left;
        	font-weight:normal;
        	color:red;
        }
        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }
        .form-signin .form-control:focus {
            z-index: 2;
        }
        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>
<body>
    <div class="container" style="padding:200px;">
        <form class="form-signin" method="post" action="${basePath }/admin/login/login">
	        <h2 class="form-signin-heading">BIN商城后台管理系统</h2>
	        <label for="inputEmail" class="sr-only">Account</label>
	        <input id="username" type="text"  name="username" class="form-control" placeholder="请输入用户名" required autofocus>
	        <label for="inputPassword" class="sr-only">Password</label>
	        <input type="password" class="form-control" placeholder="请输入密码" onchange="encode(this);" required>
	        <input id="password" name="pwd" type="hidden">
	        <div class="errorMsg">${message}</div>
	        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
        </form>

    </div>
    <script>
    function encode(obj){
    	$("#password").val(hex_md5($(obj).val()));
    }
    </script>
</body>
</html>