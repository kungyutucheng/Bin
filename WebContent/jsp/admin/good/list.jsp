<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/tagslib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>商品管理</title>
		<link rel="stylesheet" href="${basePath }/asserts/uploadify/uploadify.css">
		<style type="text/css">
			.search-div {
				width: 99%;
				border: 1px #ddd solid;
				background: #fff;
			}
			
			.text-bar {
				background: #f1f1f1;
				padding: 5px 10px;
			}
			
			.text-bar .text {
				text-align: left;
			}
			
			.text-bar .icon {
				text-align: right;
				float: right;
				cursor: pointer;
			}
			
			.text-bar .icon:hover {
				color: #1AA094;
			}
			
			.search-div .filter {
				margin: 10px auto;
				text-align: center;
			}
			
			.tool-bar {
				width: 99%;
				border: 1px #ddd solid;
				padding: 10px 10px;
				margin: 10px 0;
			}
			
			.result-div {
				width: 99%;
				border: 1px #ddd solid;
				background: #fff;
				margin: 10px 0;
			}
			
			.table {
				font-size:14px;
				width: 100%;
				border: 1px #f1f1f1 solid;
				text-align: center;
				border-width: 1px 0px 0px 1px;
			}
			
			.table > thead > tr > th {
				background: #f1f1f1;
				text-align: center;
				padding: 5px 0;
			}
			
			.table > tbody > tr > td {
				border: solid #ddd;
				border-width: 0px 1px 1px 0px;
				padding: 10px 0px;
			}
			
			.table > tbody > tr:nth-child(odd):hover {
				background: #E3D070;
			}
			
			.inner-table {
				width: 100%;
				border: 1px #f1f1f1 dashed;
				border-width: 1px 0px 0px 1px;
				text-align:center;
			}
			
			.inner-table tbody tr td {
				border: 1px dashed #ddd;
				padding: 10px 0px;
				border-width: 0px 1px 1px 0px;
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
				<form class="layui-form" id="searchForm">
					<div class="layui-form-item">
						<div class="layui-inline">
							<div class="layui-form-label width100">名称</div>
							<div class="layui-input-block">
								<input type="text" name="name" class="layui-input" />
							</div>
						</div>
						<div class="layui-inline">
							<div class="layui-form-label width100">编号</div>
							<div class="layui-input-block">
								<input type="text" name="name" class="layui-input" />
							</div>
						</div>
						<div class="layui-inline">
							<div class="layui-form-label width100">价格</div>
							<div class="layui-input-block">
								<input type="text" name="name" class="layui-input" />
							</div>
						</div>
					</div>
					<div id="moreFilter" style="display: none;">
						<div class="layui-form-item">
							<div class="layui-inline">
								<div class="layui-form-label width100">
									品牌
								</div>
								<div class="layui-input-block">
									<input type="text" name="brand" class="layui-input" />
								</div>
							</div>
							<div class="layui-inline">
								<div class="layui-form-label width100" style="width:110px;">
									上架时间
								</div>
								<div class="layui-input-block">
									<input class="layui-input" placeholder="开始时间" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
								</div>
							</div>
							<div class="layui-inline">
								<div class="layui-form-label width100">
									-
								</div>
								<div class="layui-input-block">
									<input class="layui-input" placeholder="结束时间" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
								</div>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<input type="hidden" name="pageSize" value="10">
							<input type="hidden" name="page" value="1">
							<button class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							<button type="reset" class="layui-btn layui-btn-primary" onclick="showMoreFilter(this);">更多条件</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="tool-bar">
			<button class="layui-btn" id="addGoodBtn">上架新商品</button>
			<button class="layui-btn" id="uploadImageBtn">上传图片</button>
			<button class="layui-btn" onclick="launchGoods();">上架商品</button>
			<button class="layui-btn" onclick="removeGoods();">下架商品</button>
		</div>
		<div class="result-div">
			<table class="table">
				<thead>
					<th><input type="checkbox" id="selectAll" /></th>
					<th>id</th>
					<th>名称</th>
					<th>编号</th>
					<th>已售数量</th>
					<th>状态</th>
					<th>上架时间</th>
					<th>操作</th>
				</thead>
				<tbody id="dg">
				</tbody>
			</table>
			<div id="page" style="width:100%;text-align: center;"></div>
		</div>
		<!-- 添加商品 start -->
		<div class="modal fade" id="addGoodModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" style="width:1000px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">上架新商品</h4>
					</div>
					<div class="modal-body" style="text-align: left;">
						<form class="layui-form" id="addGoodForm">
							<div class="layui-form-item">
								<div class="layui-inline">
									<div class="layui-form-label">名称</div>
									<div class="layui-input-block">
										<input type="text" name="name" id="gName" class="layui-input" lay-verify="required"/>
									</div>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label">大类别</label>
									<div class="layui-input-block" style="width:180px;">
										<select id="gScope" name="scope" lay-verify="required">
										</select>
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label">品牌</div>
									<div class="layui-input-block">
										<input type="text" name="brand" id="gBrand" class="layui-input"  lay-verify="required"/>
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-form-label">信息</div>
								<div class="layui-input-block" style="width:790px;">
									<input type="text" name="msg" id="gMsg" class="layui-input"  lay-verify="required"/>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-inline">
									<div class="layui-form-label">小类别</div>
									<div class="layui-input-block">
										<input type="text" name="type" id="gType" class="layui-input"  lay-verify="required"/>
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label">毛重</div>
									<div class="layui-input-block">
										<input type="number" name="grossWeight" id="gGrossWeight" class="layui-input" />
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label">净重</div>
									<div class="layui-input-block">
										<input type="number" name="netWeight" id="gNetWeight" class="layui-input" />
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button type="button" class="layui-btn" id="addPropertiesBtn">添加属性</button>
								</div>
							</div>
							<div class="layui-form-item" id="propertiesDiv">
							</div>
							<div class="layui-form-item" style="text-align:center;">
								<button class="layui-btn" lay-submit lay-filter="saveGood">保存</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 添加商品 end -->
		<!-- 图片上传 start -->
		<div class="modal fade" id="uploadImageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" style="width:1000px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">上传图片</h4>
					</div>
					<div class="modal-body" style="text-align: left;">
						<input type="hidden" name="no" id="gNo"> 
						<input type="file" name="file_upload" id="file_upload" />
						<button type="button" class="btn btn-primary start" onclick="javascript:$('#file_upload').uploadify('upload', '*');">
							<i class="glyphicon glyphicon-upload"></i>
							<span>开始上传</span>
						</button>
						<button type="button" class="btn btn-warning cancel" onclick="javascript:$('#file_upload').uploadify('cancel', '*');">
							<i class="glyphicon glyphicon-ban-circle"></i>
							<span>取消上传</span>
						</button>
						<button type="button" class="btn btn-danger delete" onclick="javascript:$('#file_upload').uploadify('stop');">
							<i class="glyphicon glyphicon-stop"></i>
							<span>停止</span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 图片上传 end -->
		
		<div class="modal fade" id="goodDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" style="width:1000px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">商品详情</h4>
					</div>
					<div class="modal-body" style="text-align: left;">
						<form class="layui-form" id="updateGoodForm">
							<div class="layui-form-item">
								<div class="layui-inline">
									<div class="layui-form-label">名称</div>
									<div class="layui-input-block">
										<input type="text" name="name" class="layui-input" lay-verify="required"/>
										<input type="hidden" name="id" class="layui-input"/>
										<input type="hidden" name="oid" class="layui-input"/>
									</div>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label">大类别</label>
									<div class="layui-input-block" style="width:180px;">
										<select id="updateGoodScope" name="scope" lay-verify="required">
										</select>
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label">品牌</div>
									<div class="layui-input-block">
										<input type="text" name="brand" class="layui-input"  lay-verify="required"/>
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-form-label">信息</div>
								<div class="layui-input-block" style="width:790px;">
									<input type="text" name="msg" class="layui-input"  lay-verify="required"/>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-inline">
									<div class="layui-form-label">小类别</div>
									<div class="layui-input-block">
										<input type="text" name="type" class="layui-input"  lay-verify="required"/>
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label">毛重</div>
									<div class="layui-input-block">
										<input type="number" name="grossWeight" class="layui-input" />
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label">净重</div>
									<div class="layui-input-block">
										<input type="number" name="netWeight" class="layui-input" />
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-inline">
									<div class="layui-form-label">编号</div>
									<div class="layui-input-block">
										<input type="text" name="no" readonly class="layui-input"  lay-verify="required"/>
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label">状态</div>
									<div class="layui-input-block" style="width:180px;">
										<select id="updateGoodStatus" name="status" disabled>
											<option value="1">上架中</option>
											<option value="2">已上架</option>
											<option value="3">已下架</option>
										</select>
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label" style="width:110px;">已售数量</div>
									<div class="layui-input-block">
										<input type="number" name="soldNum" readonly class="layui-input" />
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-inline">
									<div class="layui-form-label">品牌</div>
									<div class="layui-input-block">
										<input type="text" name="brand" class="layui-input"  lay-verify="required"/>
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label" style="width:110px;">上架时间</div>
									<div class="layui-input-block">
										<input type="text" name="createTime" readonly class="layui-input" />
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label" style="width:110px;">下架时间</div>
									<div class="layui-input-block">
										<input type="text" name="removeTime" readonly class="layui-input" />
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button type="button" class="layui-btn" id="addUpdatePropertiesBtn">添加属性</button>
								</div>
							</div>
							<div class="layui-form-item" id="updatePropertiesDiv">
							</div>
							<div class="layui-form-item" style="text-align:center;">
								<button class="layui-btn" lay-submit lay-filter="updateGood">保存</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 删除商品start -->
		<div class="modal fade" id="removeGoodModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">下架商品</h4>
					</div>
					<div class="modal-body" style="text-align: center;">
						确定下架商品<span style="color: #D9534F;padding-left: 10px;font-size: 16px;">随便啦</span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 删除商品end -->
		<!-- 图片上传js start -->
		<script type="text/javascript" src="${basePath }/asserts/uploadify/jquery.uploadify.min.js"></script>
		<script type="text/javascript">
		    $(function() {
		        $('#file_upload').uploadify({
		        	'auto'     : false,
		        	'removeCompleted' : false,
		        	'buttonText' : '选择文件',
		            'swf'      : '${basePath }/asserts/uploadify/uploadify.swf',
		            'uploader' : '${basePath }/image/upload'
		        });
		    });
		    
		</script>
		<!-- 图片上传js end -->
		<script type="text/javascript">
		$(function() {
			layui.use(['laypage', 'jquery','form'], function() {
				var laypage = layui.laypage;
				laypage({
					cont: 'page', //id
					pages: 100, //总页数
					curr: 1, //当前页
					groups: 5, //连续显示分页数
					jump: function(obj, first) {}
				});
				var $ = layui.jquery;
				var form = layui.form();
				
				//加载初始数据
				loadGoodData();
				
				//初始化大类别数据源
				$.post("${basePath}/goodScope/getAll",null,function(result){
					result = $.parseJSON(result);
					var selectors = $("select[name='scope']");
					$("select[name='scope']").each(function(){
						console.log(1);
						var html = "";
						for(var i = 0 ;i < result.length;i++){
							html += "<option value='" + result[i].value + "'>" + result[i].name + "</option>";
						}
						$(this).html(html);
					}); 
					form.render();
				});
				
				//记录当前属性项的个数
				var propertyItems = 0;
				$("#addGoodBtn").on("click",function(){
					$("#propertiesDiv").html("");
					$("#addGoodModal").modal("show");
					propertyItems = 0;
				});
				
				$("#uploadImageBtn").on("click",function(){
					$("#uploadImageModal").modal("show");
				});
				
				$("#addUpdatePropertiesBtn").on("click",function(){
					var propertiesDiv = 
						'<div class="layui-form-item">'+
							'<div class="layui-inline">'+
								'<label class="layui-form-label">名称</label>'+
								'<div class="layui-input-block">'+
									'<input type="text" name="goodProperties['+ updatePropertyItems +'].name" class="layui-input" style="width:150px;" lay-verify="required"/>'+
								'</div>'+
							'</div>'+
							'<div class="layui-inline">'+
								'<label class="layui-form-label">数量</label>'+
								'<div class="layui-input-block">'+
									'<input type="number" name="goodProperties['+ updatePropertyItems +'].num" class="layui-input" style="width:150px;" lay-verify="required"/>'+
								'</div>'+
							'</div>'+
							'<div class="layui-inline">'+
								'<label class="layui-form-label">价格</label>'+
								'<div class="layui-input-block">'+
									'<input type="number" name="goodProperties['+ updatePropertyItems +'].price" class="layui-input" style="width:150px;" lay-verify="required"/>'+
								'</div>'+
							'</div>'+
							'<div class="layui-inline">'+
								'<button type="button" class="btn btn-warning delete" style="margin-bottom:7px;"'+
								 ' onclick="deletePropertyItem(this);">'+
									'<i class="glyphicon glyphicon-trash"></i>&nbsp;&nbsp;'+
									'<span>删除</span>'+
								'</button>'+
							'</div>'+
						'</div>';
					$("#updatePropertiesDiv").append(propertiesDiv);
					updatePropertyItems++;
					form.render();
				})
				
				
				$("#addPropertiesBtn").on("click",function(){
					var propertiesDiv = 
						'<div class="layui-form-item">'+
							'<div class="layui-inline">'+
								'<label class="layui-form-label">名称</label>'+
								'<div class="layui-input-block">'+
									'<input type="text" name="goodProperties['+ propertyItems +'].name" class="layui-input" style="width:150px;" lay-verify="required"/>'+
								'</div>'+
							'</div>'+
							'<div class="layui-inline">'+
								'<label class="layui-form-label">数量</label>'+
								'<div class="layui-input-block">'+
									'<input type="number" name="goodProperties['+ propertyItems +'].num" class="layui-input" style="width:150px;" lay-verify="required"/>'+
								'</div>'+
							'</div>'+
							'<div class="layui-inline">'+
								'<label class="layui-form-label">价格</label>'+
								'<div class="layui-input-block">'+
									'<input type="number" name="goodProperties['+ propertyItems +'].price" class="layui-input" style="width:150px;" lay-verify="required"/>'+
								'</div>'+
							'</div>'+
							'<div class="layui-inline">'+
								'<button type="button" class="btn btn-warning delete" style="margin-bottom:7px;"'+
								 ' onclick="deletePropertyItem(this);">'+
									'<i class="glyphicon glyphicon-trash"></i>&nbsp;&nbsp;'+
									'<span>删除</span>'+
								'</button>'+
							'</div>'+
						'</div>';
					$("#propertiesDiv").append(propertiesDiv);
					propertyItems++;
					form.render();
				});
				
				//提交商品信息
				form.on("submit(saveGood)",function(data){
					$.post("${basePath}/good/save",data.field,function(result){
						result = $.parseJSON(result);
						layer.msg(result.msg);
						if(result.success){
							$("#addGoodModal").modal("hide");
							loadGoodData();
						}
					});
					return false;
				});
				
				//更新商品信息
				form.on("submit(updateGood)",function(data){
					$.post("${basePath}/good/update",data.field,function(result){
						result = $.parseJSON(result);
						layer.msg(result.msg);
						if(result.success){
							$("#goodDetailModal").modal("hide");
							loadGoodData();
						}
					});
					return false;
				});
			});

			layui.use('laydate', function() {
				var laydate = layui.laydate;
			});
		})
			var flag = true;
			$(".icon").on("click", function() {
				if(flag) {
					$(this).html('<i class="layui-icon" id="iconSwitch">&#xe61a;</i>');
					flag = false;
					$(".filter").slideUp();
				} else {
					$(this).html('<i class="layui-icon" id="iconSwitch">&#xe619;</i>')
					flag = true;
					$(".filter").slideDown();
				}
			});

			$("#selectAll").on("change", function() {
				if($(this).is(":checked")) {
					$("input[name='selectItem']").each(function() {
						$(this).prop("checked", true);
					});
				} else {
					$("input[name='selectItem']").each(function() {
						$(this).prop("checked", false);
					});
				}
			});

			function hasSelectAll() {
				var hasSelectAll = true;
				$("input[name='selectItem']").each(function() {
					if(!$(this).is(":checked")) {
						hasSelectAll = false;
					}
				});
				if(hasSelectAll) {
					$("#selectAll").prop("checked", true);
				} else {
					$("#selectAll").prop("checked", false);
				}
			}

			function removeGood() {
				$("#removeGoodModal").modal("show");
			}


			//上架商品
			function launchGoods() {
				var ids = "";
				$("input[name='selectItem']").each(function() {
					if($(this).is(":checked")) {
						ids += $(this).next().text() + ",";
					}
				});
				ids = ids.substr(AnimationEvent, ids.length - 1);
			}

			//下架商品
			function removeGoods() {
				var ids = "";
				$("input[name='selectItem']").each(function() {
					if($(this).is(":checked")) {
						ids += $(this).next().text() + ",";
					}
				});
				ids = ids.substr(AnimationEvent, ids.length - 1);
			}
			
			//显示更多筛选条件
			function showMoreFilter(obj){
				$(obj).text($(obj).text() == "更多条件"?"收起":"更多条件");
				$("#moreFilter").slideToggle();
			}
			
			//删除新增的属性输入项
			function deletePropertyItem(obj){
				$(obj).parent().parent().remove();
			}
			
			//加载商品数据
			function loadGoodData(){
				$.post("${basePath}/good/searchgrid",$("#searchForm").serializeObject(),function(result){
					result = $.parseJSON(result);
					var rows = result.rows;
					if(rows && rows.length > 0){
						var data = "";
						for(var i = 0 ;i < rows.length ; i++){
							var row = rows[i];
							data += 
								'<tr>'+
									'<td>'+
										'<input type="checkbox" name="selectItem" onchange="hasSelectAll()" />'+
									'</td>'+
									'<td>' + row.id + '</td>'+
									'<td>' + row.name + '</td>'+
									'<td>' + row.no + '</td>'+
									'<td>' + row.soldNum + '</td>'+
									'<td>' + bin.getGoodStatus(row.status) + '</td>'+
									'<td>' + new Date(row.createTime).format("yyyy-MM-dd hh:mm:ss") + '</td>'+
									'<td>'+
										'<span>'+
											'<a class="extra" onclick="showGoodDetail(' + row.id +')">详情</a>'+
										'</span>'+
									'</td>'+
								'</tr>';
						}
						$("#dg").html(data);
					}
				});
			}
			
			var updatePropertyItems = 0;
			function showGoodDetail(id){
				$("#goodDetailModal").modal("show");
				var index = layer.load();
				$.post("${basePath}/good/searchgrid",{
					id:id
				},function(result){
					result = $.parseJSON(result);
					var goodRow = result.rows[0];
					goodRow.createTime = new Date(goodRow.createTime).format("yyyy-MM-dd hh:mm:ss");
					goodRow.removeTime = goodRow.removeTime == null ? null:new Date(goodRow.removeTime).format("yyyy-MM-dd hh:mm:ss");
					$("#updateGoodForm").setForm(goodRow);
					$("#updateGoodScope").find("option").each(function(){
						if($(this).val() == goodRow.scope){
							$(this).attr("selected",true);
							$(this).parent().next().first().find("input").val($(this).text());
						}
					});
					$("#updateGoodStatus").find("option").each(function(){
						if($(this).val() == goodRow.status){
							$(this).attr("selected",true);
							$(this).parent().next().first().find("input").val($(this).text());
						}
					})
					$("#updateGoodStatus").prop("disabled",false);
					$.post("${basePath}/goodProperties/searchgrid",{
						gid:id,
						isShowAll:true
					},function(result){
						updatePropertyItems = 0;
						result = $.parseJSON(result);
						var rows = result.rows;
						var propertiesDiv = "";
						$("#updatePropertiesDiv").html("");
						for(var i = 0 ;i < rows.length ; i++){
							var row = rows[i];
							propertiesDiv += 
							'<div class="layui-form-item">'+
								'<div class="layui-inline">'+
									'<label class="layui-form-label">名称</label>'+
									'<div class="layui-input-block">'+
										'<input type="text" name="goodProperties['+ updatePropertyItems +'].name" class="layui-input" style="width:150px;" lay-verify="required" value="' + row.name + '"/>'+
										'<input type="hidden" name="goodProperties['+ updatePropertyItems +'].id" class="layui-input" style="width:150px;" value="' + row.id + '"/>'+
									'</div>'+
								'</div>'+
								'<div class="layui-inline">'+
									'<label class="layui-form-label">数量</label>'+
									'<div class="layui-input-block">'+
										'<input type="number" name="goodProperties['+ updatePropertyItems +'].num" class="layui-input" style="width:150px;" lay-verify="required" value="' + row.num + '"/>'+
									'</div>'+
								'</div>'+
								'<div class="layui-inline">'+
									'<label class="layui-form-label">价格</label>'+
									'<div class="layui-input-block">'+
										'<input type="number" name="goodProperties['+ updatePropertyItems +'].price" class="layui-input" style="width:150px;" lay-verify="required" value="' + row.price + '"/>'+
									'</div>'+
								'</div>'+
								'<div class="layui-inline">'+
									'<button type="button" class="btn btn-warning delete" style="margin-bottom:7px;"'+
									 ' onclick="deletePropertyItemOnServer(this,' + row.id + ');">'+
										'<i class="glyphicon glyphicon-trash"></i>&nbsp;&nbsp;'+
										'<span>删除</span>'+
									'</button>'+
								'</div>'+
							'</div>';
						}
						$("#updatePropertiesDiv").append(propertiesDiv);
						updatePropertyItems++;
						layer.close(index);
					});
				});
			}
			
			//到服务端删除商品属性
			function deletePropertyItemOnServer(obj,id){
				layer.confirm('确定删除?', {icon: 3, title:'提示'}, function(index){
					$.post("${basePath}/goodProperties/delete/" + id,null,function(result){
						result = $.parseJSON(result);
						layer.msg(result.msg);
						$(obj).parent().parent().remove();
					});	  
					layer.close(index);
				});
			}
		</script>
	</body>

</html>