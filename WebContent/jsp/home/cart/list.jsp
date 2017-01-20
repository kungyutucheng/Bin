<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/tagslib.jsp" %>
<%@ include file="/jsp/common/top.jsp" %>
<%@ include file="/jsp/common/search.jsp" %>
<%@ include file="/jsp/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>购物车</title>
		<style type="text/css">
			.cart-head {
				background: #F3F3F3;
				border-top: 1px solid #E9E9E9;
				border-bottom: 1px solid #E9E9E9;
				width: 100%;
			}
			
			.cart-body {
				width: 100%;
			}
			
			.item {
				width: 100%;
				border-left: 1px #ddd solid;
				border-right: 1px #ddd solid;
				border-bottom: 1px #ddd solid;
				background: #FFF4E8;
			}
			
			.column {
				display: inline-block;
				padding-top: 15px;
				padding-bottom: 15px;
			}
			
			.cart-checkbox {
				width: 5%;
			}
			
			.cart-good {
				width: 33%;
			}
			
			.cart-prop {
				width: 15%;
			}
			
			.cart-price {
				width: 10%;
			}
			
			.cart-num {
				width: 13%;
			}
			
			.cart-item-total {
				width: 10%;
			}
			
			.cart-oper {
				width: 10%;
			}
			
			.cart-checkbox,
			.cart-prop,
			.cart-price,
			.cart-num,
			.cart-item-total,
			.cart-oper {
				text-align: center;
			}
			
			.cart-good {
				text-align: left;
			}
			
			.cart-good .cart-good-pic {
				cursor: pointer;
				display: inline-block;
				float: left;
				margin-right: 10px;
			}
			
			.cart-good .cart-good-name {
				text-decoration: none;
				cursor: pointer;
				color: #000;
			}
			
			.cart-good .cart-good-name:hover {
				color: red;
			}
			
			.cart-oper .cart-del {
				text-decoration: none;
				cursor: pointer;
			}
			
			.cart-oper .cart-del:hover {
				color: red;
			}
			
			.oper-bar {
				height: 50px;
				width: 100%;
				border: 1px solid #ddd;
				margin: 20px 0;
				position: relative;
			}
			
			.oper-bar .del-selected,
			.oper-bar .sumup,
			.oper-bar .pay-div {
				display: inline-block;
				height: 100%;
				margin: 0px 10px;
				cursor: pointer;
			}
			
			.oper-bar .del-selected:hover {
				color: red;
			}
			
			.oper-bar .del-selected {
				position: absolute;
				left: 10px;
				padding-top: 15px;
			}
			
			.oper-bar .sumup {
				position: absolute;
				right: 180px;
				padding-top: 10px;
			}
			
			.oper-bar .sumup .total-value {
				color: red;
				font-weight: bold;
				font-size: large;
			}
			
			.oper-bar .sumup .total-value:before {
				content: "￥";
			}
			
			.oper-bar .pay-div {}
			
			.oper-bar .pay-div .pay-btn {
				height: 100%;
				color: white;
				font-weight: bold;
				padding: 10px 30px;
				text-align: center;
				font-size: large;
				text-decoration: none;
				background: #E64346;
				right: 0;
				position: absolute;
			}
		</style>
	</head>

	<body>
		<div class="container">
			<div class="cart-head">
				<div class="column cart-checkbox">
					<input type="checkbox" id="select-all" />
				</div>
				<div class="column cart-good">商品</div>
				<div class="column cart-prop"></div>
				<div class="column cart-price">单价（元）</div>
				<div class="column cart-num">数量</div>
				<div class="column cart-item-total">小计</div>
				<div class="column cart-oper">操作</div>
			</div>
			<div class="cart-body">
				<c:forEach var="cart" items="${carts }" varStatus="c">
				<div class="item">
					<div class="column cart-checkbox">
						<input type="checkbox" name="item-checkbox" onchange="itemSelected()" />
						<span class="hide">${cart.id }</span>
					</div>
					<div class="column cart-good" style="vertical-align: middle;">
						<a class="cart-good-pic"><img src="${basePath }/img/56b16594Nb8807f03.jpg" /></a>
						<a class="cart-good-name">${cart.goodName }</a>
					</div>
					<div class="column cart-prop">
						<div>${cart.goodPropertyName }</div>
					</div>
					<div class="column cart-price">${cart.price }</div>
					<div class="column cart-num">
						<div class="input-group" style="width: 140px;position: absolute;">
						  	<span class="input-group-addon" style="cursor: pointer;" onclick="subNum();">-</span>
						  	<input id="num" type="text" class="form-control" value="${cart.num }" style="height: 40px;text-align: center;" onblur="getNumFromInput(this);">
						  	<span class="input-group-addon" style="cursor: pointer;" onclick="addNum();">+</span>
						</div>
					</div>
					<div class="column cart-item-total">${cart.price * cart.num }</div>
					<div class="column cart-oper">
						<a class="cart-del" onclick="deleteItem(this);">删除</a>
					</div>
				</div>
				</c:forEach>
			</div>
			<div class="oper-bar">
				<div class="del-selected" onclick="deleteSelected();">删除所选项</div>
				<div class="sumup">总计：<span id="totalValue" class="total-value">0</span></div>
				<div class="pay-div">
					<a class="pay-btn" onclick="forwardOrderPage();">去结算</a>
					<form action="${basePath }/home/order/order" method="post" style="display:none;">
						<input type="hidden" name="ids" id="cartIds">
						<button type="submit" id="forwardOrderPageBtn"></button>  
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript">

			$(function() {
				//点击全选选中所有小项
				$("#select-all").change(function() {
					if($(this).is(":checked")) {
						$("[name='item-checkbox']").each(function() {
							$(this).prop("checked", true);
						});
					} else {
						$("[name='item-checkbox']").each(function() {
							$(this).prop("checked", false);
						});
					}
					calculateTotalValue();
				});
			});
			//若是选中了所有小项，那么同时选中全选
			function itemSelected() {
				var flag = true;
				$("[name='item-checkbox']").each(function() {
					if(!$(this).is(":checked")) {
						flag = false;
					}
				});
				if(flag) {
					$("#select-all").prop("checked", true);
				} else {
					$("#select-all").prop("checked", false);
				}
				calculateTotalValue();
			}

			//删除小项
			function deleteItem(obj) {
				var goodName = $(obj).parent().prev().prev().prev().prev().prev().children()[1];
				var id = $(obj).parent().prev().prev().prev().prev().prev().prev().children()[1];
				var title = "<div style='width:200px'>确定删除商品'" + goodName.innerText + "'?</div>";
				layer.confirm(title, {
					btn: ['确定', '取消']
				}, function() {
					$.post("${basePath}/home/cart/delete",{
						ids : id.innerText
					},function(result){
						result = $.parseJSON(result);
						layer.msg(result.msg);
						if(result.success){
							window.location.reload();
						}
					});
				}, function(index) {
					layer.close(index);
				});
				
			}
			
			//删除选中的项
			function deleteSelected(){
				layer.confirm("确定删除选中项？", {
					btn: ['确定', '取消']
				}, function() {
					var ids = "";
					$("[name='item-checkbox'").each(function(){
						if($(this).is(":checked")){
							ids += $(this).next().text() + ",";
						}
					});
					if(ids == ""){
						layer.msg("请选择一项商品");
						return;
					}
					ids = ids.substr(0,ids.length - 1);
					console.log(ids);
					$.post("${basePath}/home/cart/delete",{
						ids : ids
					},function(result){
						result = $.parseJSON(result);
						layer.msg(result.msg);
						if(result.success){
							window.location.reload();
						}
					});
				}, function(index) {
					layer.close(index);
				});
				
			}
			
			function subNum(){
				var num = $("#num");
				var numValue = Number(num.val());
				if(numValue - 1 == 0){
					return;
				}
				var id = num.parent().parent().prev().prev().prev().prev().children()[1].innerText;
				$.post("${basePath}/home/cart/changeNum",{
					id : id,
					num : numValue - 1
				},function(result){
					result = $.parseJSON(result);
					layer.msg(result.msg);
					if(result.success){
						num.val(numValue - 1);
						var price = Number(num.parent().parent().prev().text());
						num.parent().parent().next().text(price * (numValue - 1));
					}
				});
			}
			
			function addNum(){
				var num = $("#num");
				var id = num.parent().parent().prev().prev().prev().prev().children()[1].innerText;
				$.post("${basePath}/home/cart/changeNum",{
					id : id,
					num : Number(num.val()) + 1
				},function(result){
					result = $.parseJSON(result);
					layer.msg(result.msg);
					if(result.success){
						num.val(Number(num.val()) + 1);
						var price = Number(num.parent().parent().prev().text());
						num.parent().parent().next().text(price * Number(num.val()));
					}
				});
			}
			
			function getNumFromInput(obj){
				var value = $(obj).val();
				var id = $(obj).parent().parent().prev().prev().prev().prev().children()[1].innerText;
				$.post("${basePath}/home/cart/changeNum",{
					id : id,
					num : value
				},function(result){
					result = $.parseJSON(result);
					layer.msg(result.msg);
					if(result.success){
						$(obj).val(value.replace(/[^0-9]+/g, ''));
						var price = Number($(obj).parent().parent().prev());
						$(obj).parent.parent().next().text(price * Number(value.replace(/[^0-9]+/g, '')));
					}else{
						$(obj).val(1);
						var price = Number($(obj).parent().parent().prev());
						$(obj).parent.parent().next().text(price);
					}
				});
			}
			
			function calculateTotalValue(){
				var totalValue = 0;
				//只计算那些已经被勾选的项目
				$("[name='item-checkbox']").each(function() {
					if($(this).is(":checked")) {
						totalValue += Number($(this).parent().next().next().next().next().next().text());
					}
				});
				$("#totalValue").text(totalValue);
			}
			
			//提交商品信息，前往订单提交界面
			function forwardOrderPage(){
				var cartIds = "";
				$("[name='item-checkbox']").each(function() {
					if($(this).is(":checked")) {
						cartIds += $(this).next().text() + ",";
					}
				});
				if(cartIds == ""){
					layer.msg("请至少选择一项商品");
					return;
				}
				cartIds = cartIds.substr(0 , cartIds.length - 1);
				$("#cartIds").val(cartIds);
				$("#forwardOrderPageBtn").click();
			}
			
		</script>
	</body>

</html>