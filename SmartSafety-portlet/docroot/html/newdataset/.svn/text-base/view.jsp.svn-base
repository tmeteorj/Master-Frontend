<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/html/init.jsp"%>

<style type="text/css">
	<%@ include file="/css/newdataset.css"%>
</style>
<script type="text/javascript">
	<%@ include file="/js/jquery.js"%>
</script>

<portlet:actionURL var="toupload" name="toupload">
	<portlet:param name="jspPage" value="html/datasetdisp/view.jsp"/>
</portlet:actionURL>


<section id="newds_whole">
	<div class="pathbox">
	<span>
	<a href="#">数据管理系统</a>
	 &nbsp; &gt; &nbsp; 新建数据集</span>
	</div>
	
	<section id="newds_left" class="mt10">

	<form id="myform" name="myform" method="post" action="<%=toupload%>" >
	
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">数据名称：</strong>（必填）
	</label>
	<div class="mt10">
	<input type="text" name="title" class="w780">
	</div>
	</fieldset>
	
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">数据描述：</strong>（必填，请简要描述该数据集的内容以及用途等情况）
	</label>
	<div class="mt10">
	<textarea rows="5"name = "datadescription" class="w780"></textarea>
	</div>
	</fieldset>
	
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">数据来源：</strong>（必填，请说明数据的来源或所有者）
	</label>
	<div class="mt10">
	<input type = "text" name = "datasource" class="w780"/>
	</div>
	</fieldset>
	
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">数据类型：</strong>（必选）
	</label>
	<div class="mt10">
	<input type="radio" checked="checked" name="type" value="text" id="_r1">
	<label for="_r1" class="rdio ">文本</label>
	<input type="radio" name="type" value="image" id="_r2">
	<label for="_r2" class="rdio ">图像</label>
	<input type="radio" name="type" value="audio" id="_r3">
	<label for="_r3" class="rdio ">音频</label>
	<input type="radio" name="type" value="vedio" id="_r4">
	<label for="_r4" class="rdio ">视频</label>
	</div>
	</fieldset>
	
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">数据大小：</strong>（必填）
	</label>
	<div class="mt10">
	<input type="text" name="datasizeval" pattern="^\d+(\.\d+)?$" class="w200">
	<select name="datasizetype" class="h26 ml10">
		<option value="KB">KB</option>
		<option value="MB">MB</option>
		<option value="GB">GB</option>
		<option value="TB">TB</option>
	</select>
	<span class="ml10">（超大数据不能上传？请看
	<a href="#">这里</a>
	）</span>
	</div>
	</fieldset>
	
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">数据标价：</strong>（必填）
	</label>
	<div class="mt10">
	<input type = "text" name = "price" pattern="^\d+$" class="w200"/>
	<label class="ml10">积分</label>
	<span>（积分是什么？怎么使用？请看
	<a href="#">详情</a>
	）</span>
	</div>
	</fieldset>
	
	<%String  publisher = user.getScreenName(); %>
	<input type="hidden" name = "publisher" value="<%=publisher %>">
	
	</form>
	
	<fieldset class="newds_filedset">
	<label>
		<strong class="fs_fc">文件上传：</strong>
	</label>
	<div class="mt10">
	 <!--  
	<portlet:renderURL var="touploadfile">
		<portlet:param name="action" value="uploadfile"/>
	</portlet:renderURL>
	<form name="uploadForm" method="post" action="<%=touploadfile %>" enctype="multipart/form-data">
		<input type="file" name="fileName">
		<input type="button" value="上传文件" onclick="upload()">
	</form>
	-->
	<portlet:actionURL var="touploadfile" name="touploadfile">
		<portlet:param name="action" value="uploadfile"/>
	</portlet:actionURL>
	<form name="uploadForm" method="post" action="<%=touploadfile %>" enctype="multipart/form-data">
		<input type="file" name="fileName" class="w200">
		<input type="submit" value="上传文件" class="ml10 mr10 bt">
	</form>
	</div>
	</fieldset>
	
	</section>
	
	<section id="newds_right" class="mt10">
	<div class="tip mt10">
	<label>
		<strong class="fs_fc gray_title">共享 让数据“活”起来</strong>
	</label>
	<ul class="mb10">
		<li>数据被成功下载，可获取相应积分</li>
		<li>数据被使用，获得企业合作机会，扩大学术影响</li>
	</ul>
	</div>
	
	<div class="tip mt10">
	<label>
		<strong class="fs_fc gray_title">用户须知</strong>
	</label>
	<ul class="mb10">
		<li>请勿在未经授权的情况下上传任何涉及版权侵权的数据</li>
		<li>如涉及侵权内容，您的数据将被移除</li>
		<li>本站拥有并保留最终解释权</li>
	</ul>
	</div>
	
	<div class="tip mt10">
	<label>
		<strong class="fs_fc gray_title">其他注意事项</strong>
	</label>
	<ul class="mb10">
		<li>blabla</li>
		<li>blabla</li>
		<li>blabla</li>
	</ul>
	</div>
	
	</section>
	
	<p class="box">
		<input type="submit" onclick = "submit()" class="ml10 mr10 bt">
		<input type="reset"  onclick = "reset()" class="ml10 mr10 bt">
	</p>

</section>

<script>
	function reset()
	{
		document.myform.reset();
	}
	function submit()
	{
		document.myform.submit();
	}
	function upload()
	{
		document.uploadForm.submit();
	}
</script>