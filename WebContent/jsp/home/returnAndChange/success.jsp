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
				提交成功，请等待售后处理 ！
			</div>
			<div class="content">
				<a class="myBtn" onclick="forwardReturnAndChangeDetailPage();">查看本次退换货申请详情</a>
			</div>
			<form style="display:none;" method="get" action="${basePath }/home/returnAndChange/detail/${id}">
				<button type="submit" id="forwardReturnAndChangeDetailBtn"></button>
			</form>
			<script type="text/javascript">
				function forwardReturnAndChangeDetailPage(){
					$("#forwardReturnAndChangeDetailBtn").click();
				}
			</script>
		</div>
		
	</body>
</html>
