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
			
			#detailMsg #msgBlock {
				background: #f2f2f2;
				padding: 10px;
				width: 100%;
				height: 100px;
			}
			
			#detailMsg #msgBlock #price {
				color: #D9534F;
				font-weight: bold;
				font-size: large;
			}
			
			#price:before {
				content: "￥";
			}
			
			#commentNum {
				color: #005EA7;
				text-align: center;
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
		</style>
	</head>

	<body style="text-align:center;">
		<div class="container" style="background: #fff;padding-top: 20px;">
			<div class="box" style="width: 330px;text-align: center;display: inline-block;float: left;">
				<div class="tb-booth tb-pic tb-s310">
					<a href="${basePath }/img/01.jpg"><img src="${basePath }/img/01_mid.jpg" alt="美女" rel="${basePath }/img/01.jpg" class="jqzoom" /></a>
				</div>
				<ul class="tb-thumb" id="thumblist">
					<li class="tb-selected">
						<div class="tb-pic tb-s40">
							<a href="#"><img src="${basePath }/img/01_small.jpg" mid="${basePath }/img/01_mid.jpg" big="${basePath }/img/01.jpg"></a>
						</div>
					</li>
					<li>
						<div class="tb-pic tb-s40">
							<a href="#"><img src="${basePath }/img/02_small.jpg" mid="${basePath }/img/02_mid.jpg" big="${basePath }/img/02.jpg"></a>
						</div>
					</li>
					<li>
						<div class="tb-pic tb-s40">
							<a href="#"><img src="${basePath }/img/03_small.jpg" mid="${basePath }/img/03_mid.jpg" big="${basePath }/img/03.jpg"></a>
						</div>
					</li>
					<li>
						<div class="tb-pic tb-s40">
							<a href="#"><img src="${basePath }/img/04_small.jpg" mid="${basePath }/img/04_mid.jpg" big="${basePath }/img/04.jpg"></a>
						</div>
					</li>
					<li>
						<div class="tb-pic tb-s40">
							<a href="#"><img src="${basePath }/img/05_small.jpg" mid="${basePath }/img/05_mid.jpg" big="${basePath }/img/05.jpg"></a>
						</div>
					</li>
				</ul>
			</div>
			<div id="detailMsg" style="width: 580px;text-align: left;display: inline-block;float: left;">
				<div id="title">闪迪（SanDisk）至尊高速移动MicroSDXC UHS-I存储卡 TF卡 64GB Class10 读速80MB/s</div><br />
				<div id="msgBlock">
					<div style="display: inline-block;float: left;">
						价格：<span id="price">100</span><br /> 信息：
						<span id="msg">fdsaf</span><br /> 已售数量：
						<span id="msg">3242</span>
					</div>
					<div style="display: inline-block;float: right;">
						<span style="color: #999999;">累计评价</span><br/>
						<span id="commentNum">47239</span>
					</div>
				</div>
				<div class="row">
					选择颜色：
					<span>
						<span class="block active">80MB/s</span>
					<span class="block">85MB/s</span>
					<span class="block disable">90MB/s</span>
					</span>
				</div>
				<div class="row">
					选择版本：
					<span>
						<span class="block active">32GB</span>
					<span class="block">64GB</span>
					<span class="block disable">128GB</span>
					</span>
				</div>
				<div class="row" style="position: relative;">
					<div class="input-group" style="width: 140px;float: left;position: absolute;">
						<span class="input-group-addon" style="cursor: pointer;" onclick="subNum('num');">-</span>
						<input id="num" type="text" class="form-control" value="1" style="height: 40px;" onblur="getNumFromInput(this);">
						<span class="input-group-addon" style="cursor: pointer;" onclick="addNum('num');">+</span>
					</div>
					<a id="shoppingCartBtn" style="position: absolute;margin-left: 150px;" class="myBtn">加入购物车</a>
				</div>
			</div>
			<div id="owner" style="display: inline-block;float: right;padding-right: 20px;text-align: center;margin-bottom: 40px;">
				<div style="border-top: 1px solid #ddd;border-bottom: 1px solid #ddd;">
					<img src="${basePath }/img/sandi.png" />
				</div>
				<div id="" style="cursor: pointer;text-decoration: none;margin-top: 20px;">
					<a>闪迪官方旗舰店</a>
				</div>
			</div>
			<div style="clear: both;padding-top: 40px;padding-bottom:40px;width: 100%;">
				<div class="layui-tab layui-tab-card" lay-filter="demo">
					<ul class="layui-tab-title">
						<li class="layui-this">商品详情</li>
						<li>用户评价<span style="color: #005EA7;">(37w+)</li>
					</ul>
					<div class="layui-tab-content">
					    <div class="layui-tab-item layui-show">
					    	<div style="width: 100%;">
					    		<div class="row">
					    			<div class="head">
					    				品牌：<span class="brand">闪迪</span>
				</div>
			</div>
			<div class="row">
				<div class="detail-item">
					商品名称：闪迪TF卡
				</div>
				<div class="detail-item">
					商品编号：1887526
				</div>
				<div class="detail-item">
					商品毛重：10.00g
				</div>
				<div class="detail-item">
					商品产地：中国大陆
				</div>
			</div>
			<div class="row">
				<div class="detail-item">
					商品名称：闪迪TF卡
				</div>
				<div class="detail-item">
					商品编号：1887526
				</div>
				<div class="detail-item">
					商品毛重：10.00g
				</div>
				<div class="detail-item">
					商品产地：中国大陆
				</div>
			</div>
		</div>
		</div>
		<div class="layui-tab-item">
			<div>
				<div>
					<div style="display: inline-block;margin:0px 100px;">
						<span style="font-size: 70px;color: red;">98</span>
						<span style="font-size: 35px;color: red;">%</span>
					</div>
					<div id="commnetPercentChart" style="width:300px;height:150px;display: inline-block;vertical-align: middle;"></div>
				</div>
				<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
					<ul class="layui-tab-title">
						<li class="layui-this">全部评价（37W）</li>
						<li>好评（2189）</li>
						<li>中评（219）</li>
						<li>差评（320）</li>
					</ul>
					<div class="layui-tab-content">
						<div class="layui-tab-item layui-show" style="margin-bottom: 30px;">
							<iframe id="allComment" src="comment.html" style="width: 100%;" frameborder="0" scrolling="no"></iframe>
						</div>
						<div class="layui-tab-item">内容2</div>
						<div class="layui-tab-item">内容3</div>
						<div class="layui-tab-item">内容5</div>
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
				var iframe = document.getElementById("allComment");
				try {
					iframe.height = iframe.contentWindow.document.documentElement.scrollHeight;
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
							value: 335,
							name: '好评'
						}, {
							value: 310,
							name: '中评'
						}, {
							value: 234,
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
		</script>
	</body>

</html>