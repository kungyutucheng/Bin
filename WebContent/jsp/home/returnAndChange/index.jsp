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
		<title>返修或退换货</title>
		<script src="${basePath }/asserts/address/js/city-picker.data.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath }/asserts/address/js/city-picker.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath }/asserts/address/js/main.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${basePath }/asserts/address/css/city-picker.css" />
		<style type="text/css">
			.msg-block{
				border: 1px #ddd solid;
				margin: 20px 0;
				padding: 20px 0;
			}
			.service-type{
				margin-top: 10px;
				padding: 5px 20px;
				border: 1px #ddd solid;
				cursor: pointer;
			}
			.service-type-active{
				border: 2px #D9534F solid;
				cursor: pointer;
			}
			.service-type:hover{
				border: 2px #D9534F solid;
				cursor: pointer;
				color: #D9534F;
			}
			.content{
				padding: 10px;
				padding-left: 0;
				text-align: left;
			}
			.width100{
				width : 100px;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="sub-title">
				申请售后
			</div>
			<div>
				<table class="myTable" style="margin-top: 10px;">
					<thead>
						<th>商品名称</th>
						<th>商品特性</th>
						<th>购买数量</th>
					</thead>
					<tbody>
						<tr>
							<td>
								<img src="${basePath }/image/getImage/${good.picSm }" />
								<span>${good.name }</span>
							</td>
							<td>${goodProperty.name }</td>
							<td>${orderGood.num }</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="margin: 10px;">
				<span style="color: #D9534F;">*温馨提示：</span>本次售后服务将由<span style="color: #D9534F;">${good.owner['name'] }</span>为您提供
			</div>
			<form method="post" action="${basePath }/home/returnAndChange/save">
				<div class="msg-block">
					<div class="layui-form-item">
						<div class="layui-form-label width100">
							服务类型：
						</div>
						<div class="layui-input-block content">
							<span class="service-type service-type-active" name="serviceType">换货</span>
							<span class="service-type" name="serviceType">退货</span>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-form-label width100">
							提交数量：
						</div>
						<div class="layui-input-block">
							<div class="input-group" style="width: 140px;float: left;position: absolute;">
							  	<span class="input-group-addon" style="cursor: pointer;" onclick="subNum();">-</span>
							  	<input name="num" id="num" type="text" class="form-control" value="${orderGood.num }" style="height: 40px;text-align: center;" onblur="getNumFromInput(this);">
							  	<span class="input-group-addon" style="cursor: pointer;" onclick="addNum();">+</span>
							</div>
							<div style="text-align:left;margin-left: 150px;padding-top: 10px;">您最多可以提交数量为${orderGood.num }个</div>
						</div>
					</div>
					<div class="layui-form-item">
						 <div class="layui-form-label width100">
						 	问题描述：
						 </div>
						 <div class="layui-input-block">
						 	<textarea name="description" class="layui-textarea" rows="5" style="width: 600px;"></textarea>
						 </div>
					</div>
					<div class="layui-form-item" id="exchangeMsgDiv">
						 <div class="layui-form-label width100">
						 	更换信息：
						 </div>
						 <div class="layui-input-block">
						 	<textarea name="rechangeMsg" class="layui-textarea" rows="5" style="width: 600px;"></textarea>
						 </div>
					</div>
				</div>
				<div class="msg-block" id="changeBlock">
					<div class="sub-title">
						确认信息
					</div>
					<div class="layui-form-item">
						<div class="layui-form-label width100">
							返回方式：
						</div>
						<div class="layui-input-block content">
							买家自寄
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-form-label width100">所在地区：</div>
						<div class="layui-input-block">
							<input name="pcc" id="city-picker" class="form-control width100" required lay-verify="required" value="${address.province }/${address.city}/${address.county}" readonly type="text" data-toggle="city-picker" style="width:600px;">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-form-label width100">
							收货地址：
						</div>
						<div class="layui-input-block">
							<input type="text" name="address" value="${address.address }" class="layui-input" style="width:600px;"/>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-form-label width100">
							顾客姓名：
						</div>
						<div class="layui-input-block">
							<input type="text" name="receiver" value="${address.name }" class="layui-input"  style="width:600px;"/>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-form-label width100">
							联系电话：
						</div>
						<div class="layui-input-block">
							<input type="text" name="tel" value="${address.tel }" class="layui-input"  style="width:600px;"/>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="submitReturnAndChange">提交</button>
					</div>
				</div>
				<input type="hidden" name="aid" value="${address.id }">
				<input type="hidden" name="ogid" value="${orderGood.id }">
				<input type="hidden" name="oid" value="${orderGood.oid }">
				<input type="hidden" name="gNo" value="${good.no }">
				<input type="hidden" name="type" value="2">
			</form>
		</div>
		<script type="text/javascript">
			$("span[name='serviceType']").each(function(){
				$(this).on("click",function(){
					$("span[name='serviceType']").each(function(){
						$(this).attr("class","service-type");
					});
					$(this).attr("class","service-type service-type-active");
					if($(this).text() == "换货"){
						$("#exchangeMsgDiv").slideDown();
						$("#exchangeMsg").attr("disabled",false);
						$("input[name='type']").val(2);
						$("#changeBlock").slideDown();
					}else{
						$("#exchangeMsgDiv").slideUp();
						$("#exchangeMsg").attr("disabled",true);
						$("input[name='type']").val(1);
						$("#changeBlock").slideUp();
					}
				});
			});
			layui.use('form' , function(){
				var form = layui.form();
			});
			
			function subNum(){
				var num = $("#num");
				if(num.val() == 1){
					return;
				}else{
					num.val(Number(num.val()) - 1);
				}
			}
			
			function addNum(){
				var num = $("#num");
				num.val(Number(num.val()) + 1);
			}
			
			function getNumFromInput(obj){
				var value = $(obj).val();
				$(obj).val(value.replace(/[^0-9]+/g, ''));
			}
			
		</script>
	</body>
</html>
