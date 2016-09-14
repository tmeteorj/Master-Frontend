<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="common.ConstMap"%>
<html>
<%
	String path=request.getContextPath();
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="<%=path%>/css/main.css"/>
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
    <script src="http://webapi.amap.com/maps?v=1.3&key=您申请的key值"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript">
		var map ;

		var $tooltip = { //tooltip数据模型
			dom: null,
			data: ''
		};
		function bindTooltip(data, callback) {
			$tooltip.data = data;
			$tooltip.dom.innerHTML = $tooltip.data;
			callback();
		}
		function generateChart(id) {
			var uri = 'json/all/' + id + '.json';
			$.getJSON(uri, function(data) {
				var lines = [];
				var vals = [];
				var seriesArr = [];

				$.each(data, function(name, value) {
					lines.push(name);
					vals.push(value);
					var obj = {
						name: name,
						type: 'line',
						stack: '数量',
						data: value
					};
					seriesArr.push(obj);
				});

				var myChart = echarts.init(document.getElementById('main'));
				var option = {
					tooltip: {
						trigger: 'axis'
					},
					legend: {
						data: lines
					},
					grid: {
						left: '3%',
						right: '4%',
						bottom: '3%',
						containLabel: true
					},
					toolbox: {
						feature: {
							saveAsImage: {}
						}
					},
					xAxis: {
						type: 'category',
						boundaryGap: false,
						data: ['20:00', '20:30', '21:00', '21:30', '22:00', '22:30', '23:00', '23:30']
					},
					yAxis: {
						type: 'value'
					},
					series: seriesArr
				};
				myChart.setOption(option);
			});
		}
		
		function handler(e) {
			relocate(e.clientX, e.clientY); //分发事件参数
		}
		function relocate(x, y) {
			$tooltip.dom.style.left = (+x + 15) + 'px';
			$tooltip.dom.style.top = (+y + 15) + 'px';
		}
		function init(){
			$tooltip.dom = document.getElementById('tooltip');
			map= new AMap.Map('container', {
			    resizeEnable: true,
			    zoom:14,
		        center: [117.172762, 39.111031]
			});
			initWork();
		}
		function initWork(){
			var type = $("#sel_work").val();
			if (type == 0) {
				$(".attr").show();
				$(".movetype").hide();
			} else {
				$(".attr").hide();
				$(".movetype").show();
			}
		};
		function max(a,b){
			if(a<b)return b;
			else return a;
		}
		function drawPolygon(attr,response){
			map.clearMap();
			if(response.code!=0){
				alert(response.msg);
			}else{
				var data=response.data;
				var maxval=1.0;
				for(var i=0;i<data.length;i++){
					for(var v in data[i].attr){
						maxval=max(data[i].attr[v],maxval);
					}
				}
				maxval=maxval*1.5;
				for(var i=0;i<data.length;i++){
					var arr=new Array();
					for(var j=0;j<data[i].polygon.length;j++){
						arr.push([data[i].polygon[j].lng,data[i].polygon[j].lat]);
					}
					var value=0.0,planeid=data[i].planeid;
					for(var v in data[i].attr){
						value=max(data[i].attr[v],value);
					}
					value=value;
					var polygon = new AMap.Polygon({
				        path: arr,//设置多边形边界路径
				        strokeColor: "#F33", //线颜色
				        strokeOpacity: 1, //线透明度
				        strokeWeight: 3,    //线宽
				        fillColor: "#ee2200", //填充色
				        fillOpacity: value/maxval//填充透明度
				    });
					
					var extD = 'planeid:'+planeid+'<br>value:'+value;
					polygon.setExtData(extD);
					polygon.setMap(map);
					polygon.emit('mouseover mouseout click', {
						target: polygon
					});
		
					AMap.event.addListener(polygon, 'mouseover', function(e) {
						bindTooltip(e.target.getExtData(), function() {
							$tooltip.dom.style.display = 'block';
						});
						document.addEventListener('mousemove', handler);
					});
		
					AMap.event.addListener(polygon, 'mouseout', function(e) {
						document.removeEventListener('mousemove', handler);
						$tooltip.dom.style.display = 'none';
					});
				}
				
			}
		}
		function searchAttr(){
			var year=$("#sel_year").val();
			var month=$("#sel_month").val();
			var attr=$("#sel_attr").val();
			console.log("searchAttr "+year+"-"+month+"-"+attr);
			
			$.ajax({
				type : "POST",
				url : "http://localhost:8080/plane/search-by-yma?callback=?",
				data : {
					"year":year,
					"month":month,
					"attr":attr
				},
				dataType: "jsonp",
				jsonp: "callback",
				success : function(data) {
					console.log(data);
					drawPolygon(attr,data);
				},
				error : function() {
					alert("Error");
				}
			});
		}
		
		function updateView(){
			var type=$("#sel_work").val();
			if(type==0){
				searchAttr();
			}
		}

		$(function(){
			init();
			$("#sel_work").change(function() {
				initWork();
			});
			$("#btn_search").click(function() {
				updateView();
			});
		});
	</script>
</head>
<body>
<div>
	<div id="div_control" style="text-align:center">
	  
	  <div id="div_work" style="width:300px; float:center; display:inline">
	  
	  	<label style="float:center">功能:</label>
		  <select id="sel_work" style="width:120px">
			  <option value="0">地块特征</option>
<!-- 			  <option value="1">人口迁徙</option> -->
		  </select>
	  </div>
	  
	  <div id="div_yml" style="width:400px; float:center; display:inline">
	  
		  <label style="width:100px; float:center">年份:</label>
		  <select id="sel_year" style="width:120px">
			  <option value="2014">2014</option>
			  <option value="2015">2015</option>
		  </select>
		  
		  <label style="width:100px; float:center">月份:</label>
		  <select id="sel_month" style="width:120px">
			  <option value="1">1</option>
			  <option value="2">2</option>
			  <option value="3">3</option>
			  <option value="4">4</option>
			  <option value="5">5</option>
			  <option value="6">6</option>
			  <option value="7">7</option>
			  <option value="8">8</option>
			  <option value="9">9</option>
			  <option value="10">10</option>
			  <option value="11">11</option>
			  <option value="12">12</option>
		  </select>
		  <label class="attr" id="label_attr" style="width:100px; float:center">属性:</label>
		  <select class="attr" id="sel_attr" style="width:120px">
		  	<%
		  		for(String[] items:ConstMap.attrMap){
		  			out.println(String.format("<option value=\"%s\">%s</option>",items[0],items[1]));
		  		}
		  	%>
		  </select>
		  
		  <label class="movetype" id="label_movetype" style="width:100px; float:center">类型:</label>
		  <select class="movetype" id="sel_movetype" style="width:120px">
		  	<option value="0">真实迁徙</option>
		  	<option value="1">预测迁徙</option>
		  </select>
		  
		  <input type="button" id="btn_search" value="搜索" style="height:auto; width:100px; float:center"></input>
	  </div>
	  
	  
	</div>
	<div id="container" style="height:600px;margin-top:10%;margin-left:auto;margin-right:auto">
		<div id="tooltip" class="tooltip">this is tooltip</div>
	</div>
    <div id="panel" class="panel">
        <div id="close" class="close">×</div>
        <div id="title" class="title"></div>
        <div id="main" style="width:600px;height:400px;"></div>
    </div>
</div>
</body>
</html>