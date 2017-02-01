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
		<title>订单详情</title>
		<style>
			.order{
				background: #fff;
				height: 300px;
			}
			.order-info{
				display: inline-block;
				float: left;
				width: 30%;
				text-align: center;
				padding-top: 40px;
				height: 100%;
				border-right: 1px #f1f1f1 solid;
				color: #999;
			}
			.order-info .order-no{
				padding: 20px 0;
			}
			.order-info .curr-status{
				font-size: xx-large;
				color: #71B247;
			}
			.order-process{
				width: 69%;
				display: inline-block;
				float: right;
				text-align: center;
			}
			.order .node{
				display: inline-block;
				padding-top: 70px;
				width: 70px;
			}
			.order .process{
				display: inline-block;
				padding-top: 70px;
				width: 123px;
				padding-bottom: 80px;
			}
			.order .node .icon{
				padding: 0 11px;
				width: 65px;
				height: 43px;
			}
			.icon-submit,
			.icon-pay,
			.icon-out,
			.icon-finish{
				background: url(${basePath}/img/node-icons.png) no-repeat;
				display: block;
				width: 43px;
				height: 43px;
			}
			.icon-submit{
				background-position: 0px -108px;
			}
			.icon-pay{
				background-position: -52px -108px;
			}
			.icon-out{
				background-position: -270px -108px;
			}
			.icon-finish{
				background-position: 0px -54px;
			}
			.icon-process{
				background: url(${basePath}/img/proce-icons.png) no-repeat;
				background-position: 0px -38px;
				display: block;
				width: 123px;
				height: 19px;
			}
			.order .node .txt{
				width: 70px;
				padding: 5px 0;
			}
			.order .node .time{
				width: 70px;
				line-height: 20px;
				padding: 5px 0;
				font-size: small;
			}
			.order-bottom{
				width: 100%;
				color: #999;
				font-size: 12px;
				margin-top: 70px;
			}
			.order-bottom .num{
				color: red;
			}
			.dl{
				display: inline-block;
				width: 33%;
				border-right: 1px #f1f1f1 solid;
				padding-left: 20px;
				padding-top: 20px;
				height: 170px;
			}
			.dl:last-child{
				border: none;
				
			}
			.dl .dt{
				font-size: large;
				text-align: left;
			}
			.dl .dd{
				width: 100%;
			}
			.dl .dd .item{
				padding: 3px 0;
				display: block;
				line-height: 30px;
			}
			.dl .dd .dlabel{
				text-align: left;
				width: 80px;
				float: left;
			}
			.dl .dd .info{
				text-align: left;
				width: 200px;
				float: left;
			}
			.good-list{
				width: 100%;
			}
			
			.balance{
				width: 100%;
				padding: 30px 30px 30px 0px;
				float: right;
				text-align: right;
				background: #fff;
			}
			.balance .value{
				font-size: x-large;
				font-weight: bold;
				color: #D9534F;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="block">
				<div class="order">
					<div class="order-info">
						<div class="order-no">订单号：${order.no }</div>
						<div class="curr-status">
							<c:choose>
								<c:when test="${order.status == 1}">待付款</c:when>
								<c:when test="${order.status == 2}">已取消</c:when>
								<c:when test="${order.status == 3}">待发货</c:when>
								<c:when test="${order.status == 4}">待收货</c:when>
								<c:when test="${order.status == 5}">待评价</c:when>
								<c:when test="${order.status == 6}">已完成</c:when>
							</c:choose>
						</div>
					</div>
					<div class="order-process">
						<div class="node">
							<div class="icon">
								<i class="icon-submit"></i>
							</div>
							<div class="txt">
								提交订单
							</div>
							<div class="time">
								<fmt:formatDate value="${order.createTime }" pattern="yyyy-MM-dd'<br/>'HH:mm:ss"/>
							</div>
						</div>
						<c:if test="${order.status == 3 }">
						<div class="process">
							<i class="icon-process"></i>
						</div>
						<div class="node">
							<div class="icon">
								<i class="icon-pay"></i>
							</div>
							<div class="txt">
								付款成功
							</div>
							<div class="time">
								<fmt:formatDate value="${order.payTime }" pattern="yyyy-MM-dd'<br/>'HH:mm:ss"/>
							</div>
						</div>
						</c:if>
						<c:if test="${order.status == 4 }">
						<div class="process">
							<i class="icon-process"></i>
						</div>
						<div class="node">
							<div class="icon">
								<i class="icon-out"></i>
							</div>
							<div class="txt">
								商品出库
							</div>
							<div class="time">
								<fmt:formatDate value="${order.outTime }" pattern="yyyy-MM-dd'<br/>'HH:mm:ss"/>
							</div>
						</div>
						</c:if>
						<c:if test="${order.status == 6 }">
						<div class="process">
							<i class="icon-process"></i>
						</div>
						<div class="node">
							<div class="icon">
								<i class="icon-finish"></i>
							</div>
							<div class="txt">
								完成
							</div>
							<div class="time">
								<fmt:formatDate value="${order.confirmTime }" pattern="yyyy-MM-dd'<br/>'HH:mm:ss"/>
							</div>
						</div>
						<div class="order-bottom">会员成长值：<span class="num">+${order.score }</span></div>
						</c:if>
					</div>
				</div>
			</div>
			<div class="block">
				<div class="dl">
					<div class="dt">收货人信息</div>
					<div class="dd">
						<div class="item">
							<span class="dlabel">收货人：</span>
							<div class="info">${address.name }</div>
						</div>
						<div class="item">
							<span class="dlabel">地址 ：</span>
							<div class="info">
								${address.province }&nbsp;&nbsp;
								${address.city }&nbsp;&nbsp;
								${address.county }&nbsp;&nbsp;
								${address.address }&nbsp;&nbsp;
							</div>
						</div>
						<div class="item">
							<span class="dlabel">手机号码：</span>
							<div class="info">
								${address.tel }
							</div>
						</div>
					</div>
				</div>
				<div class="dl">
					<div class="dt">付款信息</div>
					<div class="dd">
						<div class="item">
							<span class="dlabel">付款方式 ：</span>
							<div class="info">
								<c:choose>
									<c:when test="${order.payWay == 1}">
									在线支付
									</c:when>
									<c:otherwise>
									货到付款
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="item">
							<span class="dlabel">商品总额：</span>
							<div class="info">${totalValue }</div>
						</div>
						<div class="item">
							<span class="dlabel">付款时间 ：</span>
							<div class="info">
								<c:if test="${order.payTime != null}">
									<fmt:formatDate value="${order.payTime }" type="date"/>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<div class="dl">
					<div class="dt">发票信息</div>
					<div class="dd">
						<div class="item">
							<span class="dlabel">发票抬头：</span>
							<div class="info">${order.receiptName }</div>
						</div>
						<div class="item">
							<span class="dlabel">发票内容：</span>
							<div class="info">${order.receiptContent }</div>
						</div>
					</div>
				</div>
			</div>
			<div class="block">
				<div class="good-list">
					<table class="myTable">
						<thead>
							<th>商品</th>
							<th>商品编号</th>
							<th>价格</th>
							<th>数量</th>
							<th>操作</th>
						</thead>
						<tbody>
							<c:forEach items="${orderGoods }" var="orderGood">
								<tr>
									<td>
										<img src="${basePath }/img/56b16594Nb8807f03.jpg" />
										<span>
											<a class="content-link">${orderGood.good['name'] }</a>
										</span>
									</td>
									<td>${orderGood.good['no'] }</td>
									<td>${orderGood.price }</td>
									<td>${orderGood.num }</td>
									<td>
										<a class="extra" href="${basePath }/home/returnAndChange/index/${orderGood.id}">返修/退换货</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="balance">
					商品总额：<span class="value">￥${totalValue }</span>
				</div>
			</div>
		</div>
	</body>
</html>
