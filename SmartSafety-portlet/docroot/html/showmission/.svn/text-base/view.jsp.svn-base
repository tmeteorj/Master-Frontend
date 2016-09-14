<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ page language="java" pageEncoding="utf-8"%>

<%@ page import="cn.edu.tju.cs.smt.data.Mission"%>
<%@ page import="java.util.*"%>
<portlet:defineObjects />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>智慧城市大数据平台</title>
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
    System.out.println(basePath);
%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/base.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>css/index.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>css/table.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/map.css" />
<script src="<%=basePath %>js/jquery-1.7.2.js" type="text/javascript"
	charset="utf-8"></script>
<script src="<%=basePath %>js/bootstrap.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=vYqY1p0N8melwlfnLqBwlVmy"></script>
<script type="text/javascript"
	src="http://developer.baidu.com/map/jsdemo/data/points-sample-data.js"></script>
</head>
<body style="text-align: left;">
	<div class=" content">
		<div class="txt3">
			<h3>我的任务</h3>
			<table class="table" contenteditable="true">
				<thead>
					<tr>
						<th>编号</th>
						<th>任务名称</th>
						<th>开始时间</th>
						<th>是否完成</th>
						<th></th>
					</tr>
				</thead>

				<tbody>
					<%

				List<Mission> ans =(List<Mission>) renderRequest.getAttribute("ans");
				String st="未完成";
				for(int i=0;i<ans.size();i++){
					if(ans.get(i).getState()==2) st="已完成";
				%>
					<portlet:actionURL var="toedit" name="toedit">
						<portlet:param name="id"
							value="<%=ans.get(i).getMissionId().toString()%>" />
					</portlet:actionURL>
					<tr>
						<td><%=ans.get(i).getMissionId() %></td>
						<td><%=ans.get(i).getName() %></td>
						<td><%=ans.get(i).getStartTime().toString() %></td>
						<td><%=st %></td>
						<td><a href="${toedit}"><i>查看</i></a></td>
					</tr>
					<%
					st="未完成";
				}
				
				%>


				</tbody>
			</table>

			<hr>

			<%
			boolean showmap =(Boolean) renderRequest.getAttribute("showmap");
			List<String> loc =(List<String>) renderRequest.getAttribute("loc");
			Integer k =(Integer) renderRequest.getAttribute("k");
			if(showmap){
				if(!loc.isEmpty()){
			%>


			<div id="allmap"></div>
			<script type="text/javascript">
				// 百度地图API功能
				var map = new BMap.Map("allmap", {});                        // 创建Map实例
   	 			map.centerAndZoom(new BMap.Point(105.000, 38.000), 5);     // 初始化地图,设置中心点坐标和地图级别
    			map.enableScrollWheelZoom();

				if (document.createElement('canvas').getContext) {  // 判断当前浏览器是否支持绘制海量点
       				var points = [];  // 添加海量点数据
       				
       				
       				
				
				<%
					for(int kk=0;kk<k;kk++){
						Random rd = new Random();
						String c="#"+String.valueOf(rd.nextInt(10))+String.valueOf(rd.nextInt(10))+String.valueOf(rd.nextInt(10))+String.valueOf(rd.nextInt(10))+String.valueOf(rd.nextInt(10))+String.valueOf(rd.nextInt(10));
						System.out.println(k);
						for(int i=0;i<loc.size();i++){
							String tem[]=loc.get(i).split(",");
							try{
								if(Integer.valueOf(tem[3])!=kk) continue;
								
						%>
							points.push(new BMap.Point(<%=tem[1]%>, <%=tem[2]%>));
						<%
						
							}
							catch(Exception e){}
						}
						%>
		
			   				var options = {
			       				size: BMAP_POINT_SIZE_SMALL,
			       				shape: BMAP_POINT_SHAPE_STAR,
			       				color: '<%=c%>'
			   				}
			   				var pointCollection = new BMap.PointCollection(points, options);  // 初始化PointCollection
			   				pointCollection.addEventListener('click', function (e) {
			     				alert('单击点的坐标为：' + e.point.lng + ',' + e.point.lat);  // 监听点击事件
			   				});
			   				map.addOverlay(pointCollection);  // 添加Overlay
			   				points = [];
						
				
						<%
						
					}
				%>
						} else {
		   					alert('请在chrome、safari、IE8+以上浏览器查看本示例');
						}
				</script>
			<%
				}
			}
			%>

		</div>
		<div class=" clear"></div>
	</div>

</body>
</html>