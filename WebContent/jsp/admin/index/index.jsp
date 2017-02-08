<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/tagslib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>主页</title>
		<style type="text/css">
			a:hover {
				cursor: pointer;
				text-decoration: none;
			}
		</style>
	</head>

	<body>
		<div style="height:60px;position: relative;top: 0;width:100%;z-index: 100;background: #393D49;">
			<div style="display: inline;font-size: 40px;margin-left:20px;">
				<a><img src="${basePath}/img/logo1.png" style="width: 100px;height: 50px;"></a>
			</div>
			<ul class="layui-nav" style="border-radius: 0;display: inline;float: right;">
				<li class="layui-nav-item">
					<a>${user.username}</a>
				</li>
				<li class="layui-nav-item">
					<a id="setting" title="user/setting.jsp">设置</a>
				</li>
				<li class="layui-nav-item">
					<a onclick="logout();">退出</a>
				</li>
			</ul>
		</div>
		<div style="top:60px;position: absolute;overflow-x: hidden;">
			<ul class="layui-nav layui-nav-tree layui-nav-side" style="margin-top: 60px;border-radius: 0;">
				<li class="layui-nav-item layui-nav-itemed">
					<a>日常</a>
					<dl class="layui-nav-child">
						<dd>
							<a name='a' title="${basePath}/jsp/admin/good/list.jsp">商品管理</a>
						</dd>
						<dd>
							<a name='a' title="../../address.html">用户管理</a>
						</dd>
						<dd>
							<a name='a' title="${basePath}/admin/order/list?page=1">订单管理</a>
						</dd>
						<dd>
							<a name='a' title="${basePath }/admin/rac/list/1">售货服务</a>
						</dd>
						<dd>
							<a name='a' title="../../address.html">评价管理</a>
						</dd>
					</dl>
				</li>
				<li class="layui-nav-item layui-nav-itemed">
					<a>基础</a>
					<dl class="layui-nav-child">
						<dd>
							<a name='a' title="${basePath}/jsp/admin/good/brand.jsp">基础信息管理</a>
						</dd>
						<dd>
							<a name='a' title="../../address.html">仓库管理</a>
						</dd>
						<dd>
							<a name='a' title="../../address.html">人员管理</a>
						</dd>
					</dl>
				</li>
				<li class="layui-nav-item layui-nav-itemed">
					<a>日志</a>
					<dl class="layui-nav-child">
						<dd>
							<a name='a' title="../../address.html">订单日志</a>
						</dd>
						<dd>
							<a name='a' title="../../address.html">登录日志</a>
						</dd>
						<dd>
							<a name='a' title="../../address.html">异常日志</a>
						</dd>
					</dl>
				</li>
				<li class="layui-nav-item layui-nav-itemed">
					<a>报表</a>
					<dl class="layui-nav-child">
						<dd>
							<a name='a' title="../../address.html">销售报表</a>
						</dd>
						<dd>
							<a name='a' title="../../address.html">进货报表</a>
						</dd>
					</dl>
				</li>
			</ul>
		</div>
		<div style="left: 210px;right:0;position: absolute;overflow-y: auto;">
			<div class="layui-tab" lay-filter="demo" lay-allowClose="true">
				<ul id="tabTitle" class="layui-tab-title">
				</ul>
				<div id="tabContainers" class="layui-tab-content">
				</div>
			</div>
		</div>
		<form action="${basePath }/admin/login/logout" method="get" id="logoutForm"></form>
		<script type="text/javascript">
			//调整iframe高度
			function reinitIframe() {
				var iframes = document.getElementsByName("iframe");
				try {
					for(var i = 0; i < iframes.length; i++)
						//iframes[i].height = iframes[i].contentWindow.document.documentElement.scrollHeight;
						iframes[i].height = window.screen.height -270;
				} catch(ex) {}
			}
			window.setInterval("reinitIframe()", 200);

			layui.use('element', function() {
				var $ = layui.jquery,
					element = layui.element(); //Tab的切换功能，切换事件监听等，需要依赖element模块

				//触发事件
				var active = {
					tabAdd: function() {
						//新增一个Tab项
						element.tabAdd('demo', {
							title: $(this).text() + "<i class='layui-icon layui-unselect layui-tab-close'>&#x1006;</i>",
							content: '<iframe name="iframe" src="' + this.title + '" frameborder="0" style="width: 100%;"></iframe>'
						});
						//增加点击关闭事件
						var r = $("#tabTitle").find("li");
						//每次新打开tab都是最后一个，所以只对最后一个tab添加点击关闭事件
						r.eq(r.length - 1).children("i.layui-tab-close").on("click", function() {
							element.tabDelete("demo", $(this).parent("li").index());
						}), element.tabChange("demo", r.length - 1);
						element.init();
					},
					tabDelete: function(index) {
						//删除指定Tab项
						element.tabDelete('demo', index); //删除（注意序号是从0开始计算）
					},
					tabChange: function(index) {
						//切换到指定Tab项
						element.tabChange('demo', index); //切换（注意序号是从0开始计算）
					}
				};

				$("a[name='a']").on("click", function() {
					var title = $(this).text();
					var tabs = $(".layui-tab-title").children();
					for(var i = 0; i < tabs.length; i++) {
						if($(tabs[i]).html().substr(0,$(tabs[i]).html().indexOf("i")-1) == title) {
							element.tabChange('demo', i);
							return;
						}
					}
					active["tabAdd"].call(this);
					active.tabChange($(".layui-tab-title").children().length - 1);
				});
				
				$("#setting").on("click",function(){
					var title = $(this).text();
					var tabs = $(".layui-tab-title").children();
					for(var i = 0; i < tabs.length; i++) {
						if($(tabs[i]).html().substr(0,$(tabs[i]).html().indexOf("i")-1) == title) {
							element.tabChange('demo', i);
							return;
						}
					}
					active["tabAdd"].call(this);
					active.tabChange($(".layui-tab-title").children().length - 1);
				})
			});
			
			
			function logout(){
				layer.msg("fds");
				layer.confirm("确定退出登录?", {
					  btn: ["确定","取消"] //按钮
					}, function(){
					  $("#logoutForm").submit();
					}, function(index){
						layer.close(index);
					});
			}
		</script>
	</body>

</html>