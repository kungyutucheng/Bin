<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/tagslib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>品牌管理</title>
	</head>

	<body>
		<div style="display:none;">
			<form id="searchForm">
				<input type="hidden" name="page" value="1">
				<input type="hidden" name="pageSize" value="10">
			</form>
		</div>
		<div class="tool-bar">
			<button class="layui-btn" onclick="addBrand();">添加</button>
			<button class="layui-btn" id="deleteBrandBtn">删除</button>
		</div>
		<div class="result-div">
			<table class="table">
				<thead>
					<th><input type="checkbox" id="selectAll" /></th>
					<th>id</th>
					<th>品牌</th>
					<th>关键字</th>
					<th>代码值</th>
					<th>创建者</th>
					<th>创建时间</th>
					<th>操作</th>
				</thead>
				<tbody id="dg">
				</tbody>
			</table>
			<div id="page" style="width:100%;text-align: center;"></div>
		</div>
		<div class="modal fade" id="addBrandModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" style="width:1000px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">添加品牌</h4>
					</div>
					<div class="modal-body" style="text-align: center;">
						<form class="layui-form" id="addBrandForm">
							<div class="layui-form-item">
								<div class="layui-inline">
									<div class="layui-form-label">品牌名</div>
									<div class="layui-input-block">
										<input type="text" name="brand" class="layui-input"  lay-verify="required"/>
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label">关键字</div>
									<div class="layui-input-block">
										<input type="text" name="keyword" class="layui-input"  lay-verify="required"/>
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label">代码值</div>
									<div class="layui-input-block">
										<input type="text" name="code" class="layui-input" />
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit lay-filter="saveBrand">保存</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="updateBrandModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" style="width:1000px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">修改品牌</h4>
					</div>
					<div class="modal-body" style="text-align: center;">
						<form class="layui-form" id="updateBrandForm">
							<div class="layui-form-item">
								<div class="layui-inline">
									<div class="layui-form-label">品牌名</div>
									<div class="layui-input-block">
										<input type="text" name="brand" class="layui-input"  lay-verify="required"/>
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label">关键字</div>
									<div class="layui-input-block">
										<input type="text" name="keyword" class="layui-input"  lay-verify="required"/>
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-form-label">代码值</div>
									<div class="layui-input-block">
										<input type="text" name="code" class="layui-input" />
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<input type="hidden" name="createTime">
									<input type="hidden" name="id">
									<input type="hidden" name="creator">
									<button class="layui-btn" lay-submit lay-filter="updateBrand">保存</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script>
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
			
			//添加新品牌
			function addBrand() {
				$("#addBrandModal").modal("show");
			}
			
			$(function() {
				layui.use(['jquery','form'], function() {
					var $ = layui.jquery;
					var form = layui.form();
					
					//加载初始数据
					loadBrandDataWithPageInfo();
				
					//提交信息
					form.on("submit(saveBrand)",function(data){
						$.post("${basePath}/brand/save",data.field,function(result){
							result = $.parseJSON(result);
							layer.msg(result.msg);
							if(result.success){
								$("#addBrandModal").modal("hide");
								loadBrandDataWithPageInfo();
							}
						});
						return false;
					});
					
					//修改信息
					form.on("submit(updateBrand)",function(data){
						$.post("${basePath}/brand/update",data.field,function(result){
							result = $.parseJSON(result);
							layer.msg(result.msg);
							if(result.success){
								$("#updateBrandModal").modal("hide");
								loadBrandData();
							}
						});
						return false;
					});
					
					$("#deleteBrandBtn").on("click",function(){
						var ids = "";
						var hasChoose = false;
						$("input[name='selectItem']").each(function() {
							if($(this).is(":checked")) {
								ids += $(this).parent().next().text() + ",";
								hasChoose = true;
							}
						});
						if(!hasChoose){
							layer.msg("请至少选择一条数据");
							return;
						}
						ids = ids.substr(0, ids.length - 1);
						layer.confirm("确定删除？",{icon: 3, title:'提示'},function(index){
							$.post("${basePath}/brand/delete",{ids:ids},function(result){
								result = $.parseJSON(result);
								layer.msg(result.msg);
								if(result.success){
									loadBrandDataWithPageInfo();
								}
							});
						});
					});
				});
			});
			
			function loadBrandDataWithPageInfo(){
				$.post("${basePath}/brand/searchgrid",$("#searchForm").serializeObject(),function(result){
					result = $.parseJSON(result);
					var rows = result.rows;
					var data = "";
					if(rows && rows.length > 0){
						for(var i = 0 ;i < rows.length ; i++){
							var row = rows[i];
							data += 
								'<tr>'+
									'<td>'+
										'<input type="checkbox" name="selectItem" onchange="hasSelectAll()" />'+
									'</td>'+
									'<td>' + row.id + '</td>'+
									'<td>' + row.brand + '</td>'+
									'<td>' + row.keyword + '</td>'+
									'<td>' + row.code + '</td>'+
									'<td>' + row.creator + '</td>'+
									'<td>' + new Date(row.createTime).format("yyyy-MM-dd hh:mm:ss") + '</td>'+
									'<td>' + 
										'<span>'+
											'<a class="extra" onclick="showUpdateBrandModal(' + row.id +')">修改</a>'+
										'</span>'+
									'</td>'+
								'</tr>';
						}
					}
					$("#dg").html(data);
					var pageSize = Number($("input[name='pageSize']").val());
					var pageCount = result.total % pageSize == 0 ? result.total/pageSize : Math.floor(result.total/pageSize) + 1;
					layui.use(['laypage'], function() {
						var laypage = layui.laypage;
						laypage({
							cont: 'page', //id
							pages: pageCount, //总页数
							curr: 1, //当前页
							groups: 5, //连续显示分页数
							jump: function(obj, first) {
								$("input[name='page']").val(obj.curr);
								loadBrandData();
							}
						});
					});
				});
			}
			
			//加载商品数据
			function loadBrandData(){
				$.post("${basePath}/brand/searchgrid",$("#searchForm").serializeObject(),function(result){
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
								'<td>' + row.brand + '</td>'+
								'<td>' + row.keyword + '</td>'+
								'<td>' + row.code + '</td>'+
								'<td>' + row.creator + '</td>'+
								'<td>' + new Date(row.createTime).format("yyyy-MM-dd hh:mm:ss") + '</td>'+
								'<td>' + 
								'<span>'+
									'<a class="extra" onclick="showUpdateBrandModal(' + row.id +')">修改</a>'+
								'</span>'+
							'</td>'+
							'</tr>';
						}
						$("#dg").html(data);
						$("#selectAll").prop("checked",false);
					}
				});
			}
			
			function showUpdateBrandModal(id){
				$.post("${basePath}/brand/searchgrid",{id:id},function(result){
					result = $.parseJSON(result);
					var row = result.rows[0];
					row.createTime = new Date(row.createTime).format("yyyy-MM-dd hh:mm:ss");
					$("#updateBrandForm").setForm(row);
					$("#updateBrandModal").modal("show");
				});
			}
			
			
		</script>
	</body>

</html>