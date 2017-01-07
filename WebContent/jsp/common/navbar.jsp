<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style>
			#navbar > li{
				cursor: pointer;
				display: inline;
				font-weight: bold;
				margin:0 20px;
			}
			#navbar > li:hover{
				color: red;
			}
		</style>
	</head>
	<body style="text-align:center;">
		<ul id="navbar" style="list-style: none;color:#333333;padding:0;margin:0;">
			<li><a href="${basePath }/home/good/search?keyword=book">书籍</a></li>
			<li>电器</li>
			<li><a onclick="forwardListPage('手机')">手机</a></li>
			<li>电脑</li>
			<li>服装</li>
			<li>家居</li>
			<li>化妆品</li>
			<li>运动</li>
			<li>母婴</li>
			<li>医药</li>
			<li>汽车</li>
			<li>食品</li>
			<li>彩票</li>
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
