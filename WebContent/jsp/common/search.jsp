<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<div class="container" style="height: 100px;text-align: center;padding: 10px;margin-top:50px;">
			<div class="line" style="padding-right:150px;">
				<img src="${basePath}/img/logo.png"/>
			</div>
			<div class="line">
				<form method="post" action="${basePath }/home/good/search">
					<div class="input-group" style="width:500px;">
						<input type="text" name="keyword" class="form-control">
						<span class="input-group-btn">
							<button class="btn btn-danger" type="submit">搜索</button>
				     	</span>
					</div>
				</form>
			</div>
			<div class="line" style="padding-left: 150px;">
				<button class="btn btn-danger">我的购物车</button>
			</div>
		</div>
	</body>
</html>
