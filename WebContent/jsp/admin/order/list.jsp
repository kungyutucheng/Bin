<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/admin/tagslib.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单列表</title>
<style type="text/css">
.width100{
	width:100px;
}
</style>
</head>
<body>
	<div class="search-div">
		<div class="text-bar">
			<span class="text">查询条件</span>
			<span class="icon">
				<i class="layui-icon" id="iconSwitch">&#xe619;</i>
			</span>
		</div>
		<div class="filter">
			<form class="layui-form" id="filterForm">
				<div class="layui-form-item">
					<div class="layui-inline">
						<div class="layui-form-label width100">订单编号</div>
						<div class="layui-input-block">
							<input type="text" name="no" class="layui-input" value="${params.no }"/>
						</div>
					</div>
					<div class="layui-inline">
						<div class="layui-form-label width100">状态</div>
						<div class="layui-input-block">
							<select name="status">
								<option value="0">全部</option>
								<option value="1">待付款</option>
								<option value="2">已取消</option>
								<option value="3">待发货</option>
								<option value="4">待收货</option>
								<option value="5">待评价</option>
								<option value="6">已完成</option>
							</select>
						</div>
					</div>
				</div>
				<button class="layui-btn" lay-submit lay-filter="searchBtn">查询</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				<button type="reset" class="layui-btn layui-btn-primary" onclick="showMoreFilter(this);">更多条件</button>
				<input type="hidden" value="${pageNo }" name="page">
			</form>
		</div>
	</div>
	<div class="result-div">
		<table class="table">
			<thead>
				<th><input type="checkbox" id="selectAll" /></th>
				<th>编号</th>
				<th>用户</th>
				<th>状态</th>
				<th>支付方式</th>
				<th>商品总额</th>
				<th>完成时间</th>
				<th>操作</th>
			</thead>
			<tbody id="dg">
				<c:forEach items="${orders }" var="order">
				<tr>
					<td>
						<input type="checkbox" name="selectItem" onchange="hasSelectAll()" />
					</td>
					<td>${order.no }</td>
					<td>${order.user.name }</td>
					<td>
						<c:choose>
							<c:when test="${order.status == 1 }">待付款</c:when>
							<c:when test="${order.status == 2 }">已取消</c:when>
							<c:when test="${order.status == 3 }">待发货</c:when>
							<c:when test="${order.status == 4 }">待收货</c:when>
							<c:when test="${order.status == 5 }">待评价</c:when>
							<c:when test="${order.status == 6 }">已完成</c:when>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${order.payWay == 1 }">在线支付</c:when>
							<c:when test="${order.payWay == 2 }">货到付款</c:when>
						</c:choose>
					</td>
					<td>${order.totalValue }</td>
					<td><fmt:formatDate value="${order.finishTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
					<td>
						<span>
							<a class="extra" onclick="showGoodDetail(${order.id})">详情</a>
						</span>
						<c:if test="${order.status == 3 }">
						<span>
							<a class="extra" onclick="deliverGood(${order.id})">发货</a>
						</span>
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="page" style="width:100%;text-align: center;"></div>
		<div class="modal fade" id="deliverGoodModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" style="width:1000px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">发货</h4>
					</div>
					<div class="modal-body" style="text-align: center;">
						<form class="layui-form">
							<div class="layui-form-item">
								<div class="layui-inline">
									<div class="layui-form-label width100">快递公司</div>
									<div class="layui-input-block">
										<select name="eid"></select>
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label width100">快递单号</div>
									<div class="layui-input-block">
										<input type="text" class="layui-input" name="expressNo" required="required">
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<input type="hidden" name="id">
								<button class="layui-btn" lay-submit lay-filter="deliverGood">发货</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
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
						$("input[name='page']").val(obj.curr);
						$("#filterForm").attr("action" , "${basePath}/admin/order/list");
						$("#filterForm").submit();
					}
				}
			});
			
			$.post("${basePath}/express/getAll",null,function(result){
				console.log(result);
				result = $.parseJSON(result);
				var selectors = $("select[name='eid']");
				var html = "";
				for(var i = 0 ;i < result.length;i++){
					html += "<option value='" + result[i].id + "'>" + result[i].name + "</option>";
				}
				selectors.html(html);
				form.render();
			}); 
			
			form.on('submit(searchBtn)' , function(data){
				$("input[name='page']").val(1);
				$("#filterForm").submit();
			});
			
			
			form.on("submit(deliverGood)" , function(data){
				$.post("${basePath}/admin/order/deliverGood" , data.field,function(result){
					result = $.parseJSON(result);
					layer.msg(result.msg);
					if(result.success){
						$("#deliverGoodModal").modal("hide");
						$("#filterForm").submit();
					}
				});
				return false;
			});
			
		});
		$("select[name='status']").val(Number("${params.status}"));
		
	});
	
	function deliverGood(id){
		$("input[name='id']").val(id);
		$("#deliverGoodModal").modal("show");
	}
	</script>
</body>
</html>