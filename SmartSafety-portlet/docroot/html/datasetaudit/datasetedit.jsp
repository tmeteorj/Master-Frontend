<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/html/init.jsp"%>

<style type="text/css">
	<%@ include file="/css/newdataset.css"%>
	<%@ include file="/css/datasetaudit.css"%>
	<%@ include file="/css/datasetedit.css"%>
</style>
<script type="text/javascript">
	<%@ include file="/js/jquery.js"%>
</script>

<portlet:actionURL var="toupdate" name="toupdate">
</portlet:actionURL>

<%
	DataSet ds = (DataSet) renderRequest.getAttribute("specificDs");
%>

<form id="myform" name="myform" method="post" action="<%=toupdate%>" >

<section id="editds_whole">
	<div class="pathbox">
	<span style="float: left">
	<a href="#">数据管理系统</a>
	 &nbsp; &gt; &nbsp; 修改数据集信息</span>
	 
	<portlet:renderURL var="audit"/>
	<span style="float: right">
	<a href="<%=audit%>">&lt; &nbsp; 返回审核与管理</a>
	</span>
	</div>
	
	<section id="editds_body">
	<h1><%=ds.getTitle() %></h1>
	<hr/>
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">数据名称：</strong>（必填）
	</label>
	<div class="mt10">
	<input type="text" name="title" class="w780"
	value="<%=ds.getTitle() %>"
	>
	</div>
	</fieldset>
	
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">数据描述：</strong>（必填，请简要描述该数据集的内容以及用途等情况）
	</label>
	<div class="mt10">
	<textarea rows="5"name = "datadescription" class="w780">
	<%=ds.getDataDescription() %>
	</textarea>
	</div>
	</fieldset>
	
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">数据来源：</strong>（不可修改）
	</label>
	<div class="mt10">
	<input type = "text" name = "datasource" class="w780"
	value="<%=ds.getDataSource()%>" readonly="readonly"
	>
	</div>
	</fieldset>
	
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">发布用户：</strong>（不可修改）
	</label>
	<div class="mt10">
	<input type = "text" name = "publisher" class="w780"
	value="<%=ds.getPublisher() %>" readonly="readonly"
	>
	</div>
	</fieldset>
	
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">发布时间：</strong>（不可修改）
	</label>
	<div class="mt10">
	<input type = "text" name = "pubtime" class="w780"
	value="<%=ds.getPubTime().toString().split("\\.")[0] %>" readonly="readonly"
	>
	</div>
	</fieldset>
	
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">数据类型：</strong>（必选）
	</label>
	<div class="mt10">
		<%if(ds.getDataType().equals("文本")){%>
				<input type="radio" checked="checked" name="type" value="text" id="_r1"> <%}else{%>
				<input type="radio" name="type" value="text" id="_r1"> <%} %>
		<label for="_r1" class="rdio ">文本</label>
		<%if(ds.getDataType().equals("图像")){%>
				<input type="radio" checked="checked" name="type" value="image" id="_r2"> <%}else{%>
				<input type="radio" name="type" value="image" id="_r2"> <%} %>
		<label for="_r2" class="rdio ">图像</label>
		<%if(ds.getDataType().equals("音频")){%>
				<input type="radio" checked="checked" name="type" value="audio" id="_r3"> <%}else{%>
				<input type="radio" name="type" value="audio" id="_r3"> <%} %>
		<label for="_r3" class="rdio ">音频</label>
		<%if(ds.getDataType().equals("视频")){%>
				<input type="radio" checked="checked" name="type" value="vedio" id="_r4"> <%}else{%>
				<input type="radio" name="type" value="vedio" id="_r4"> <%} %>
		<label for="_r4" class="rdio ">视频</label>
	</div>
	</fieldset>
	
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">数据大小：</strong>（必填）
	</label>
	<div class="mt10">
	<input type="text" name="datasizeval" pattern="^\d+(\.\d+)?$" class="w200"
	value="<%=ds.getDataSizeVal() %>"
	>
	<select name="datasizetype" class="h26 ml10">
		<%if(ds.getDataSizeType().equals("KB")) {%>
			<option value="KB" selected="selected">KB</option> <%}else { %>
			<option value="KB">KB</option> <%} %>
		<%if(ds.getDataSizeType().equals("MB")) {%>
			<option value="MB" selected="selected">MB</option> <%}else { %>
			<option value="MB">KB</option> <%} %>
		<%if(ds.getDataSizeType().equals("GB")) {%>
			<option value="GB" selected="selected">GB</option> <%}else { %>
			<option value="GB">KB</option> <%} %>
		<%if(ds.getDataSizeType().equals("TB")) {%>
			<option value="TB" selected="selected">TB</option> <%}else { %>
			<option value="TB">KB</option> <%} %>
	</select>
	</div>
	</fieldset>
	
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">数据标价：</strong>（必填）
	</label>
	<div class="mt10">
	<input type = "text" name = "price" pattern="^\d+$" class="w200"
	value="<%=ds.getPrice() %>"
	>
	<label class="ml10">积分</label>
	</div>
	</fieldset>
	
	</section>
	
	<p class="box">
		<input type="submit" class="ml10 mr10 bt">
		<input type="reset" class="ml10 mr10 bt">
	</p>

</section>
</form>