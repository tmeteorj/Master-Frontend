<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/html/init.jsp"%>
<portlet:defineObjects />

<style type="text/css">
<%@include file="/css/reset.css"%>
<%@include file="/css/common.css"%>
</style>

<script type="text/javascript">
	<%@ include file="/js/jquery.js"%>
	<%@ include file="/js/highcharts.js"%>
	<%@ include file="/js/highchartfuncs.js"%>
	<%@ include file="/js/highchartfuncs.js"%>
</script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1rtjWliQqQIQbkmiafnDSUG7"></script>
<script type="text/javascript">
	$(function(){
		//地图显示
		$(".MapView").click(function(){
			visOpen();
			var colnum = $(this).attr("colnum");
			var colItems = $(".tbcol_"+colnum);
			
			
			var map = new BMap.Map("container");    // 创建Map实例
			map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
			
			var avgLng = 0.0;
			var avgLat = 0.0;
			var marker = null;
			for(var i = 0; i<colItems.length; i++) {
				//console.log(colItems.eq(i).html());
				var lnglat = colItems.eq(i).html();
				console.log(lnglat);
				
				var lng = parseFloat(lnglat.split(",")[0]);
				var lat = parseFloat(lnglat.split(",")[1]);
				if(i==0) {
					avgLng = lng;
					avgLat = lat;
				}
				marker = new BMap.Marker(new BMap.Point(lng, lat));
				map.addOverlay(marker); 
			}
			var point = new BMap.Point(avgLng, avgLat);
			map.centerAndZoom(point, 13);
			map.enableScrollWheelZoom(true);  
			
		});
		//折线
		$(".LineView").click(function(){
			visOpen();
			var colnum = $(this).attr("colnum");
			var colItems = $(".tbcol_"+colnum);
			var data = "";
			for(var i = 0; i<colItems.length; i++) {
				console.log(colItems.eq(i).html());
				data += colItems.eq(i).html() + ",";
			}
			drawLineCharts(data, true);
		});
		
		$(".btn_hide").click(function(){
			visClose();
			$("#container").html("");
		});
		/*可视化区域的显示和隐藏*/
		function visOpen() {
			
			$(".visual_wrapper").show();
			$("#container").animate({height:"500px"});
		}
		function visClose() {
			$("#container").animate({height:"0"});
			$(".visual_wrapper").hide();
		}
	});
</script>
<%
	DataSet ds = (DataSet) renderRequest.getAttribute("DataSet");
	List<String> tbView = (List<String>)renderRequest.getAttribute("TableView");
	TableViewRowCol[] tbTitle = (TableViewRowCol[])renderRequest.getAttribute("TableTitle");
%>
<portlet:renderURL var="def" />

<div>
	<a href="${def}">&lt&lt返回数据集列表</a>
	<ul class="ods">
		<li class="ods_dstt"><%=ds.getTitle()%></li>
		<li><span class="ods_tt">数据集描述：</span><span class="ods_cntx"><%=ds.getDataDescription()%></span></li>
		<li><span class="ods_tt">数据集大小：</span><span class="ods_cntx"><%=ds.getDataSizeVal()%><%=ds.getDataSizeType()%></span></li>
		<li><span class="ods_tt">数据来源：</span><span class="ods_cntx"><%=ds.getDataSource()%></span></li>
		<li><span class="ods_tt">数据类型：</span><span class="ods_cntx"><%=ds.getDataType()%></span></li>
		<li><span class="ods_tt">发布者：</span><span class="ods_cntx"><%=ds.getPublisher()%></span></li>
		<li><span class="ods_tt">发布日期：</span><span class="ods_cntx"><%=ds.getPubTime().toString().split("\\.")[0]%></span></li>
		<li><span class="ods_tt">下载量：</span><span class="ods_cntx"><%=ds.getDownloadCnt()%></span></li>
		<li class="red_letter"><span class="ods_tt">数据标价：</span><span
			class="ods_cntx"><%=ds.getPrice()%>积分</span></li>
		<input type="button" value="数据下载" />
		<input type="button" value="给管理员留言" />
	</ul>
</div>

<div class="visual_wrapper">
	<div class="hide_wrapper">
		<a class="btn_hide">关闭</a>
	</div>
	<div id="container" style="width:800px;  margin: 0 auto"></div>
</div>

<table class="bordered">
	<tr>
		<%
			for(int i =  0; i<tbTitle.length; i++) {
		%>
		<th class="tbtitle_<%=i %>>" ><%=tbTitle[i].rowName%>
		</th>
		<%}%>
	</tr>
	<tr>
		<%
			for(int i =  0; i<tbTitle.length; i++) {
		%>
		<th class="tbtitle_<%=i %>>" >
		<%if(tbTitle[i].canMapView){ %>
		<a class="MapView func" colnum="<%=i %>">地图显示</a>
		<%} %>
		<%if(tbTitle[i].canHistogramView){ %>
		<a class="HistogramView func" colnum="<%=i %>">柱状</a>
		<%} %>
		<%if(tbTitle[i].canLineView){ %>
		<a class="LineView func" colnum="<%=i %>">折线</a>
		<%} %>
		<%if(tbTitle[i].canPieView){ %>
		<a class="PieView func" colnum="<%=i %>">饼图</a>
		<%} %>
		</th>
		<%}%>
	</tr>
	<%
		for(int i = 0; i<tbView.size(); i++) {
	%>
	<tr>
		<%
			String[] line = tbView.get(i).split("#"); 
			for(int j = 0; j<line.length; j++) {
		%>
		<td class="tbcol_<%=j %>"><%=line[j]%></td>
		<%
			}
		%>
	</tr>
	<%}%>
</table>