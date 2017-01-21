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
		<script src="${basePath }/asserts/address/js/city-picker.data.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath }/asserts/address/js/city-picker.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath }/asserts/address/js/main.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${basePath }/asserts/address/css/city-picker.css" />
		<link rel="stylesheet" type="text/css" href="${basePath }/asserts/address/css/main.css" />
		<title>结算</title>
		<style type="text/css">
			.address-item {
				font-size: 12px;
				color: #666;
				margin: 5px 0px;
				width: 100%;
			}
			
			.address-item-brief {
				display: inline-block;
				margin-right: 2px;
				border: 1px #ddd solid;
				padding: 5px 15px;
				cursor: pointer;
			}
			.address-item-brief:hover{
				border: 2px solid #D9534F;
			}
			
			.address-detail {
				text-align: left;
				width: 85%;
				display: inline-block;
				padding: 8px 0;
			}
			
			.address-detail .item {
				margin-right: 10px;
			}
			
			.address-detail .oper {
				float: right;
				display: inline-block;
			}
			
			.address-detail:hover {
				background: #FFF4E8;
			}
			
			.orderHr{
				margin: 20px 15px 10px 15px;
			}
			.pay-way{
				font-size: 12px;
				padding: 5px 15px;
				border: 1px #ddd solid;
				margin: 10px;
				cursor: pointer;
			}
			.pay-way:hover{
				border: 2px solid #D9534F;
			}
			.goods{
				width: 96%;
				background: #F3FBFE;
				margin: 10px 1% 10px 2%;
			}
			.good-item {
				width: 100%;
				border-bottom: 1px #ddd solid;
			}
			.column {
				display: inline-block;
				padding-top: 15px;
				padding-bottom: 15px;
			}
			.order-good{
				width: 80%;
			}
			.order-good .order-good-pic {
				cursor: pointer;
				display: inline-block;
				float: left;
				margin-right: 20px;
				margin-left: 20px;
			}
			
			.order-good .order-good-name {
				text-decoration: none;
				cursor: pointer;
				color: #000;
			}
			
			.order-good .order-good-name:hover {
				color: red;
			}
			.order-price{
				width: 9%;
			}
			.order-price:before{
				content: "￥";
			}
			.order-num{
				width: 9%;
			}
			.order-num:before{
				content: "x";
			}
			.span-active{
				border: 2px solid #D9534F;
			}
		</style>
	</head>

	<body>
		<div class="container">
			<div style="margin-top: 10px;margin-bottom: 20px;">
				<div style="font-size: large;color: #666666;margin-bottom: 10px;text-align:left;font-weight:bolder;">填写并核对订单信息</div>
				<div style="width: 100%;padding-bottom:30px;border: 1px solid #ddd;">
					<div>
						<div>
							<div class="sub-title">收货人信息</div>
						</div>
						<div style="float: right;margin-right: 20px;margin-bottom:10px;">
							<a class="extra" onclick="showAddAddr();" id="addNewAddressBtn">新建地址</a>
						</div>
						<div id="addNewAddress" style="width: 100%;padding: 10px 80px;display: none;">
							<form id="addressForm" class="layui-form" style="border: 1px #ddd dashed;padding:10px;">
								<div class="layui-form-item">
									<div class="layui-form-label" style="width:100px;">收货人</div>
									<div class="layui-input-block">
										<input class="layui-input" required lay-verify="required" autocomplete="off" type="text" name="name" />
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-form-label width100" style="width:100px;">所在地区</div>
									<div class="layui-input-block">
										<input name="pcc" id="city-picker" class="form-control width100" required lay-verify="required" readonly type="text" value="江苏省/常州市/溧阳市" data-toggle="city-picker">
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-form-label width100" style="width:100px;">详细地址</div>
									<div class="layui-input-block">
										<input name="detailAddr" class="layui-input" required lay-verify="required" autocomplete="off" type="text" />
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-form-label width100" style="width:100px;">电话</div>
									<div class="layui-input-block">
										<input name="tel" class="layui-input" required autocomplete="off" type="tel" lay-verify="tel" />
									</div>
								</div>
								<div class="layui-form-item">
							    	<div class="layui-input-block" style="text-align:left;">
							    		<input name="isDefault"  type="checkbox" title="默认地址">
							    	</div>
							  	</div>
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button id="submitAddressBtn" class="layui-btn" lay-submit lay-filter="saveAddress">立即提交</button>
										<button id="resetAddressBtn" type="reset" class="layui-btn layui-btn-primary">重置</button>
										<button type="button" class="layui-btn layui-btn-primary" onclick="hideAddAddr()">收起</button>
									</div>
								</div>
							</form>
						</div>
						<div id="updateAddress" style="width: 100%;padding: 10px 80px;display: none;">
							<form id="updateAddressForm" class="layui-form" style="border: 1px #ddd dashed;padding:10px;">
								<div class="layui-form-item">
									<div class="layui-form-label" style="width:100px;">收货人</div>
									<div class="layui-input-block">
										<input id="addrName" class="layui-input" required lay-verify="required" autocomplete="off" type="text" name="name" />
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-form-label width100" style="width:100px;">所在地区</div>
									<div class="layui-input-block">
										<input id="addrPcc" name="pcc" class="form-control width100" required lay-verify="required" readonly type="text" data-toggle="city-picker">
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-form-label width100" style="width:100px;">详细地址</div>
									<div class="layui-input-block">
										<input id="addrDetailAddr" name="detailAddr" class="layui-input" required lay-verify="required" autocomplete="off" type="text" />
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-form-label width100" style="width:100px;">电话</div>
									<div class="layui-input-block">
										<input id="addrTel" name="tel" class="layui-input" required autocomplete="off" type="tel" lay-verify="tel" />
									</div>
								</div>
								<div class="layui-form-item">
							    	<div class="layui-input-block" style="text-align:left;">
							    		<input id="addrIsDefault" name="isDefault"  type="checkbox" title="默认地址">
							    	</div>
							  	</div>
								<div class="layui-form-item">
									<div class="layui-input-block">
										<input type="hidden" id="addrId" name="id">
										<button id="submitAddressBtn" class="layui-btn" lay-submit lay-filter="updateAddress">立即提交</button>
										<button id="resetAddressBtn" type="reset" class="layui-btn layui-btn-primary">重置</button>
										<button type="button" class="layui-btn layui-btn-primary" onclick="hideUpdateAddr()">收起</button>
									</div>
								</div>
							</form>
						</div>
						<div style="width: 100%;margin-top:20px;clear:both;">
							<ul id="addressList" style="list-style: none;text-align: center;">
							</ul>
						</div>
					</div>
					<hr class="orderHr"/>
					<div>
						<div class="sub-title">支付方式</div>
						<div style="margin-left: 25px;margin-top: 20px;">
							<span class="pay-way span-active" onclick="changePayWay(this,1);">在线支付</span>
							<span class="pay-way" onclick="changePayWay(this,2);">货到付款</span>
						</div>
					</div>
					<hr class="orderHr"/>
					<div>
						<div class="sub-title">商品清单</div>
						<div class="goods">
							<c:forEach items="${carts }" var="cart">
							<div class="good-item">
								<div class="column order-good" style="vertical-align: middle;">
									<a class="order-good-pic"><img src="img/56b16594Nb8807f03.jpg" /></a>
									<a class="order-good-name">${cart.goodName }</a>
								</div>
								<div class="column order-price">
									${cart.price }
								</div>
								<div class="column order-num">
									${cart.num }
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
					<hr class="orderHr"/>
					<div>
						<div class="sub-title">发票信息</div>
						<div>
							<form class="layui-form" id="saveOrderForm">
								<div class="layui-form-item">
									<div class="layui-form-label width100" style="width:100px;">发票开头</div>
									<div class="layui-input-block">
										<input class="layui-input" style="width: 370px;" type="text" name="receiptName"/>
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-form-label width100" style="width:100px;">发票类别 </div>
									<div class="layui-input-block" style="width: 370px;">
										<select name="receiptContent" >
											<option value="1">电脑配件</option>
        									<option value="2">食品</option>
										</select>
									</div>
								</div>
								<input id="aid" name="aid" type="hidden" value="0">
								<input id="payWay" name="payWay" type="hidden" value="1">
								<input name="totalValue" type="hidden" value="${totalValue }">
								<input name="cids" type="hidden" value="${cids }">
							</form>
						</div>
					</div>
				</div>
			</div>
			<div style="text-align: right;margin-bottom: 30px;">
				<div>
					应付总额：<span class="order-price" style="color: #D9534F;font-weight: bold;font-size: 20px;">${totalValue }</span>
				</div>
				<div style="margin-top: 30px;">
					<a class="myBtn" id="submitOrderBtn">提交订单</a>
				</div>
			</div>
		</div>
		<form style="display:none;" id="payPageForm">
			<button id="forwardPayPageBtn" type="submit"></button>
		</form>
	</body>
	<script>
		layui.use('form', function() {
			var form = layui.form();

			form.verify({
				tel : function(value){
					if(!/^(0?1[358]\d{9})$|^((0(10|2[1-3]|[3-9]\d{2}))?[1-9]\d{6,7})$/.test(value)){
						return "电话格式有误";
					}
				}
			});
			//监听提交
			form.on('submit(saveAddress)', function(data) {
				console.log(data.field);
				$.post("${basePath}/home/address/save",data.field,function(result){
					result = $.parseJSON(result);
					layer.msg(result.msg);
					if(result.success){
						hideAddAddr();
						loadAddressData();
					}
				});
				return false;
			});
			
			form.on('submit(updateAddress)', function(data) {
				$.post("${basePath}/home/address/update",data.field,function(result){
					result = $.parseJSON(result);
					layer.msg(result.msg);
					if(result.success){
						$("#updateAddress").slideUp();
						loadAddressData();
					}
				});
				return false;
			});
			loadAddressData();
			
		
			function loadAddressData(){
				$.post('${basePath}/home/address/list',null,function(result){
					result = $.parseJSON(result);
					if(result.length > 0){
						var addressList = $("#addressList");
						var html = "";
						for(var i = 0 ;i < result.length ; i++){
							var address = result[i];
							if(address.isDefault == 2){
								html += '<li>'+
								'<div class="address-item">'+
									'<span class="address-item-brief span-active" onclick="changeAddr(this);">' + address.name + '&nbsp;&nbsp;' + address.province + '</span>'+
									'<span style="display:none;">' + address.id + '</span>' +
									'<span class="address-detail">'+
										'<span class="item">' + address.name + '</span>'+
										'<span class="item">' + address.province + '</span>'+
										'<span class="item">' + address.city + '</span>'+
										'<span class="item">' + address.county + '</span>'+
										'<span class="item">' + address.address + '</span>'+
										'<span class="item">' + address.tel + '</span>'+
										'<span class="oper">'+
											'<a class="extra">默认地址</a>'+
											'<a class="extra" name="updateAddressBtn">修改</a>'+
											'<span style="display:none;">' + address.id + '</span>' +
											'<a class="extra" onclick="deleteAddr(this);">删除</a>'+
										'</span>'+
									'</span>'+
								'</div>'+
							'</li>';
							$("#aid").val(address.id);
							}
						}
						for(var i = 0 ;i < result.length ; i++){
							var address = result[i];
							if(address.isDefault == 1){
								html += '<li>'+
										'<div class="address-item">'+
											'<span class="address-item-brief" onclick="changeAddr(this);">' + address.name + '&nbsp;&nbsp;' + address.province + '</span>'+
											'<span style="display:none;">' + address.id + '</span>' +
											'<span class="address-detail">'+
												'<span class="item">' + address.name + '</span>'+
												'<span class="item">' + address.province + '</span>'+
												'<span class="item">' + address.city + '</span>'+
												'<span class="item">' + address.county + '</span>'+
												'<span class="item">' + address.address + '</span>'+
												'<span class="item">' + address.tel + '</span>'+
												'<span class="oper">'+
													'<a class="extra" name="setDefaultBtn">设为默认地址</a>'+
													'<a class="extra" name="updateAddressBtn">修改</a>'+
													'<span style="display:none;">' + address.id + '</span>' +
													'<a class="extra" onclick="deleteAddr(this);">删除</a>'+
												'</span>'+
											'</span>'+
										'</div>'+
									'</li>';
							}
						}
						addressList.html(html);
						$("a[name='updateAddressBtn']").each(function(){
							$(this).on("click",function(){
								var id = $(this).next().text();
								$.post("${basePath}/home/address/getById/" + id , null , function(result){
									result = $.parseJSON(result);
									$("#addrId").val(result.id);
									$("#addrName").val(result.name);
									var parent = $("#addrPcc").parent();
									$("#addrPcc").remove();
									parent.html('<input id="addrPcc" name="pcc" class="form-control width100" required lay-verify="required" readonly type="text" data-toggle="city-picker">')
									$('#addrPcc').citypicker({
										province: result.province,
										city: result.city,
										district: result.county
									});
									$("#addrDetailAddr").val(result.address);
									$("#addrTel").val(result.tel);
									if(result.isDefault == 1){
										$("#addrIsDefault").prop("checked",false);
									}else{
										$("#addrIsDefault").prop("checked",true);
										
									}
									$("#updateAddress").slideDown();
									window.location.hash = "#updateAddress";
									form.render();
								});
							})
						});
						
						$("a[name='setDefaultBtn']").each(function(){
							$(this).on("click",function(){
								var id = $(this).next().next().text();
								layer.confirm("确定设置为默认地址？",
									{btn:["确定","取消"]},
									function(index){
										$.post("${basePath}/home/address/setDefault/" + id , null,function(result){
											result = $.parseJSON(result);
											layer.msg(result.msg);
											if(result.success){
												loadAddressData();
											}
										});
									},function(index){
										layer.close(index);
								})
							});
						});
					}
				});
			}
			
			$("#submitOrderBtn").on("click",function(){
				if($("#aid").val() == 0){
					layer.msg("请选择地址");
					return;
				}
				if($("#payWay").val() == 0){
					layer.msg("请选择支付方式");
					return;
				}
				$.post("${basePath}/home/order/save",$("#saveOrderForm").serializeObject(),function(result){
					result = $.parseJSON(result);
					layer.msg(result.msg);
					if(result.success){
						$("#payPageForm").attr("action","${basePath}/home/order/payPage/" + result.data);
						$("#forwardPayPageBtn").click();
					}
				});
			});
			
		});
		
		//显示添加地址区域
		function showAddAddr() {
			$("#addNewAddress").slideDown();
			$("#addNewAddressBtn").hide();
			$("#resetAddressBtn").click();
		}

		//隐藏添加地址区域
		function hideAddAddr() {
			$("#addNewAddress").slideUp();
			$("#addNewAddressBtn").show();
		}
		
		function hideUpdateAddr(){
			$("#updateAddress").slideUp();
		}

		//删除地址
		function deleteAddr(obj){
			var id = $(obj).prev().text();
			layer.confirm("确定删除？",
				{btn:["确定","取消"]},
				function(){
					$.post("${basePath}/home/address/delete/"+ id ,function(result){
						result = $.parseJSON(result);
						layer.msg(result.msg);
						if(result.success){
							$(obj).parent().parent().parent().parent().remove();
						}
					});
				},function(index){
					layer.close(index);
				}
			);
		}
		
		//更换地址
		function changeAddr(obj){
			$(".address-item-brief").each(function(){
				$(this).attr("class","address-item-brief");
			})
			$(obj).attr("class","address-item-brief span-active");
			$("#aid").val($(obj).next().text());
		}
		
		//更改支付方式
		function changePayWay(obj,value){
			$(".pay-way").each(function(){
				$(this).attr("class","pay-way");
			});
			$(obj).attr("class","pay-way span-active");
			$("#payWay").val(value);
		}
		
	</script>

</html>