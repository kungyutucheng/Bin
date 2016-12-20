//数量输入框只保留数字
function getNumFromInput(obj) {
	var value = $(obj).val();
	$(obj).val(value.replace(/[^0-9]+/g, ''));
}

//加一
function addNum(id) {
	$("#" + id).val(Number($("#" + id).val().replace(/[^0-9]+/g, '')) + 1);
}

//减一
function subNum(id) {
	$("#" + id).val(Number($("#" + id).val().replace(/[^0-9]+/g, '')) - 1 >= 1 ? Number($("#" + id).val().replace(/[^0-9]+/g, '')) - 1 : 1);
}

/*layui.use('util', function() {
	var util = layui.util;

	//使用内部工具组件
	util.fixbar();
});*/