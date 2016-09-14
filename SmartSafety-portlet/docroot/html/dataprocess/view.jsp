<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ page language="java" pageEncoding="utf-8"%>
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
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/index.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/table.css" />
<script src="<%=basePath %>js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath %>js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body style="text-align: left;" >
	<div class=" content">

		<div class="txt3">
			<%
			String state =(String) renderRequest.getAttribute("state"); 
			if(state.equals("1")){%>

			<h3>我的应用</h3>
			<table class="table" contenteditable="true">
				<thead>
					<tr>
						<th>编号</th>
						<th>应用名称</th>
						<th>是否在线</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>农商行客户数据K-means聚类</td>
						<td>是</td>
						<td><i>选择</i></td>
					</tr>
					<tr>
						<td>2</td>
						<td>案例位置数据K-means聚类</td>
						<td>是</td>
						<td><i>选择</i></td>
					</tr>
				</tbody>
			</table>

			<hr>
			<div>

				<h3>应用配置</h3>
			<!--	<portlet:actionURL var="tosubmit" name="tosubmit">
					<portlet:param name="jspPage" value="/html/dataprocesspre/commit.jsp"/>
				</portlet:actionURL> -->
				<form id="form" name="form" method="post" action="<portlet:actionURL name="tosubmit" />">
				<table>
					<tr>
						<td>K值</td>
						<!--
						<td><input name="vk" type="text" value="3"
							onfocus="if (value =='3'){value =''}"
							onblur="if (value ==''){value='3'}" /></td>-->
						<td><input name="vk" type="text"/></td>	
					</tr>
					<tr>
						<td>最大迭代次数</td>
						<td><input name="vmaxi" type="text"/></td>
					</tr>
				</table>
				<br>
				<input class="btn" type="submit" name="submit" 
					style="border: 1px solid #999; background: #006dcc; font-size: 16px;"
					value="提交任务">
				</form>
			</div>
			<%
			}
			else if(state.equals("3")){
			%>
			<b>系统计算中......</b>
			<img src="<%=basePath %>img/loading.gif"  height="100%" width="100%"/>
			<%
			}
			else{
			%>
			<b>申请失败了......</b>
			<%}%>
		</div>
		<div class=" clear"></div>
	</div>

</body>
</html>
