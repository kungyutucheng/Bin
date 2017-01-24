<%@page import="com.bin.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
			.top-a{
				color:#000000;
				margin:0px 10px;
			}
			.top-a:hover{
				text-decoration: none;
				color:#E4393C;
				cursor: pointer;
			}
		</style>
	</head>
	<body>
		<div class="nav navbar-default navbar-fixed-top" style="padding:5px 0px;"  role="navigation">
			<div class="container">
				<div style="display: inline;float:left;">
					<a class="top-a">
						<c:choose>
							<c:when test="${sessionScope.user != null}">
							<c:choose>
								<c:when test="${sessionScope.user.name != null }"><a href="${basePath }/home/me/personInfo">${sessionScope.user.name }</a></c:when>
								<c:otherwise><a href="${basePath }/home/me/personInfo">${sessionScope.user.account }</a></c:otherwise>
							</c:choose>
							</c:when>
							<c:otherwise><a href="${basePath }/jsp/home/login/login.jsp">请登录</a></c:otherwise>
						</c:choose>
					</a>
					<a class="top-a">退出</a>
				</div>
				<div style="display: inline;float: right;">
					<a class="top-a" href="${basePath }/home/me/myOrder">订单</a>
					<a class="top-a" href="${basePath }/home/cart/list">购物车</a>
				</div>
			</div>
		</div>
	</body>
</html>
