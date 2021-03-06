<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String gid = request.getParameter("id");
%>
<%@ include file="/common/tagslib.jsp" %>
<%@ include file="/jsp/common/top.jsp" %>
<%@ include file="/jsp/common/search.jsp" %>
<%@ include file="/jsp/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>商品详情</title>
		<script src="${basePath }/asserts/jquery.imagezoom.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath }/asserts/echarts.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			body {
				background: #F2F2F2;
			}
			
			#detailMsg #title {
				color: #666666;
				font-size: larger;
				font-weight: bold;
			}
			
			#detailMsg #msg {
				color: #666666;
				font-size: 14px;
				font-weight: bold;
			}
			
			#detailMsg #msgBlock {
				background: #f2f2f2;
				padding: 10px;
				width: 100%;
				height: 100px;
			}
			
			#detailMsg #msgBlock{
				color: #D9534F;
				font-weight: bold;
				font-size: large;
			}
			
			#detailMsg .block {
				border: solid #ddd 1px;
				padding: 5px;
				cursor: pointer;
			}
			
			#detailMsg .block:hover {
				border: solid #D9534F 2px;
			}
			
			#detailMsg .active {
				border: solid #D9534F 2px;
			}
			
			#detailMsg .disable {
				border: dashed #ddd 1px;
				cursor: not-allowed;
				color: #ddd;
			}
			
			#detailMsg .disable:hover {
				border: dashed #ddd 1px;
				cursor: not-allowed;
				color: #ddd;
			}
			
			#detailMsg .row {
				margin: 30px 10px;
			}
			
			input[type='text'] {
				width: 30px;
				text-align: center;
				border: solid #ddd 1px;
				margin: 0 auto;
			}
			
			#addBtn,
			#subBtn {
				margin: 0 auto;
				border: 1px solid #ddd;
				padding: 3px 10px;
				text-align: center;
				cursor: pointer;
				border-radius: 3px;
				text-decoration: none;
				background: #EDEDED;
				color: #3C3C3C;
				font-weight: bold;
				line-height: 30px;
			}
			/* box */
			
			li {
				list-style-type: none;
			}
			
			.tb-pic a {
				display: table-cell;
				text-align: center;
				vertical-align: middle;
			}
			
			.tb-pic a img {
				vertical-align: middle;
			}
			
			.tb-pic a {
				*display: block;
				*font-family: Arial;
				*line-height: 1;
			}
			
			.tb-thumb {
				margin: 10px 0 0;
				overflow: hidden;
			}
			
			.tb-thumb li {
				background: none repeat scroll 0 0 transparent;
				float: left;
				height: 42px;
				margin: 0 6px 0 0;
				overflow: hidden;
				padding: 1px;
			}
			
			.tb-s310,
			.tb-s310 a {
				height: 310px;
				width: 310px;
			}
			
			.tb-s310,
			.tb-s310 img {
				max-height: 310px;
				max-width: 310px;
			}
			
			.tb-s310 a {
				*font-size: 271px;
			}
			
			.tb-s40 a {
				*font-size: 35px;
			}
			
			.tb-s40,
			.tb-s40 a {
				height: 40px;
				width: 40px;
			}
			
			.tb-booth {
				border: 1px solid #CDCDCD;
				position: relative;
				z-index: 1;
			}
			
			.tb-thumb .tb-selected {
				background: none repeat scroll 0 0 #C30008;
				height: 40px;
				padding: 2px;
			}
			
			.tb-thumb .tb-selected div {
				background-color: #FFFFFF;
				border: medium none;
			}
			
			.tb-thumb li div {
				border: 1px solid #CDCDCD;
			}
			
			div.zoomDiv {
				z-index: 999;
				position: absolute;
				top: 0px;
				left: 0px;
				width: 200px;
				height: 200px;
				background: #ffffff;
				border: 1px solid #CCCCCC;
				display: none;
				text-align: center;
				overflow: hidden;
			}
			
			div.zoomMask {
				position: absolute;
				background: url("${basePath}/img/mask.png") repeat scroll 0 0 transparent;
				cursor: move;
				z-index: 1;
			}
			
			.myBtn {
				text-decoration: none;
				cursor: pointer;
				background: #D9534F;
				color: white;
				font-weight: bold;
				border-radius: 3px;
				padding: 10px;
				margin-left: 10px;
			}
			
			.myBtn:hover {
				color: white;
				text-decoration: none;
			}
			
			.row {
				width: 100%;
				padding: 10px 0px;
				text-align: left;
			}
			
			.row .detail-item {
				font-size: 12px;
				width: 22%;
				display: inline-block;
			}
			
			.row .head,
			.row .detail-item:first-child {
				margin-left: 10%;
			}
			
			.row .brand {
				color: #005EA7;
			}
			.msg-title,.msg-value{
				padding:10px 0;
				font-size:14px;
				width:33%;
			}
			.msg-title{
				color:#999;
			}
			.msg-value{
				color:#005AA0;
			}
		</style>
	</head>

	<body style="text-align:center;">
		<div class="container" style="background: #fff;padding-top: 20px;">
			<div class="box" style="width: 330px;text-align: center;display: inline-block;float: left;">
				<div class="tb-booth tb-pic tb-s310">
					<a href="${basePath }/image/getImage/${good.firstImg.small}"><img src="${basePath }/image/getImage/${good.firstImg.big}" rel="${basePath }/image/getImage/${good.firstImg.big}" class="jqzoom" /></a>
				</div>
				<ul class="tb-thumb" id="thumblist">
					<li class="tb-selected">
						<div class="tb-pic tb-s40">
							<a href="#"><img src="${basePath }/image/getImage/${good.firstImg.small}" mid="${basePath }/image/getImage/${good.firstImg.big}" big="${basePath }/image/getImage/${good.firstImg.big}"></a>
						</div>
					</li>
					<c:forEach var="img" items="${good.imgs }" varStatus="count">
						<li>
							<div class="tb-pic tb-s40">
								<a href="#"><img src="${basePath }/image/getImage/${img.small}" mid="${basePath }/image/getImage/${img.big }" big="${basePath }/image/getImage/${img.big}"></a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div id="detailMsg" style="width: 580px;text-align: left;display: inline-block;float: left;">
				<div id="title">${good.name }</div><br />
				<div id="msg">${good.msg }</div><br />
				<div id="msgBlock">
					<div style="display: inline-block;float: left;width:100%;">
						<table style="text-align:center;width:100%;">
							<tr>
								<td class="msg-title">
								价格
								</td>
								<td class="msg-title">
								已售数量
								</td>
								<td class="msg-title">
								评论数
								</td>
							</tr>
							<tr>
								<td class="msg-value" id="msg-price">
								￥${good.price }
								</td>
								<td class="msg-value" id="msg-soldNum">
								<c:choose>
									<c:when test="${good.soldNum == null}">0</c:when>
									<c:otherwise>${good.soldNum }</c:otherwise>
									</c:choose>
								</td>
								<td class="msg-value" id="msg-commentNum">
									<c:choose>
									<c:when test="${good.commentNum == null}">0</c:when>
									<c:otherwise>${good.commentNum }</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="row">
					请选择：
					<span>
						<c:forEach items="${goodProperties }" var="goodProperties" varStatus="gp">
							<c:choose>
								<c:when test="${goodProperties.num == 0}">
								<span class="block disable" title="${goodProperties.id }">${goodProperties.name } | ${goodProperties.num }</span>
								</c:when>
								<c:otherwise>
								<span class="block" title="${goodProperties.id }" onclick="chooseGoodProperties(this);">${goodProperties.name } | ${goodProperties.num }</span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</span>
				</div>
				<div class="row" style="position: relative;">
					<div class="input-group" style="width: 140px;float: left;position: absolute;">
						<span class="input-group-addon" style="cursor: pointer;" onclick="subNum();">-</span>
						<input id="num" type="text" class="form-control" value="1" style="height: 40px;" onblur="getNumFromInput(this);">
						<span class="input-group-addon" style="cursor: pointer;" onclick="addNum();">+</span>
					</div>
					<input type="hidden" id="goodNum">
					<input type="hidden" id="gpId">
					<input type="hidden" id="gid" value="${good.id }">
					<a id="shoppingCartBtn" style="position: absolute;margin-left: 150px;" class="myBtn" onclick="addIntoCart();">加入购物车</a>
				</div>
			</div>
			<div id="owner" style="display: inline-block;float: right;padding-right: 20px;text-align: center;margin-bottom: 40px;">
				<div style="border-top: 1px solid #ddd;border-bottom: 1px solid #ddd;">
					<img src="${basePath }/image/getOwnerLogo/${owner.logo}" style="width:180px;height:60px;"/>
				</div>
				<div id="" style="cursor: pointer;text-decoration: none;margin-top: 20px;">
					<a>${owner.name }</a>
				</div>
			</div>
			<div style="clear: both;padding-top: 40px;padding-bottom:40px;width: 100%;">
				<div class="layui-tab layui-tab-card" lay-filter="demo">
					<ul class="layui-tab-title">
						<li class="layui-this">商品详情</li>
						<li>用户评价<span style="color: #005EA7;">(<c:choose>
									<c:when test="${good.commentNum == null}">0</c:when>
									<c:otherwise>${good.commentNum }</c:otherwise>
									</c:choose>)</li>
					</ul>
					<div class="layui-tab-content">
					    <div class="layui-tab-item layui-show">
					    	<div style="width: 100%;">
					    		<div class="row">
					    			<div class="head">
					    				品牌：<span class="brand">${good.brand }</span>
				</div>
			</div>
			<div class="row">
				<div class="detail-item">
					商品名称：${good.name }
				</div>
				<div class="detail-item">
					商品编号：${good.no }
				</div>
				<div class="detail-item">
					商品毛重：${good.grossWeight }g
				</div>
				<div class="detail-item">
					商品净重：${good.netWeight }g
				</div>
			</div>
		</div>
		</div>
		<div class="layui-tab-item">
			<div>
				<div>
					<div style="display: inline-block;margin:0px 100px;">
						<span style="font-size: 70px;color: red;">${goodPercent }</span>
						<span style="font-size: 35px;color: red;">%</span>
					</div>
					<div id="commnetPercentChart" style="width:300px;height:150px;display: inline-block;vertical-align: middle;"></div>
				</div>
				<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
					<ul class="layui-tab-title">
						<li class="layui-this">全部评价（<c:choose>
									<c:when test="${good.commentNum == null}">0</c:when>
									<c:otherwise>${good.commentNum }</c:otherwise>
									</c:choose>）</li>
						<li>好评（<c:choose>
									<c:when test="${goodCount == null}">0</c:when>
									<c:otherwise>${goodCount }</c:otherwise>
									</c:choose>）</li>
						<li>中评（<c:choose>
									<c:when test="${midCount == null}">0</c:when>
									<c:otherwise>${midCount }</c:otherwise>
									</c:choose>）</li>
						<li>差评（<c:choose>
									<c:when test="${badCount == null}">0</c:when>
									<c:otherwise>${badCount }</c:otherwise>
									</c:choose>）</li>
					</ul>
					<div class="layui-tab-content">
						<div class="layui-tab-item layui-show" style="margin-bottom: 30px;">
							<iframe name="commentIframe" src="${basePath }/home/comment/list/${good.id}/1/0" style="width: 100%;" frameborder="0" scrolling="no"></iframe>
						</div>
						<div class="layui-tab-item">
							<iframe name="commentIframe" src="${basePath }/home/comment/list/${good.id}/1/1" style="width: 100%;" frameborder="0" scrolling="no"></iframe>
						</div>
						<div class="layui-tab-item">
							<iframe name="commentIframe" src="${basePath }/home/comment/list/${good.id}/1/2" style="width: 100%;" frameborder="0" scrolling="no"></iframe>
						</div>
						<div class="layui-tab-item">
							<iframe name="commentIframe" src="${basePath }/home/comment/list/${good.id}/1/3" style="width: 100%;" frameborder="0" scrolling="no"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		<script type="text/javascript">
			//调整iframe高度，使其高度自适应内容
			function reinitIframe() {
				//var iframe = document.getElementById("allComment");
				var iframes = document.getElementsByName("commentIframe");
				try {
					for(var i = 0 ;i < iframes.length ; i++){
						iframes[i].height = iframes[i].contentWindow.document.documentElement.scrollHeight;
					}
				} catch(ex) {
				}
			}
			window.setInterval("reinitIframe()", 200);

			$(function() {
			//	reinitIframe() ;
				$(".jqzoom").imagezoom();
				$("#thumblist li a").click(function() {
					$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
					$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
					$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
				});

				layui.use(['element'], function() {
					var element = layui.element();

					//监听Tab切换
					element.on('tab(demo)', function(data) {
						if(data.index == 1) {
							loadComment();
						}
					});

				});

			});

			function loadComment() {
				var chart = echarts.init(document.getElementById("commnetPercentChart"));
				var option = {
					tooltip: {
						trigger: 'item',
						formatter: "{b}: {c} ({d}%)"
					},
					legend: {
						x: 'left',
						orient: 'vetical',
						data: ['好评', '中评', '差评']
					},
					series: [{
						type: 'pie',
						radius: ['50%', '70%'],
						avoidLabelOverlap: false,
						label: {
							normal: {
								show: false,
								position: 'center'
							},
							emphasis: {
								show: true,
								textStyle: {
									fontSize: '30',
									fontWeight: 'bold'
								}
							}
						},
						labelLine: {
							normal: {
								show: false
							}
						},
						data: [{
							value: "${goodCount}",
							name: '好评'
						}, {
							value: "${midCount}",
							name: '中评'
						}, {
							value: "${badCount}",
							name: '差评'
						}, ]
					}]
				};
				chart.setOption(option);

			}

			function changePic(obj) {
				//todo到服务器上获取对应的大图，小图太模糊
				$("#bigPic").attr("src", $(obj).attr("src"));
			}
			
			function chooseGoodProperties(obj){
				$(".block").each(function(){
					if($(this).attr("class") != "block disable"){
						$(this).attr("class","block");
					}
				});
				$(".block .active").attr("class","block");
				$(obj).attr("class","block active");
				$("#goodNum").val(Number($(obj).text().split("|")[1]));
				$("#gpId").val($(obj).attr("title"));
				$("#num").val(1);
			}
			
			function addNum(){
				//判断是否选择了其中一种商品
				var flag = false;
				$(".block").each(function(){
					if($(this).attr("class") == "block active"){
						flag = true;
					}
				});
				if(!flag){
					layer.msg("请选择一种商品");
					return;
				}
				//判断数量是否达到库存上限
				var selectedItemNum = $("#goodNum").val();
				var currNum = Number($("#num").val());
				if(currNum >= selectedItemNum){
					layer.msg("商品数量达到库存量，无法继续增加");
					return;
				}
				$("#num").val(Number($("#num").val()) + 1);
			}
			
			function subNum(){
				var num = $("#num");
				var numValue = Number(num.val());
				if(numValue - 1 == 0){
					return;
				}
				num.val(numValue - 1);
			}
			
			function addIntoCart(){
				$.ajax({
					url : "${basePath}/home/cart/save",
					type : "POST",
					beforeSend : function(xhr){
						if($("#gpId").val() == ""){
							layer.msg("请选择一项商品");
							return false;
						}
						return true;
					},
					data:{
						gid : $("#gid").val(),
						gpId : $("#gpId").val(),
						num : $("#num").val()
					}
				}).done(function(data){
					data = $.parseJSON(data);
					layer.msg(data.msg);
				});
			}
		</script>
	</body>

</html>