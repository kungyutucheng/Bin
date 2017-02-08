<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/tagslib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>返修/退换货</title>
		<style type="text/css">
			body {
				background: #fff;
			}
			
			.myTable> tbody>tr> td:nth-child(3){
				width: 250px;
			}
		</style>
	</head>

	<body class="container-fluid iframe-offset-y">
		<div>
			<div>
				<table class="myTable">
					<thead>
						<th>返修/退换货编号</th>
						<th>订单编号</th>
						<th>商品名称</th>
						<th>申请时间</th>
						<th>状态</th>
						<th>操作</th>
					</thead>
					<tbody>
						<c:forEach items="${racs }" var="rac">
							<tr>
								<td>${rac.no }</td>
								<td>${rac.orderGood.order['no'] }</td>
								<td>${rac.orderGood.good['name'] }&nbsp;&nbsp;${rac.orderGood.goodProperty['name'] }</td>
								<td><fmt:formatDate value="${rac.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>
									<c:choose>
										<c:when test="${rac.status == 1 }">已提交</c:when>
										<c:when test="${rac.status == 2 }">已审核</c:when>
										<c:when test="${rac.status == 3 }">已收货</c:when>
										<c:when test="${rac.status == 4 }">已发货</c:when>
										<c:when test="${rac.status == 5 }">已退款</c:when>
										<c:otherwise>已完成</c:otherwise>
									</c:choose>
								</td>
								<td>
									<a class="extra" href="${basePath }/home/returnAndChange/detail/${rac.id}" target="_blank">查看</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="page" style="width:100%;text-align: center;"></div>
			<form id="filterForm"></form>
		</div>
		<script>
			layui.use(['laypage', 'layer'], function() {
				var laypage = layui.laypage;
				laypage({
					cont: 'page', //id
					pages: "${pageCount}", //总页数
					curr: "${pageNo}", //当前页
					groups: 5, //连续显示分页数
					jump: function(obj, first) {
						if(Number("${pageNo}") != obj.curr){
							$("#filterForm").attr("action" , "${basePath}/home/returnAndChange/list/" + obj.curr);
							$("#filterForm").submit();
						}
					}
				});
			});
		</script>
	</body>

</html>