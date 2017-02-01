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
		<title>返修/退换货详情</title>
		<style>
			body {
				text-align: center;
			}
			
			.inner-block {
				border: 1px #EDD28B solid;
				background: #FFFDEE;
				display: table;
				margin: 20px;
				width: 96%;
				padding: 5px 0;
			}
			
			.inner-block> div {
				display: table-cell;
				padding: 10px 0;
			}
			
			.servant-msg {
				font-size: large;
				font-weight: 500;
				border-right: 1px #EDD28B solid;
			}
			
			.servant-msg> .servant {
				color: #E4393C;
			}
			
			.good {
				font-size: 12px;
				color: #666666;
				display: block;
			}
			
			.good> .img {
				display: inline;
				float: left;
				padding-left: 40px;
			}
			
			.good> .text {
				display: inline;
				padding-right: 30px;
			}
			
			.mc {
				line-height: 20px;
			}
			
			.process {
				width: 635px;
				padding: 50px;
				margin: 0 auto 10px;
				overflow: hidden;
			}
			
			.node {
				width: 27px;
				height: 27px;
				margin-top: -4px;
			}
			
			.proce {
				width: 100px;
				height: 14px;
				z-index: 2;
			}
			
			.node,
			.proce {
				position: relative;
				float: left;
			}
			
			.icon-node {
				width: 27px;
				height: 27px;
				background: url(${basePath}/img/icon-progress.jpg);
				background-position: -223px -33px;
				display: inline-block;
			}
			
			.icon-proce {
				background: url(${basePath}/img/icon-progress.jpg);
				background-position: 0 -71px;
				position: absolute;
				left: -1px;
				width: 102px;
				height: 17px;
				display: inline-block;
			}
			
			.txt {
				position: absolute;
				top: 41px;
				left: -40px;
				display: block;
				width: 110px;
				height: 16px;
				font: 12px/16px simsun;
				color: #7abd53;
				text-align: center;
				overflow: hidden;
			}
			
			.log{
				width: 96%;
				padding: 10px;
				border: 1px #ddd solid;
				margin: 10px 20px;
				text-align: left;
			}
			.log-item{
				border-bottom: 1px #ddd dashed;
				padding: 10px 0;
			}
			.log-title{
				font-weight: bold;
				font-size: 14px;
			}
			.log-content{
				font-size: 12px;
			}
			.log-inline{
				display: inline;
			}
			
			.servant-table{
				border: 1px #ddd solid;
				width: 96%;
				margin: 10px 20px;
			}
			.servant-table > tbody > tr > td{
				border: 1px #ddd solid;
				border-width: 0px 0px 1px 1px;
				padding: 5px;
				text-align: left;
				font-size: 13px;
			}
		</style>
	</head>

	<body>
		<div class="container">
			<div class="block">
				<div class="sub-title">
					申请服务详情
				</div>
				<div class="inner-block">
					<div class="servant-msg">
						本次售后服务由<span class="servant">${rac.orderGood.good.owner['name'] }</span>为您提供
					</div>
					<div class="good">
						<div class="img">
							<img src="img/53c912d7Nd2dccc60.jpg" />
						</div>
						<div class="text">
							<div>
								售后服务单号：${rac.no }
							</div>
							<div>
								商品名：${rac.orderGood.good['name'] }&nbsp;&nbsp;${rac.orderGood.goodProperty['name'] }
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="block">
				<div class="sub-title">
					售后信息
				</div>
				<div class="mc">
					<div class="process">
						<div class="node">
							<i class="icon-node"></i>
							<span class="txt">提交申请</span>
						</div>
						<c:if test="${rac.status > 1 }">
						<div class="proce">
							<i class="icon-proce"></i>
						</div>
						<div class="node">
							<i class="icon-node"></i>
							<span class="txt">卖家已审核</span>
						</div>
						</c:if>
						<c:if test="${rac.status > 2 }">
						<div class="proce">
							<i class="icon-proce"></i>
						</div>
						<div class="node">
							<i class="icon-node"></i>
							<span class="txt">卖家已收货</span>
						</div>
						</c:if>
						<c:if test="${rac.status > 3 }">
							<c:choose>
								<c:when test="${rac.status == 4 }">
									<div class="proce">
										<i class="icon-proce"></i>
									</div>
									<div class="node">
										<i class="icon-node"></i>
										<span class="txt">已发货</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="proce">
										<i class="icon-proce"></i>
									</div>
									<div class="node">
										<i class="icon-node"></i>
										<span class="txt">已退款</span>
									</div>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${rac.status == 6 }">
						<div class="proce">
							<i class="icon-proce"></i>
						</div>
						<div class="node">
							<i class="icon-node"></i>
							<span class="txt">完成</span>
						</div>
						</c:if>
					</div>
				</div>
				<div class="log">
					<c:forEach items="${logs }" var="log">
						<div class="log-item">
							<div class="log-title">
								处理信息：
							</div>
							<div class="log-content">
								${log.msg }
							</div>
							<div class="log-title log-inline">
								操作人：
							</div>
							<div class="log-content log-inline">
								${log.operator } (<fmt:formatDate value="${log.operateTime }" pattern="yyyy-MM-dd HH:mm:ss"/> ) 
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="block">
				<div class="sub-title">
					服务单信息
				</div>
				<div>
					<table class="servant-table">
						<tr>
							<td>商品处理方式</td>
							<td>客户期望处理方式为“<span style="color:#E4393C">
							<c:choose>
								<c:when test="${rac.type == 1 }">换货</c:when>
								<c:otherwise>退货</c:otherwise>
							</c:choose></span>” ，最终处理方式为“<span style="color:#E4393C">
							<c:choose>
								<c:when test="${rac.dealWay == 1 }">换货</c:when>
								<c:when test="${rac.dealWay == 2 }">退货</c:when>
								<c:otherwise>处理中</c:otherwise>
							</c:choose></span>
							”</td>
						</tr>
						<tr>
							<td>问题描述</td>
							<td>${rac.description } </td>
						</tr>
						<c:if test="${rac.type == 1 }">
						<tr>
							<td>收货地址</td>
							<td>${rac.province }${rac.city }${rac.county }${rac.address } </td>
						</tr>
						<tr>
							<td>联系信息</td>
							<td>联系人：${rac.receiver }   电话：${rac.tel }</td>
						</tr>
						<c:if test="${rac.status == 4 }">
						<tr>
							<td>发货单信息</td>
							<td>运费信息：${rac.deliveryFare } (元) 快递公司：${rac.express } 运单号:${rac.expressNo } </td>
						</tr>
						</c:if>
						</c:if>
						<c:if test="${rac.type == 2 && rac.status == 5}">
							<tr>
								<td>退款方式</td>
								<td>
									<c:choose>
										<c:when test="${rac.returnMoneyWay == 1 }">余额</c:when>
									</c:choose>：${rac.returnMoney }（元）
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span style="font-weight: bold;">退款总额</span>
									<span style="color: #D9534F;">￥${rac.returnMoney }</span>
								</td>
							</tr>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</body>

</html>