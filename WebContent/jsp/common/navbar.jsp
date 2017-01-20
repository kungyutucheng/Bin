<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
			#navbar > li{
				cursor: pointer;
				display: inline;
				font-weight: bold;
				margin:0 20px;
			}
			#navbar > li > a:hover{
				color: red;
				text-decoration: none;
			}
		</style>
	</head>
	<body style="text-align:center;">
		<ul id="navbar" style="list-style: none;color:#333333;padding:0;margin:0;">
			<li><a href="${basePath }/home/good/search?keyword=book">书籍</a></li>
			<li><a>电器</a></li>
			<li><a onclick="forwardListPage('手机')">手机</a></li>
			<li><a>电脑</a></li>
			<li><a>服装</a></li>
			<li><a>家居</a></li>
			<li><a>化妆品</a></li>
			<li><a>运动</a></li>
			<li><a>母婴</a></li>
			<li><a>医药</a></li>
			<li><a>汽车</a></li>
			<li><a>食品</a></li>
			<li><a>彩票</a></li>
		</ul>
		<hr style="height: 3px;background: #D9534F;border:0;width:100%;"/>
		<form id="searchForm" style="display:none;" method="post" action="${basePath }/home/good/search">
			<input id="navbarKeyword" name="keyword" type="text"/>
		</form>
		<script>
		function forwardListPage(keyword){
			console.log(keyword);
			$("#navbarKeyword").val(keyword);
			$('#searchForm').submit();
		}
		</script>
	</body>
</html>
