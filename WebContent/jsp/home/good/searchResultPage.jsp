<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file ="/common/tagslib.jsp" %>
<%@ include file="/jsp/common/top.jsp" %>
<%@ include file="/jsp/common/search.jsp" %>
<%@ include file="/jsp/common/navbar.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>商品列表</title>
		<style>
		body{
			height: 100%;
		}
			.filterLine {
				padding: 10px 0;
				border-bottom: 1px solid #ddd;
				text-align: left;
			}
			
			.filterLine .title {
				display: inline-block;
				vertical-align: middle;
				text-align: left;
				width: 4%
			}
			
			.filterLine .detail {
				display: inline-block;
				vertical-align: middle;
				text-align: left;
				width: 95%;
			}
			
			.filterLine .filterTable {
				width: 100%;
				text-align: center;
			}
			
			.filterLine .filterTable tr td a {
				cursor: pointer;
				color: #005AA0;
			}
			
			.filterLine .filterTable tr td a:hover {
				cursor: pointer;
				text-decoration: none;
				color: #D9534F;
			}
			
			.block {
				color: #333333;
				background: white;
				padding: 4px 5px;
				border: 1px solid #ddd;
				cursor: pointer;
				margin: 0 auto;
			}
			
			.blockActive {
				color: white;
				background: #E4393C;
			}
			
			.block:hover {
				border: 1px solid #E4393C;
			}
			
			.input-txt {
				width: 40px;
				height: 40px;
				line-height: 40px;
				margin: 0 3px;
				font-size: 14px;
				text-align: center;
				border: 1px solid #ccc;
				padding: 3px;
			}
			#currentFilterDiv{
				margin:10px 0;
				text-align:left;
				display:none;
				padding-bottom:20px;
				padding-top:10px;
			}
			.filterEle{
				color:#E4393C;
				border:1px #ddd solid;
				padding:5px 10px;
			}
			.filterRemoveBtn{
				cursor:pointer;
			}
			.gl {
				list-style-type: none;
				height: auto;
				width: auto;
				margin-top: 10px;
				padding: 0;
				text-align: left;
			}
			
			.gl .item {
				display: inline-block;
				width: 223px;
				height: auto;
				padding: 10px;
				border: 1px solid transparent;
				text-align:center;
			}
			
			.gl .item a img {
				text-align:center;
				width: 180px;
				cursor: pointer;
				height:150px;
			}
			
			.gl .item:hover {
				border: 1px solid #EDEDED;
				box-shadow: 1px 1px 2px #ddd;
			}
			
			.gl .item .price {
				text-align: left;
				color: #E4393C;
				font-size: 20px;
				margin-top: 10px;
			}
			
			.gl .item .price:before {
				content: "¥";
			}
			
			.gl .item .title {
				text-align: left;
				font-size: 14px;
				margin-top: 10px;
				cursor: pointer;
			}
			
			.gl .item .title a {
				color: #A7A7A7;
			}
			
			.gl .item .title a:hover {
				text-decoration: none;
				color: #E4393C;
			}
			
			.gl .item .commnetNum {
				text-align: left;
				color: #a7a7a7;
				font-size: 14px;
				margin-top: 10px;
			}
			
			.gl .item .commnetNum .num {
				color: #005AA0;
			}
			
			.gl .item .commnetNum .num:before, .gl .item .commnetNum .num:after {
				content: " ";
			}
			
			.gl .item .owner {
				text-align: left;
				color: #A7A7A7;
				font-size: 14px;
				margin-top: 10px;
			}
			
			.gl .item .addIntoCartBtn {
				text-align: center;
				border: 1px solid #DDDDDD;
				padding: 5px 10px;
				margin: 20px 0;
				cursor: pointer;
			}
			
			.gl .item .addIntoCartBtn:hover {
				border: 1px solid #E4393C;
			}
			
			.gl .item .addIntoCartBtn a {
				text-decoration: none;
				color: #E4393C;
			}
		</style>
	</head>

	<body>
		<div class="container">
			<c:choose>
				<c:when test="${brandsLength == 0 }">
				<div class="noData" id="noGoodData">
					未查询到与“<span style="color:#005AA0;">${keyword }</span>”相关的商品，请检查输入是否有误！
				</div>
				</c:when>
				<c:otherwise>
				<div style="background: #F1F1F1;border-top: 1px solid #DDDDDD;border-bottom: 1px solid #DDDDDD;padding:5px;font-size: 14px;
					text-align: left;">
					<font color="red">${keyword }</font>&nbsp;商品筛选&nbsp;&nbsp;&nbsp;&nbsp;共&nbsp;&nbsp;<span id="totalGoodNum" style="color:#005AA0;font-weight:bolder;"></span>&nbsp;&nbsp;个商品
				</div>
				<div class="filterLine">
					<div class="title">
						品牌：
					</div>
					<div class="detail">
						<table class="filterTable">
							<c:forEach items="${brands}" var="brand" varStatus="st">
							<c:if test="${st.count %8 == 0 }">
								<tr>
							</c:if>
								<td><a onclick="addBrandFilter('${brand.brand }')">${brand.brand }</a></td>
							<c:if test="${st.count %8 == 7 }">
								</tr>
							</c:if>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="filterLine">
					<div class="title">价格：</div>
					<div class="detail">
						<span><input id="startPrice" type="number"  name="startPrice" class="layui-input" style="width:100px;display:inline;" onblur="checkStartPrice(this);"></span>
						<span>-</span>
						<span><input id="endPrice" type="number"  name="endPrice" class="layui-input" style="width:100px;display:inline;" onblur="checkEndPrice(this);"></span>
						<span><button type="button" class="layui-btn" onclick="addPriceRule();">确定</button></span>
					</div>
				</div>
				<div id="currentFilterDiv">
					<div style="display:inline;float:left;">
						<span>当前筛选条件</span>
						<span id="filterEles">
						</span>
					</div>
					<div style="float:right;display:inline;"><a class="extra" onclick="clearFilterRules();">清除筛选条件</a></div>
				</div>
				<div style="background: #f1f1f1;border-bottom: 1px solid #ddd;height:40px;padding-top:4px;">
					<div style="display: inline-block;text-align: left;margin-left: 10px;float: left;margin-top:5px;">
						<span class="block blockActive" onclick="changeSortWay(1);">销量</span>
						<span class="block" onclick="changeSortWay(2);">价格</span>
						<span class="block" onclick="changeSortWay(3);">评论数</span>
						<span class="block" onclick="changeSortWay(4);">上架时间</span>
					</div>
				</div>
				<div>
					<div class="noData" style="display:none;" id="noGoodDataUnderFilter">
						当前筛选条件下无相关产品!
					</div>
					<ul class="gl">
					</ul>
				</div>
				<form id="filterRuleForm" style="display:none;">
					<input type="hidden" name="keyword" id="keyword" value="${keyword }">
					<input type="hidden" name="startPrice" value="0">
					<input type="hidden" name="endPrice" value="0">
					<input type="hidden" name="orderby" value="1">
					<input type="hidden" name="page" value="1">
					<input type="hidden" name="brands">
				</form>
				</c:otherwise>
			</c:choose>
		</div>
		<script type="text/javascript">
			$(function(){
				loadGoodData();
			});
			
			//加载商品数据
			function loadGoodData(){
				var index = layer.load();
				$.post("${basePath}/home/good/getGoodList",{
					keyword : "${keyword}",
					page : $("input[name='page']").val(),
					orderby : $("input[name='orderby']").val(),
					startPrice : $("input[name='startPrice']").val(),
					endPrice : $("input[name='endPrice']").val(),
					brands : $("input[name='brands']").val()
				},function(result){
					layer.close(index);
					result = $.parseJSON(result);
					var rows = result.rows;
					if(rows.length == 0){
						$("#noGoodDataUnderFilter").show();
						$(".gl").html("");
						return;
					}
					$("#noGoodDataUnderFilter").hide();
					var html = "";
					for(var i = 0 ;i < rows.length ; i++){
						var row = rows[i];
						var imageUrl = "${basePath}/image/getImage/" + row.picMid;
						if(row.picMid == null){
							imageUrl = "${basePath}/img/logo.png";
						}
						html += '<li class="item">'+
							'<a target="_blank" href="${basePath}/home/good/detail/' + row.id + '"><img src="' + imageUrl + '" /></a>' +
							'<div class="price">' + row.price + '</div>' +
							'<div class="title">'+
								'<a>' + row.name +　'</a>'+
							'</div>'+
							'<div class="commnetNum">'+
								'已有<font class="num">' + (row.commentNum == null ? 0 : row.commentNum) + '</font>评价'+
							'</div>'+
							'<div class="owner">' + row.owner.name + '</div>'+
							'<div class="addIntoCartBtn ">'+
								'<a>加入购物车</a>'+
							'</div>'+
						'</li>';
					}
					$(".gl").html(html);
					$("#totalGoodNum").text(result.total);
				});
			}
			
			//改变排序方式			
			function changeSortWay(type) {
				//与原来同样的排序方式不做处理
				if($("input[name='orderby']").val() == type){
					return;
				}
				
				var waies = $(".block");
				for(var i = 0; i < waies.length; i++) {
					if(i == type - 1) {
						$(waies[i]).attr("class", "block blockActive");
					} else {
						$(waies[i]).attr("class", "block");
					}
				}
				
				$("input[name='orderby']").val(type);
				loadGoodData();
			}
			
			function addBrandFilter(brand){
				var flag = false;
				$(".filterEle").each(function(){
					console.log($(this).first().text());
					if($(this).first().text() == brand){
						flag = true;
						return;
					}
				});
				if(flag){
					return;
				}
				var currentFilterDiv = $("#currentFilterDiv");
				var filterEles = $("#filterEles");
				if(filterEles.children().length == 0){
					currentFilterDiv.show();
					$("#filterEles").append(
						'<span>'+
						'<span class="glyphicon glyphicon-chevron-right"></span>'+
						'<span class="filterEle">'+
							'<span>' + brand + '</span>'+
							'<span class="glyphicon glyphicon-remove filterRemoveBtn" onclick="removeFilterEle(this);"></span>'+
						'</span>'+
						'</span>'
					);
				}else{
					$("#filterEles").append(
						'<span>'+
						'<span class="glyphicon glyphicon-chevron-right"></span>'+
						'<span class="filterEle">'+
							'<span>' + brand + '</span>'+
							'<span class="glyphicon glyphicon-remove filterRemoveBtn"  onclick="removeFilterEle(this);"></span>'+
						'</span>'+
						'</span>'
					);
				}
				var currBrands = $("input[name='brands']").val();
				if(currBrands == ""){
					$("input[name='brands']").val(brand);
				}else{
					$("input[name='brands']").val($("input[name='brands']").val() + "," + brand);
				}
				loadGoodData();
			}
			
			function removeFilterEle(obj){
				//如果所有筛选元素都被移除，那么筛选条件区域不予显示
				$(obj).parent().parent().remove();
				if($(".filterEle").length == 0){
					$("#currentFilterDiv").hide();
					$("input[name='brands']").val("");
					$("input[name='startPrice']").val(0);
					$("input[name='endPrice']").val(0);
					loadGoodData();
				}else{
					var brands = "";
					$(".filterEle").each(function(){
						if($(this).first().text().substr(0,2) != "价格"){
							brands += $(this).first().text();
						}
					});
					$("input[name='brands']").val(brands);
					loadGoodData();
				}
			}
			
			function addPriceRule(){
				//去除之前的价格筛选条件				
				$("#priceRule").parent().parent().remove();
				var startPrice = Number($("#startPrice").val());
				var endPrice = Number($("#endPrice").val());
				if(startPrice == 0 && endPrice == 0){
					layer.msg("价格不能同时为0");
					return;
				}
				if(startPrice > endPrice){
					layer.msg("初始价格不能高于结束价格");
					return;
				}
				var text = "价格：";
				if(startPrice != ""){
					text += startPrice + " - ";
				}else{
					text += "0 - ";
				}
				if(endPrice != ""){
					text += endPrice;
				}else{
					text += "0";
				}
				$("#filterEles").append(
					'<span>'+
					'<span class="glyphicon glyphicon-chevron-right"></span>'+
					'<span class="filterEle">'+
						'<span id="priceRule">'+ text +'</span>'+
						'<span class="glyphicon glyphicon-remove filterRemoveBtn"  onclick="removeFilterEle(this);"></span>'+
					'</span>'+
					'</span>'
				);
				$("#currentFilterDiv").show();
				$("input[name='startPrice']").val(startPrice);
				$("input[name='endPrice']").val(endPrice);
				loadGoodData();
			}
			
			
			function clearFilterRules(){
				$(".filterEle").each(function(){
					$(this).parent().remove();
				});
				$("#currentFilterDiv").hide();
				$("input[name='startPrice']").val(0);
				$("input[name='endPrice']").val(0);
				$("input[name='brands']").val("");
				loadGoodData();
			}
			
			//校验初始价格
			function checkStartPrice(obj){
				var startPrice = $(obj).val();
				if(startPrice < 0){
					layer.msg("初始价格不能小于0");
					$(obj).val(0);
					return;
				}
			}
			
			function checkEndPrice(obj){
				var endPrice = $(obj).val();
				if(endPrice < 0){
					layer.msg("初始价格不能小于0");
					$(obj).val(0);
					return;
				}
			}
		</script>
	</body>

</html>