<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/html/datadisplay/init.jsp"%>
<%@ page import="cn.edu.tju.cs.smt.data.WangdianInfo"%>
<%@ page import="cn.edu.tju.cs.smt.data.User"%>
<portlet:defineObjects />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>智慧城市大数据平台</title>

</head>
<body >
	<portlet:actionURL var="markuser" name="markuser">

		<portlet:param name="jspPage" value="/html/datadisplay/view.jsp" />
	</portlet:actionURL>

	<form name="form_query" id="form_query" method="post"
		action="<%=markuser %>">
		username <input type="text" id="userName" name="userName" /><br />
		password <input type="password" id="password" name="password" /><br />
		<button type="submit">登录</button>
	</form>

</body>
</html>