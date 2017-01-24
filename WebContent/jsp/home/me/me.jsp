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
		<title>个人中心</title>
		<style type="text/css">
			a:hover {
				cursor: pointer;
				text-decoration: none;
			}
			
		</style>
	</head>

	<body style="background: #ddd;">
		<div class="container">
			<div style="display: inline-block;width:17%;">
				<ul class="layui-nav layui-nav-tree">
					<li class="layui-nav-item layui-nav-itemed">
						<a href="">设置</a>
						<dl class="layui-nav-child">
							<dd>
								<a onclick="changePage(1);">个人信息</a>
							</dd>
							<dd>
								<a onclick="changePage(2);">收货地址</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item layui-nav-itemed">
						<a>个人中心</a>
						<dl class="layui-nav-child">
							<dd>
								<a onclick="changePage(3);">历史订单</a>
							</dd>
							<dd>
								<a onclick="changePage(4);">我的评价</a>
							</dd>
							<dd>
								<a onclick="changePage(5);">我的级别</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item layui-nav-itemed">
						<a>客户服务</a>
						<dl class="layui-nav-child">
							<dd>
								<a onclick="changePage(6);">返修/退换货记录</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
			<div style="display: inline-block;width: 82%;vertical-align: top;float: right;">
				<c:choose>
					<c:when test="${target == 1 }">
						<iframe id="iframe" src="${basePath }/home/user/personInfo" frameborder="0" scrolling="no" style="width: 100%;"></iframe>
					</c:when>
					<c:when test="${target == 2 }">
						<iframe id="iframe" src="${basePath }/home/user/list" frameborder="0" scrolling="no" style="width: 100%;"></iframe>
					</c:when>
					<c:when test="${target == 3 }">
						<iframe id="iframe" src="${basePath }/home/order/list/1" frameborder="0" scrolling="no" style="width: 100%;"></iframe>
					</c:when>
					<c:when test="${target == 4 }">
						<iframe id="iframe" src="${basePath }/home/comment/list" frameborder="0" scrolling="no" style="width: 100%;"></iframe>
					</c:when>
					<c:when test="${target == 5 }">
						<iframe id="iframe" src="${basePath }/home/comment/list" frameborder="0" scrolling="no" style="width: 100%;"></iframe>
					</c:when>
					<c:when test="${target == 6 }">
						<iframe id="iframe" src="${basePath }/home/returnAndChange/list" frameborder="0" scrolling="no" style="width: 100%;"></iframe>
					</c:when>
				</c:choose>
			</div>
		</div>
		<script type="text/javascript">
			function changePage(index) {
				var url = "${basePath}/home/";
				if(index == 1) {
					url += "user/personInfo";
				} else if(index == 2) {
					url += "address.jsp";
				} else if(index == 3) {
					url += "order/list/1";
				} else if(index == 4) {
					url += "myComment.html";
				}else if(index == 5){
					url += "myRank.html";
				}else if(index == 6){
					url += "returnOrExchangeList.html";
				}
				$("#iframe").attr("src", url);
				//var iframe = document.getElementById("iframe");
				/* iframe.onload = function() { //方法1  
				    var iframeHeight = Math.min(iframe.contentWindow.window.document.documentElement.scrollHeight, iframe.contentWindow.window.document.body.scrollHeight);  
				    var h=$(this).contents().height(); 
				    console.log(h);
				    $(this).height(h+'px');   
				} */ 
			}
		

			//调整iframe高度，使其高度自适应内容
			function reinitIframe() {
				var iframe = document.getElementById("iframe");
				try {
					iframe.height = iframe.contentWindow.document.documentElement.scrollHeight;
				} catch(ex) {}
			}
			window.setInterval("reinitIframe()", 200); 
		</script>
	</body>

</html>