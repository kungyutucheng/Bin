<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/tagslib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<script src="${basePath }/asserts/address/js/city-picker.data.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath }/asserts/address/js/city-picker.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath }/asserts/address/js/main.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${basePath }/asserts/address/css/city-picker.css" />
		<link rel="stylesheet" type="text/css" href="${basePath }/asserts/address/css/main.css" />
		<title>个人信息</title>
		<style type="text/css">
			.new-address-btn {
				background: #F1F9EA;
				cursor: pointer;
				font-size: medium;
				border: 1px #BFD6AF solid;
				padding: 5px 15px;
				font-weight: bold;
			}
			
			.new-address-btn:hover {
				text-decoration: none;
				color: black;
			}
		
			.address-num{
				color: #71B247;
			}
			.address-item{
				border: 2px #ddd solid;
				width: 100%;
				margin: 10px 0;
			}
			.sub-title{
				margin: 10px 10px 20px 10px;
				font-weight: bold;
				font-size: 14px;
			}
			.address-item .left,.address-item .right{
				display: inline-block;
				font-size: 12px;
				margin: 3px 0;
			}
			.address-item .left{
				text-align: right;
				width: 80px;
				color: #999;
			}
			.address-item .left:after{
				content: "：";
			}
			.address-item .oper{
				text-align: right;
				margin: 10px 10px;
			}
			.width100{
				width:100px;
			}
		</style>
	</head>

	<body>
		<div class="container-fluid iframe-offset-y">
			<div>
				<div>
					<a class="new-address-btn"  onclick="showAddAddr();">新增收货地址</a>
					<span style="vertical-align: middle;margin-left: 10px;color: #999;">您已创建<span class="address-num">5</span>个收货地址，最多可创建<span class="address-num">20</span>个地址</span>
				</div>
				<div id="addNewAddress" style="width: 100%;padding: 10px 80px;display: none;">
					<form class="layui-form" style="border: 1px #ddd dashed;padding:10px;" action="">
						<div class="layui-form-item">
							<div class="layui-form-label width100">收货人</div>
							<div class="layui-input-block">
								<input class="layui-input" required lay-verify="required" autocomplete="off" type="text" name="name" />
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-form-label width100">所在地区</div>
							<div class="layui-input-block">
								<input name="pcc" id="city-picker" class="form-control width100" required lay-verify="required" readonly type="text" data-toggle="city-picker">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-form-label width100">详细地址</div>
							<div class="layui-input-block">
								<input name="detailAddr" class="layui-input" required lay-verify="required" autocomplete="off" type="text" />
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-form-label width100">电话</div>
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
								<button class="layui-btn" lay-submit lay-filter="saveAddress">立即提交</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
			</div>
			<div>
				<ul>
					<c:forEach items="${addresses }" var="address">
					<li>
						<div class="address-item">
							<div class="sub-title">${address.name } &nbsp;&nbsp;${address.province }</div>
							<div>
								<div class="left">收货人</div>
								<div class="right">${address.name }</div>
							</div>
							<div>
								<div class="left">所在地区</div>
								<div class="right">${address.province }&nbsp;&nbsp;${address.city }&nbsp;&nbsp;${address.county }</div>
							</div>
							<div>
								<div class="left">地址</div>
								<div class="right">${address.address }</div>
							</div>
							<div>
								<div class="left">电话</div>
								<div class="right">${address.tel }</div>
							</div>
							<div class="oper">
								<c:choose>
									<c:when test="${address.isDefault == 1 }">
										<a class="extra" name="setDefaultBtn">设为默认</a>
									</c:when>
									<c:otherwise>
										<a class="extra">默认地址</a>
									</c:otherwise>
								</c:choose>
								<a class="extra" name="updateAddressBtn">修改</a>
								<span style="display:none;">${address.id }</span>
								<a class="extra" onclick="deleteAddr(this);">删除</a>
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<script>
			layui.use('form', function() {
				var form = layui.form();

				form.verify({
					tel: [
						/^(0?1[358]\d{9})$|^((0(10|2[1-3]|[3-9]\d{2}))?[1-9]\d{6,7})$/,
						"电话格式有误"
					]
				});
				//监听提交
				form.on('submit(saveAddress)', function(data) {
					console.log(data.field);
					$.post("${basePath}/home/address/save",data.field,function(result){
						result = $.parseJSON(result);
						layer.msg(result.msg);
						if(result.success){
							window.location.reload();
						}
					});
					return false;
				});
				
				form.on('submit(updateAddress)', function(data) {
					$.post("${basePath}/home/address/update",data.field,function(result){
						result = $.parseJSON(result);
						layer.msg(result.msg);
						if(result.success){
							window.location.reload();
						}
					});
					return false;
				});
				
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
										window.location.reload();
									}
								});
							},function(index){
								layer.close(index);
						})
					});
				});
			});

			//显示添加地址区域
			function showAddAddr() {
				$("#addNewAddress").slideDown();
			}

			//隐藏添加地址区域
			function hideAddAddr() {
				$("#addNewAddress").slideUp();
			}
			
			//删除地址
			function deleteAddr(obj){
				var id = $(obj).prev().text();
				/* layer.confirm("确定删除？",
					{btn:["确定","取消"]},
					function(){
						$.post("${basePath}/home/address/delete/"+ id ,function(result){
							result = $.parseJSON(result);
							parent.showMsgInPW(result.msg);
							if(result.success){
								$(obj).parent().parent().parent().remove();
							}
						});
					},function(index){
						layer.close(index);
					}
				); */
				parent.deleteConfirmDialog("确定删除？","${basePath}/home/address/delete/" + id , obj);
			}
		</script>
	</body>

</html>