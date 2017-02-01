<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/tagslib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>个人信息</title>
		<style type="text/css">
			.tab-div {
				display: inline-block;
				padding-top:10px;
			}
			
			.tab {
				margin: 10px 8px;
				font-size: 12px;
				border-bottom: 2px #fff solid transparent;
				cursor: pointer;
			}
			
			.tab-active {
				color: red;
				font-weight: bold;
				cursor: pointer;
				border-bottom: 2px red solid;
			}
			
			.tab:hover {
				color: red;
				cursor: pointer;
				border-bottom: 2px red solid;
			}
			.filter{
				display: inline-block;
				float: right;
			}
			
			.head {
				background: #F5F5F5;
				color: #666;
			}
			
			.head > .th {
				display: inline-block;
				padding: 10px 0;
				text-align: center;
			}
			
			.head > .good {
				width: 58%;
			}
			
			.head > .receiver {
				width: 10%;
			}
			
			.head > .value {
				width: 10%;
			}
			
			.head > .status {
				width: 10%;
			}
			
			.head > .oper {
				width: 10%;
			}
			
			.body{
				width: 100%;
				margin: 10px 0;
				
				font-size: 12px;
				
			}
			.body > .order-item{
				border-left: 1px #ddd solid;
				border-bottom: 1px #ddd solid;
				border-right: 1px #ddd solid;
				width: 100%;
				display: table;
				margin: 20px 0;
			}
			
			.body > .order-item > .title{
				border-top: 1px #ddd solid;
				border-left: 1px #ddd solid;
				border-right: 1px #ddd solid;
				background: #F5F5F5;
				padding: 10px;
				width: 100%;
				display: table-caption; 
				color: #999;
			}
			.body > .order-item > .title > div:first-child{
				display: inline-block;
			}
			
			.body > .order-item > .title > div:nth-child(2){
				display: inline-block;
				float: right;
				cursor: pointer;
			}
			
			.body > .order-item > .title > .order-no{
				color:#000000;
			}
			
			.body > .order-item > .content{
				width: 100%;
				display: table-row;
				text-align: center;
			}
			.body > .order-item > .content > .good,
			.body > .order-item > .content > .receiver,
			.body > .order-item > .content > .value,
			.body > .order-item > .content > .status,
			.body > .order-item > .content > .oper{
				display: table-cell;
				vertical-align: middle;
			}
			
			.body > .order-item > .content > .good{
				width: 58%;
				border-right: 1px #ddd solid;
			}
			.body > .order-item > .content > .good > .good-item {
				width: 100%;
				text-align: left;
				border-bottom: 1px #ddd solid;
			}
			.body > .order-item > .content > .good > .good-item:last-child{
				border-bottom: none;	
			}
			.body > .order-item > .content > .good > .good-item > .img{
				width: 13%;
				padding-left: 10px;
				display: inline-block;
			}
			.body > .order-item > .content > .good > .good-item > .good-name{
				width: 60%;
				padding: 0px 10px;
				display: inline-block;
			}
			.body > .order-item > .content > .good > .good-item > .good-num{
				width: 10%;
				padding: 0px 10px;
				display: inline-block;
				color: #999;
			}
			.body > .order-item > .content > .good > .good-item > .good-oper{
				width: 15%;
				display: inline-block;
				color: #999;
			}
			.body > .order-item > .content > .receiver {
				width: 10%;
				border-right: 1px #ddd solid;
			}
			
			.body > .order-item > .content > .value {
				width: 10%;
				border-right: 1px #ddd solid;
				color: #999;
				text-align: center;
			}
			.body > .order-item > .content > .value > .money{
				margin-bottom: 3px;
			}
			.body > .order-item > .content > .value > .pay-way{
				margin-top: 3px;
			}
			.body > .order-item > .content > .status {
				width: 10%;
				border-right: 1px #ddd solid;
			}
			
			.body > .order-item > .content > .oper {
				width: 10%;
			}
			
		</style>
	</head>

	<body>
		<div class="container-fluid iframe-offset-y">
			<div>
				<div class="tab-div">
					<span class="tab" title="0">全部订单</span>
					<span class="tab" title="1">待付款</span>
					<span class="tab" title="2">已取消</span>
					<span class="tab" title="3">待发货</span>
					<span class="tab" title="4">待收货</span>
					<span class="tab" title="5">待评价</span>
					<span class="tab" title="6">已完成</span>
				</div>
				<div class="filter">
					<form class="layui-form" id="filterForm" style="display:inline-block;" action="${basePath }/home/order/list/1">
						<div class="layui-form-item">
							<div class="layui-input-block" style="padding:0;margin:0;">
								<div class="layui-inline" style="width:150px;">
									<select name="timeLimited" lay-filter="timeLimited"></select>
								</div>
							</div>
						</div>
						<input id="status" type="hidden" name="status" value="${status }">
					</form>
					<form class="layui-form" id="searchForm" style="display:inline-block;" action="${basePath }/home/order/list/1">
						<div class="layui-form-item">
							<div class="layui-input-block" style="padding:0;margin:0;">
								<div class="layui-inline">
									<input type="text" name="no" class="layui-input" placeholder="请输入订单编号" value="${no }">
								</div>
								<div class="layui-inline">
									<button class="layui-btn" lay-submit>查询</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div style="clear: both;">
				<div class="head">
					<div class="good th">
						订单详情
					</div>
					<div class="receiver th">
						收货人
					</div>
					<div class="value th">
						金额
					</div>
					<div class="status th">
						状态
					</div>
					<div class="oper th">
						操作
					</div>
				</div>
				<div class="body">
					<c:forEach items="${orders }" var="order">
					<div class="order-item">
						<div class="title">
							<div>
								<fmt:formatDate value="${order.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;&nbsp;&nbsp;订单号：<span class="order-no">${order.no }</span>
							</div>
							<div>
								<a name="deleteIcon" title="${basePath }/home/order/delete/${order.id }"><img src="${basePath }/img/delete.ico"/></a>
							</div>
						</div>
						<div class="content">
							<div class="good">
								<c:forEach items="${order.orderGoods }" var="orderGood">
								<div class="good-item">
									<div class="img">
										<img src="${basePath }/img/56b16594Nb8807f03.jpg"/>
									</div>
									<div class="good-name">${orderGood.good['name'] }</div>
									<div class="good-num">X${orderGood.num }</div>
									<div class="good-oper">
										<a class="extra" href="${basePath }/home/returnAndChange/index/${orderGood.id }"  target="_blank">返修/退换货</a>
									</div>
								</div>
								</c:forEach>
							</div>
							<div class="receiver">
								${order.address['name'] }
							</div>
							<div class="value">
								<div class="money">总额：￥${order.totalValue }</div>
								<hr style="margin: 0px 6px;"/>
								<div class="pay-way">
								<c:choose>
									<c:when test="${order.payWay == 1}">在线支付</c:when>
									<c:otherwise>货到付款</c:otherwise>
								</c:choose>
								</div>
							</div>
							<div class="status">
								<c:choose>
									<c:when test="${order.status == 1 }">待付款</c:when>
									<c:when test="${order.status == 2 }">已取消</c:when>
									<c:when test="${order.status == 3 }">待发货</c:when>
									<c:when test="${order.status == 4 }">待收货</c:when>
									<c:when test="${order.status == 5 }">待评价</c:when>
									<c:otherwise>已完成</c:otherwise>
								</c:choose>
							</div>
							<div class="oper">
								<a class="extra" href="${basePath }/home/order/detail/${order.id}" target="_blank">订单详情</a>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<div id="page" style="width:100%;text-align: center;"></div>
		</div>
		<script>
		$(function(){
			
			//Demo
			layui.use(['form' , 'laypage'], function() {
				var form = layui.form();
				var laypage = layui.laypage;
				laypage({
					cont: 'page', //id
					pages: "${pageCount}", //总页数
					curr: "${pageNo}", //当前页
					groups: 5, //连续显示分页数
					jump: function(obj, first) {
						if(obj.curr != Number("${pageNo}")){
							$("#filterForm").attr("action" , "${basePath}/home/order/list/" + obj.curr);
							$("#filterForm").submit();
						}
					}
				});
				
				form.on('select(timeLimited)' , function(data){
					$("#filterForm").submit();
				});
			});
			var html = "<option value='0'>全部订单</option>"; 
			html += "<option value='1'>三个月内订单</option>";
			var date = new Date();
			var year = date.getFullYear();
			for(var i = 2;i <= 4; i++){
				html += "<option value='" + i + "'>" + year + "年订单</option>";
				year--;
			}
			html += "<option value='5'>" + (++year) + "年之前的订单</option>";
			$("select[name='timeLimited']").html(html);
			$("select[name='timeLimited']").val("${timeLimited}");
			
			var status = $("#status").val();
			$(".tab").each(function(){
				if($(this).attr("title") == status){
					$(this).attr("class","tab tab-active");
				}
				$(this).on("click" , function(){
					$("#status").val($(this).attr("title"));
					$("#filterForm").submit();
				});
			});
			
			$("a[name='deleteIcon']").each(function(){
				$(this).on("click",function(){
					/* var obj = $(this);
					$.get($(this).attr("title"),null,function(result){
						result = $.parseJSON(result);
						parent.showMsgInPW(result.msg);
						if(result.success){
							window.location.reload();
						}
					}); */
					parent.deleteConfirmDialog("确定删除?",$(this).attr("title"),$(this));
				});
			});
		});
			
			
		</script>
	</body>

</html>