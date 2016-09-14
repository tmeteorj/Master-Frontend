<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/html/init.jsp"%>

<style type="text/css">
	<%@ include file="/css/newdataset.css"%>
	<%@ include file="/css/datasetaudit.css"%>
</style>
<script type="text/javascript">
<%@ include file="/js/jquery.js"%>
</script>

<script type="text/javascript">
	$(function(){
		$(".cbx_del").click(function() {
			if($(this).attr("checked")==undefined) {
				$(this).attr("checked",true);
			} else {
				$(this).attr("checked",false);
			}
		});
		$(".cbx_aud").click(function() {
			if($(this).attr("checked")==undefined) {
				$(this).attr("checked",true);
			} else {
				$(this).attr("checked",false);
			}
		});
		
		$("#btnMulDel").click(function() {
			if(!mulCheck("cbx_del", "delIds", "delCnt")){
				return false;
			}
		});
		$("#btnMulDel2").click(function() {
			if(!mulCheck("cbx_aud", "audDelId", "audDelCnt")){
				return false;
			}
		});
		$("#btnMulPass").click(function() {
			if(!mulCheck("cbx_aud", "audPasId", "audPasCnt")){
				return false;
			}
		});
		
		/*para
		cbxClass:checkbox的class
			hfIds:hiddenfield的ID--ID序列 
			hfCnt:hiddenfield的ID--选中的数量
		*/
		function mulCheck(cbxClass, hfIds, hfCnt){
			var cnt = 0;
			var ids = ",";
			var len = $("."+cbxClass).length;
			for(var i = 0; i<len; i++) {
				var id = $("."+cbxClass).eq(i).val();
				if($("."+cbxClass).eq(i).attr("checked")=="checked") {
					cnt++;
					ids += id + ",";
				}
			}
			var delIds = ids.replace(/^,/,"").replace(/,$/,"");
			$("#"+hfIds).val(delIds);
			$("#"+hfCnt).val(cnt);
			console.log(cnt);
			console.log(delIds);
			if(cnt==0) {
				alert("请先选定数据集");
				return false;
			} else {
				if(!confirm("确定要操作选定的"+cnt+"个数据集?")){
					return false;
				}
			}
			return true;
		}
	});
	
