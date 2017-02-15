<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/admin/tagslib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据统计</title>
<script src="${basePath }/asserts/echarts.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
	.block{
		width:100%;
		height:500px;
	}
</style>
</head>
<body>
<div class="container-fluid">
	<form id="searchForm" class="layui-form" style="margin:10px 0;padding:0;">
		<div class="layui-form-item">
			<div class="layui-input-block" style="margin:10px 0;padding:0;">
				<div class="layui-inline">
					<select name="year"></select>
				</div>
				<div class="layui-inline">
					<button class="layui-btn" type="button" id="searchBtn">查询</button>
				</div>
			</div>
		</div>
		<input type="hidden" value="${good.id}" name="id" id="id">
	</form>
	<div id="monthChart" class="block"></div>
	<div id="dayChart" class="block"></div>
	<input type="hidden" value="${good.name }" id="goodName">
</div>
</body>
<script type="text/javascript">
$(function(){
	var form = layui.form();
	var html = "";
	var year = new Date().getYear() + 1900;
	for(var i = year;i >= year - 10;i--){
		html += "<option value='" + i + "'>" + i + "</option>";
	}
	$("select[name='year']").html(html);
	form.render();
	
	$("#searchBtn").on("click" , function(){
		$.post("${basePath}/admin/good/countByMonth" , $("#searchForm").serializeObject() , function(result){
			result = $.parseJSON(result);
			initMonthChart(result.timeArray , result.sumArray);
		});
	});
	$("#searchBtn").click();
});


function initMonthChart(xData,data){
	
	var monthChart = echarts.init(document.getElementById("monthChart"));
	var year = $("select[name='year']").val();
	var option = {
	    backgroundColor: "#344b58",
	    title: {
	        text: year + "年" + $("#goodName").val() + "销量统计",
	        textStyle: {
	            color: '#fff',
	            fontSize: '22',
	            fontFamily : '微软雅黑'
	        },
	        x : 'center'
	    },
	    tooltip: {
	        trigger: "axis",
	        axisPointer: {
	            type: "shadow",
	            textStyle: {
	                color: "#fff"
	            }
	
	        },
	    },
	    grid: {
	        borderWidth: 0,
	        top: 110,
	        bottom: 95,
	        textStyle: {
	            color: "#fff"
	        }
	    },
	    legend: {
	        top: '11%',
	        textStyle: {
	            color: '#90979c',
	        },
	        data: ['销量']
	    },
	    calculable: true,
	    xAxis: [{
	        type: "category",
	        axisLine: {
	            lineStyle: {
	                color: '#90979c'
	            }
	        },
	        splitLine: {
	            show: false
	        },
	        axisTick: {
	            show: false
	        },
	        splitArea: {
	            show: false
	        },
	        axisLabel: {
	            interval: 0,
	
	        },
	        data: xData,
	    }],
	    yAxis: [{
	        type: "value",
	        splitLine: {
	            show: false
	        },
	        axisLine: {
	            lineStyle: {
	                color: '#90979c'
	            }
	        },
	        axisTick: {
	            show: false
	        },
	        axisLabel: {
	            interval: 0,
	
	        },
	        splitArea: {
	            show: false
	        },
	
	    }],
	    dataZoom: [{
	        show: true,
	        height: 30,
	        xAxisIndex: [
	            0
	        ],
	        bottom: 30,
	        start: 0,
	        end: 100,
	        handleIcon: 'path://M306.1,413c0,2.2-1.8,4-4,4h-59.8c-2.2,0-4-1.8-4-4V200.8c0-2.2,1.8-4,4-4h59.8c2.2,0,4,1.8,4,4V413z',
	        handleSize: '110%',
	        handleStyle:{
	            color:"#d3dee5",
	            
	        },
	       	textStyle:{
	        	color:"#fff"
	        },
	        borderColor:"#90979c"
	    }],
	    series: [{
	            name: "销量",
	            type: "bar",
	            barMaxWidth: 35,
	            barGap: "10%",
	            itemStyle: {
	                normal: {
	                    color: "rgba(255,144,128,1)",
	                    label: {
	                        show: true,
	                        textStyle: {
	                            color: "#fff"
	                        },
	                        position: "insideTop",
	                        formatter: function(p) {
	                            return p.value > 0 ? (p.value) : '';
	                        }
	                    }
	                }
	            },
	            data: data
	        },
	    ]
	}
	monthChart.setOption(option);
	
	monthChart.on("click" , function(params){
		$.post("${basePath}/admin/good/countByDay",{
			id : $("#id").val(),
			time : params.name
		},function(result){
			console.log(result);
			result = $.parseJSON(result);
			initDayChart(params.name , result.timeArray , result.sumArray);
		})
	});
}

function initDayChart(name , xData , data){
	var dayChart = echarts.init(document.getElementById("dayChart"));
	var option = {
		    backgroundColor: "#344b58",
		    title: {
		        text: name + "月" + $("#goodName").val() + "销量统计",
		        textStyle: {
		            color: '#fff',
		            fontSize: '22',
		            fontFamily : '微软雅黑'
		        },
		        x : 'center'
		    },
		    tooltip: {
		        trigger: "axis",
		        axisPointer: {
		            type: "shadow",
		            textStyle: {
		                color: "#fff"
		            }
		
		        },
		    },
		    grid: {
		        borderWidth: 0,
		        top: 110,
		        bottom: 95,
		        textStyle: {
		            color: "#fff"
		        }
		    },
		    legend: {
		        top: '11%',
		        textStyle: {
		            color: '#90979c',
		        },
		        data: ['销量']
		    },
		    calculable: true,
		    xAxis: [{
		        type: "category",
		        axisLine: {
		            lineStyle: {
		                color: '#90979c'
		            }
		        },
		        splitLine: {
		            show: false
		        },
		        axisTick: {
		            show: false
		        },
		        splitArea: {
		            show: false
		        },
		        axisLabel: {
		            interval: 0,
		
		        },
		        data: xData,
		    }],
		    yAxis: [{
		        type: "value",
		        splitLine: {
		            show: false
		        },
		        axisLine: {
		            lineStyle: {
		                color: '#90979c'
		            }
		        },
		        axisTick: {
		            show: false
		        },
		        axisLabel: {
		            interval: 0,
		
		        },
		        splitArea: {
		            show: false
		        },
		
		    }],
		    dataZoom: [{
		        show: true,
		        height: 30,
		        xAxisIndex: [
		            0
		        ],
		        bottom: 30,
		        start: 0,
		        end: 100,
		        handleIcon: 'path://M306.1,413c0,2.2-1.8,4-4,4h-59.8c-2.2,0-4-1.8-4-4V200.8c0-2.2,1.8-4,4-4h59.8c2.2,0,4,1.8,4,4V413z',
		        handleSize: '110%',
		        handleStyle:{
		            color:"#d3dee5",
		            
		        },
		       	textStyle:{
		        	color:"#fff"
		        },
		        borderColor:"#90979c"
		    }],
		    series: [{
		            name: "销量",
		            type: "bar",
		            barMaxWidth: 35,
		            barGap: "10%",
		            itemStyle: {
		                normal: {
		                    color: "rgba(255,144,128,1)",
		                    label: {
		                        show: true,
		                        textStyle: {
		                            color: "#fff"
		                        },
		                        position: "insideTop",
		                        formatter: function(p) {
		                            return p.value > 0 ? (p.value) : '';
		                        }
		                    }
		                }
		            },
		            data: data
		        },
		    ]
		}
	dayChart.setOption(option);
}

</script>
</html>