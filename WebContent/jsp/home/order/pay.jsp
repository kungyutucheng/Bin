<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/tagslib.jsp" %>
<%@ include file="/jsp/common/top.jsp" %>
<%@ include file="/jsp/common/search.jsp" %>
<%@ include file="/jsp/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>支付</title>
		<style type="text/css">
			.content{
				font-weight: bold;
				width: 100%;
				text-align: center;
				margin: 20px;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="header">
				<a class="logo">
					<img src="img/logo.png" />
				</a>
				<div class="title">支付页</div>
			</div>
			<div class="content" style="padding-top: 150px;">
				订单提交成功！请您尽快付款！订单号：${order.no}
			</div>
			<c:when test="${order.payWay == 1}">
			<div class="content">
				<a class="myBtn" onclick="pay();">立即支付</a>
			</div>
			<form style="display:none;" method="get" action="${basePath }/home/order/pay/${order.id}">
				<button type="submit" id="payBtn"></button>
			</form>
			<script type="text/javascript">
				function pay(){
					$("#payBtn").click();
				}
			</script>
			</c:when>
		</div>
		
	</body>
</html>
