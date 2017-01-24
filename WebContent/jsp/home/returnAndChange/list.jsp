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
			<div class="layui-form">
				<div class="layui-form-item">
					<div class="layui-input-block">
						<div class="layui-inline">
							<input type="text" class="layui-input" placeholder="订单编号" />
						</div>
						<div class="layui-inline">
							<button class="layui-btn">查询</button>
						</div>
						<div class="layui-inline">
							<select>
								<option>三个月以内</option>
								<option>三个月以前</option>
							</select>
						</div>
						<div class="layui-inline">
							<select>
								<option>全部</option>
								<option>处理中</option>
								<option>已完成</option>
							</select>
						</div>
					</div>
				</div>
			</div>
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
						<tr>
							<td>728473948</td>
							<td>4382942380</td>
							<td>丹杰仕 男士西服2014春夏款男士小西装 韩版修身西服外套时尚拼接休闲上衣潮男 纯黑色 M</td>
							<td>2014-05-05&nbsp;03:09:09</td>
							<td>已完成</td>
							<td>
								<a class="extra" href="redoDetail.html" target="_blank">查看</a>
							</td>
						</tr>
						<tr>
							<td>728473948</td>
							<td>4382942380</td>
							<td>丹杰仕 男士西服2014春夏款男士小西装 韩版修身西服外套时尚拼接休闲上衣潮男 纯黑色 M</td>
							<td>2014-05-05&nbsp;03:09:09</td>
							<td>已完成</td>
							<td>
								<a class="extra">查看</a>
							</td>
						</tr>
						<tr>
							<td>728473948</td>
							<td>4382942380</td>
							<td>丹杰仕 男士西服2014春夏款男士小西装 韩版修身西服外套时尚拼接休闲上衣潮男 纯黑色 M</td>
							<td>2014-05-05&nbsp;03:09:09</td>
							<td>已完成</td>
							<td>
								<a class="extra">查看</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="page" style="width:100%;text-align: center;"></div>
		</div>
		<script>
			//Demo
			layui.use('form', function() {
				var form = layui.form();

				//监听提交
				form.on('submit(formDemo)', function(data) {
					layer.msg(JSON.stringify(data.field));
					return false;
				});
			});
			layui.use(['laypage', 'layer'], function() {
				var laypage = layui.laypage;
				laypage({
					cont: 'page', //id
					pages: 100, //总页数
					curr: 1, //当前页
					groups: 5, //连续显示分页数
					jump: function(obj, first) {
						console.log(obj.curr);
					}
				});
			});
		</script>
	</body>

</html>