</script>

	<div class="pathbox">
	<span>
	<a href="#">数据管理系统</a>
	 &nbsp; &gt; &nbsp; 数据集审核与管理</span>
	</div>

	<div>
	<div >
	<%
		List<DataSet> dsT = (List<DataSet>) renderRequest.getAttribute("dsT");
	%>
		<div style="padding:10px">
		已通过数据：共 &nbsp; <%=dsT.size() %> &nbsp;条结果
		</div>
		
		<table class="bordered">
			<tr>
				<th>选择</th>
				<th>数据名称</th>
				<th>发布者</th>
				<th>发布时间</th>
				<th>修改</th>
				<th>删除</th>
			</tr>
			<%
			for(DataSet ds : dsT)
			{
			%>
			<tr>
				<td>
					<input type="checkbox" class="cbx_del" name="checkboxT" value="<%=ds.getPkId() %>">
				</td>
				<td>
					<abbr title="<%=ds.getDataDescription() %>"> <%=ds.getTitle() %> </abbr>
				</td>
				<td>
					<%=ds.getPublisher() %>
				</td>
				<td>
					<%=ds.getPubTime()%>
				</td>
				<td>
					<portlet:renderURL var="toedit">
						<portlet:param name="jspPage" value="/html/datasetaudit/datasetedit.jsp"/>
						<portlet:param name="action" value="edit"/>
						<portlet:param name="datasetId" value="<%=ds.getPkId().toString()%>"/>
					</portlet:renderURL>
					<form action="<%=toedit%>" method="post">
					<input type="submit" value="修改">
					</form>
				</td>
				<td>
					<portlet:renderURL var="todelete">
						<portlet:param name="jspPage" value="/html/datasetaudit/view.jsp"/>
						<portlet:param name="action" value="delete"/>
						<portlet:param name="datasetId" value="<%=ds.getPkId().toString()%>"/>
					</portlet:renderURL>
					<form action="<%=todelete%>" method="post">
					<input type="submit" value="删除" onclick="return confirm('确定删除该项？')">
					</form>
				</td>
			</tr>
			<%
			}
			%>
			<tr>
				<!-- 
				<td>
					<input type="checkbox" value="全选/反选" onclick="invertSelect();"/>
				</td>
				 -->
				<td colspan="6" style="text-align:center">
				<portlet:renderURL var="todeletes">
					<portlet:param name="jspPage" value="/html/datasetaudit/view.jsp"/>
					<portlet:param name="action" value="deletes"/>
				</portlet:renderURL>
				<form action="<%=todeletes%>" method="post" name = "formT">
					<input id="delCnt" name="deletesFlag" type="hidden" value=""/>
					<input id="delIds"  name="ids" type="hidden" value=""/>
					<input id="btnMulDel" type="submit" value="批量删除" class="ml10 mr10 bt">
				</form>	
				</td>
			</tr>
		</table>
	</div>

	<div>
	<%
		List<DataSet> dsF = (List<DataSet>) renderRequest.getAttribute("dsF");
	%>
		<div style="padding:10px">
		待审核数据：共 &nbsp;<%=dsF.size() %> &nbsp;条结果
		</div>
		<table class="bordered">
			<tr>
				<th>选择</th>
				<th>数据名称</th>
				<th>发布者</th>
				<th>发布时间</th>
				<th>修改</th>
				<th>删除</th>
				<th>审核</th>
			</tr>
			<%
			for(DataSet ds : dsF)
			{
			%>
			<tr>
				<td>
					<input type="checkbox" class="cbx_aud" name="checkboxF" value="<%=ds.getPkId() %>">
				</td>
				<td>
					<abbr title="<%=ds.getDataDescription() %>"> <%=ds.getTitle() %> </abbr>
				</td>
				<td>
					<%=ds.getPublisher() %>
				</td>
				<td>
					<%=ds.getPubTime()%>
				</td>
				<td>
					<portlet:renderURL var="toedit2">
						<portlet:param name="jspPage" value="/html/datasetaudit/datasetedit.jsp"/>
						<portlet:param name="action" value="edit"/>
						<portlet:param name="datasetId" value="<%=ds.getPkId().toString()%>"/>
					</portlet:renderURL>
					<form action="<%=toedit2%>" method="post">
						<input type="submit" value="修改">
					</form>
				</td>
				<td>
					<portlet:renderURL var="todelete2">
						<portlet:param name="jspPage" value="/html/datasetaudit/view.jsp"/>
						<portlet:param name="action" value="delete"/>
						<portlet:param name="datasetId" value="<%=ds.getPkId().toString()%>"/>
					</portlet:renderURL>
					<form action="<%=todelete2%>" method="post">
					<input type="submit" value="删除" onclick="return confirm('确定删除该项？')">
					</form>
				</td>
				<td>
					<portlet:renderURL var="toaudit">
						<portlet:param name="jspPage" value="/html/datasetaudit/view.jsp"/>
						<portlet:param name="action" value="audit"/>
						<portlet:param name="datasetId" value="<%=ds.getPkId().toString()%>"/>
					</portlet:renderURL>
					<form action="<%=toaudit%>" method="post">
					<input type="submit" value="审核通过" >
					</form>
				</td>
			</tr>
			<%
			}
			%>
			<tr>
				<td colspan="7" style="text-align:center">
				<portlet:renderURL var="todeletes">
					<portlet:param name="jspPage" value="/html/datasetaudit/view.jsp"/>
					<portlet:param name="action" value="deletes"/>
				</portlet:renderURL>
				<form action="<%=todeletes%>" method="post" name = "formF">
					<input id="btnMulDel2" type="submit" value="批量删除" class="ml10 mr10 bt">
					<input id="audDelId" name="audDelId" type="hidden" value=""/>
					<input id="audDelCnt"  name="audDelCnt" type="hidden" value=""/>
					<input id="btnMulPass" type="submit" value="批量通过" class="ml10 mr10 bt">
					<input id="audPasId" name="audPasId" type="hidden" value=""/>
					<input id="audPasCnt"  name="audPasCnt" type="hidden" value=""/>
				</form>
				</td>
			</tr>
		</table>
	</div>
	
	</div>