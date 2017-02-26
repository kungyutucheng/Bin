<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/tagslib.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品列表页</title>
<style type="text/css">

</style>
</head>
<body>
	<div>
		<ul class="gl">
			<c:forEach items="goods" var="good" varStatus="count">
			<li class="item">
				<a><img src="${basePath }/img/storeCard.jpg" /></a>
				<div class="price">${good.price }</div>
				<div class="title">
					<a>${good.name }</a>
				</div>
				<div class="commnetNum">
					已有<font class="num">
					<c:choose>
						<c:when test="${good.commentNum == null }">0</c:when>
						<c:otherwise>${good.commentNum }</c:otherwise>
					</c:choose>
					</font>评价
				</div>
				<div class="owner">${good.owner["name"] }</div>
				<div class="addIntoCartBtn ">
					<a>加入购物车</a>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	<div id="page" style="width: 100%; text-align: center;"></div>
	</div>
<script type="text/javascript">
	layui.use(['laypage', 'layer'], function() {
		var laypage = layui.laypage;
		laypage({
			cont: 'page', //id
			pages: "${goodPages}", //总页数
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