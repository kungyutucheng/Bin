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
		<script src="${basePath }/asserts/raty/lib/jquery.raty.js" type="text/javascript" charset="utf-8"></script>
		<title>写评论</title>
		<style type="text/css">
			.block {
				background: #fff;
				border: 1px #F1F1F1 solid;
				margin: 20px 0;
				padding: 20px;
			}
			
			.good-item {
				padding: 10px 0;
				padding-left: 15px;
				margin: 10px 0;
				border-bottom: 1px #F1F1F1 dashed;
			}
			
			.good-item img {
				vertical-align: middle;
				margin-right: 20px;
			}
			
			.star {
				padding-top: 10px;
			}
			.width100{
				width : 100px;
			}
		</style>
	</head>

	<body>
		<div class="container iframe-offset-y">
			<form class="layui-form" action="${basePath }/home/comment/save" method="post">
				<c:forEach items="${order.orderGoods }" var="og" varStatus="status">
				<div class="block">
					<div class="good-item">
						<img src="${basePath }/image/getImage/${og.good.picSm}" />${og.good['name'] }&nbsp;&nbsp;${og.goodProperty['name'] }
					</div>
					<div class="layui-form-label width100">
						评价内容：
					</div>
					<div class="layui-input-block">
						<textarea name="comments[${status.count }].content" rows="10" style="width: 100%;" class="layui-textarea"></textarea>
					</div>
					<div class="layui-form-label width100">
						评价星级：
					</div>
					<div class="layui-input-block">
						<div name="star" class="star"></div>
					</div>
					<div class="layui-input-block" style="margin: 30px;">
						<input type="checkbox" title="统一使用此评价" name="useAll" lay-filter="useSameComment" />
					</div>
				</div>
				<input type="hidden" name="comments[${status.count }].gid" value="${og.gid }">
				<input type="hidden" name="comments[${status.count }].gpid" value="${og.gpid }">
				<input type="hidden" name="comments[${status.count }].oid" value="${og.oid }">
				</c:forEach>
				<div class="layui-input-block" style="margin: 30px;">
					<input type="checkbox" title="匿名" name="isAnonymous"/>
				</div>
				<div class="layui-form-item" style="width: 100%;text-align: center;">
					<button class="layui-btn" lay-submit>提交</button>
				</div>
			</form>
		</div>
		<script type="text/javascript">
			$("div[name='star']").raty({});
			layui.use('form', function() {
				var form = layui.form();
				form.on('checkbox(useSameComment)', function(data) {
					if(data.elem.checked) {
						var content = "ds";
						$("input[name='useAll']").each(function() {
							if($(this).prop("checked") == true) {
								//firefox不支持previousSibling属性
								var content = data.elem.parentNode.previousElementSibling.previousElementSibling.previousElementSibling.firstElementChild.value;
								if(content == undefined){
									content = data.elem.parentNode.previousSibling.previousSibling.previousSibling.firstChild.value;
								}
								$(".layui-textarea").each(function() {
									$(this).val(content);
								});
								var score = $(this).parent().prev().find("input[name='score']").val();
								$("div[name='star']").each(function(){
									$(this).raty({score:score});
								});
							}
							$(this).prop("checked", true);
							form.render("checkbox");
						});
					

					} else {
						$("input[name='useAll']").each(function() {
							$(this).prop("checked", false);
							form.render("checkbox");
						});
					}
				});
			});
		</script>
	</body>

</html>