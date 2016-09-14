<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/html/init.jsp"%>
<portlet:defineObjects />

<style type="text/css">
	<%@ include file="/css/reset.css"%>
	<%@ include file="/css/common.css"%>
</style>
<script type="text/javascript">
<%@ include file="/js/jquery.js"%>
</script>

<script type="text/javascript">
</script>

<portlet:renderURL var="tosearch">
	<portlet:param name="jspPage" value="/html/datasetdisp/view.jsp" />
	<portlet:param name="searchres" value="1"/>
</portlet:renderURL>

<form action="<%=tosearch%>" method="post">
<input type="text" name="keyword" placeholder="请输入查找关键字">
<input type="submit" value="搜索">
  <portlet:renderURL var="def"/>
  <a href="${def}">查看所有</a>
</form>

<div class="wrapper">
	<%
		List<DataSet> datasets = (List<DataSet>)renderRequest.getAttribute("DataSet");
	%>
	<div>
		共<%=datasets.size()%>条结果
	</div>

	<%
		for(int i = 0; i<datasets.size(); i++) { 
			DataSet ds = (DataSet)datasets.get(i);
	%>
	<div class="ds_wrapper">
		<div class="ds_line">
			<portlet:renderURL var="toview">
				<portlet:param name="jspPage" value="/html/datasetdisp/datasetdetail.jsp"/>
				<portlet:param name="datasetId" value="<%=ds.getPkId().toString()%>"/>
				<portlet:param name="tbname" value="<%=ds.getTbName().toString() %>"/>
			</portlet:renderURL>
			<span class="ds_tt"><a href="<%=toview%>"><%=ds.getTitle()%></a></span>
		</div>
		<div class="ds_line">
			<span class="ds_innerblock"><span>数据标价:</span><span><%=ds.getPrice()%></span><span>积分</span></span>
			<span class="ds_innerblock"><span>数据大小:</span><span><%=ds.getDataSizeVal()+ ds.getDataSizeType()%></span></span>
			<span class="ds_innerblock"><span>发布时间:</span><span><%=ds.getPubTime().toString().split("\\.")[0]%></span></span>
		</div>
		<div class="ds_line">
			<div class="ds_desp">
				<span class="ds_despinner"> <%=ds.getDataDescription().length()>=100?
			ds.getDataDescription().substring(0,100)+"...":
				ds.getDataDescription()%>
				</span>
			</div>
		</div>
		<div class="ds_line">
			<span class="ds_innerblock">发布者:<%=ds.getPublisher()%></span> <span
				class="ds_innerblock">数据来源:<%=ds.getDataSource()%></span>
		</div>

	</div>
	<%
			}
		%>
</div>