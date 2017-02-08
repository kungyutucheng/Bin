<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/tagslib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<script src="${basePath }/asserts/echarts.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath }/asserts/raty/lib/jquery.raty.js" type="text/javascript" charset="utf-8"></script>
		<title>评论</title>
		<style type="text/css">
			.line{
				border-bottom: 1px #ddd solid;
				width:100%;
			}
			.column{
				display: inline-block;
				font-size: 12px;
			}
			.column:first-child{
				width: 20%;
				padding-left: 3%;
				vertical-align: middle;
			}
			.column:nth-child(2){
				width: 65%;
				padding-left: 3%;
			}
			.column:nth-child(3){
				width: 10%;
			}
			.row{
				margin: 10px;
			}
		</style>
	</head>

	<body>
		<div>
			<ul>
				<c:forEach items="${comments }" var="comment">
				<li class="line">
					<div>
						<div class="column">
							<div class="row">
								<div data-score="${comment.score }" name="star"></div>
							</div>
							<div class="row"><fmt:formatDate value="${comment.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
							<div class="row">${comment.goodProperty['name'] }</div>
						</div>
						<div class="column">${comment.content }</div>
						<div class="column">
							<div>${comment.user['name'] }</div>
							<div>
								<c:choose>
									<c:when test="${comment.user['score'] > 1000 }">金牌会员</c:when>
									<c:when test="${comment.user['score'] > 500 }">银牌会员</c:when>
									<c:otherwise>铜牌会员</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
			<div id="page" style="width:100%;text-align: center;"></div>
			<form id="pageForm">
			</form>
		</div>
		<script type="text/javascript">
			$(function(){
				
				
				$("[name='star']").raty({
					readOnly:true,
  					score: function() {
    					return $(this).attr('data-score');
  					}
				});
				
				layui.use(['laypage', 'layer'], function(){
  					var laypage = layui.laypage;
					laypage({
					    cont: 'page',//id
					    pages: "${pageCount}",//总页数
					    curr: "${pageNo}",//当前页
					    groups: 5 ,//连续显示分页数
					    jump:function(obj,first){
					    	if(obj.curr != Number("${pageNo}")){
					    		$("#pageForm").attr("action" , "${basePath}/home/comment/list/${id}/" + obj.curr + "/${type}");
					    		$("#pageForm").submit();
					    	}
					    }
					});
				});
			});	
			
		</script>
	</body>

</html>