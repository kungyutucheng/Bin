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
			<div class="content" style="padding-top: 30px;">
				支付成功
			</div>
			<div class="content">
				<a class="myBtn" onclick="forwardOrderDetailPage();">立即支付</a>
			</div>
			<form style="display:none;" method="get" action="${basePath }/home/order/pay/${oid}">
				<button type="submit" id="forwardOrderDetailBtn"></button>
			</form>
			<script type="text/javascript">
				function forwardOrderDetailPage(){
					$("#forwardOrderDetailBtn").click();
				}
			</script>
		</div>
		
	</body>
</html>
