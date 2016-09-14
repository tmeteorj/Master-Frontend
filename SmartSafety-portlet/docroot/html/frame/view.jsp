<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ page import="java.sql.ResultSet, java.util.List, cn.edu.tju.cs.smt.data.Menu" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*" %> 
<%@ page import="com.liferay.portal.kernel.util.*" %> 
<%@ page import="java.text.SimpleDateFormat" %>  
<%@ page import="javax.portlet.PortletURL" %>  
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>

<portlet:defineObjects />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/skin/tree.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/images/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/images/js/css.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/images/js/menu.js"></script>
<script type="text/javascript">
var site_url="${pageContext.request.contextPath}/";
</script>
<style>
body {
	width:100%;
	background:#ECF7FE url(${pageContext.request.contextPath}/admin/skin/images/bg_body.jpg) repeat-y top left;
	scrollbar-face-color: #E7F5FE; 
	scrollbar-highlight-color: #006699; 
	scrollbar-shadow-color: #006699; 
	scrollbar-3dlight-color: #E7F5FE; 
	scrollbar-arrow-color: #006699; 
	scrollbar-track-color: #E7F5FE; 
	scrollbar-darkshadow-color: #E7F5FE; 
	scrollbar-base-color: #E7F5FE;
	}
</style>
<input type="hidden" id="menulisturl" value="<%=renderRequest.getAttribute("menulisturl")%>">
<div id="header">
  <div class="logo"><a href="" target="_blank"><img src="${pageContext.request.contextPath}/admin/skin/images/logo.png" width="600" height="58" border="0"></a></div>
  <p id="info_bar"> 用户名：<strong class="font_arial white">
    admin    </strong>，角色：
    超级管理员     | <a href="c/portal/login" class="white">退出登录</a> | <a href="#" class="white" target="_blank">网站首页</a></p>
  <div id="menu">
    <ul>
    <%
    	List<Menu> menus = (List<Menu>)renderRequest.getAttribute("Menus");
    	int i=0;
    	for(i=0;i<menus.size();i++){
    		if(i==0){
    			out.println("<li><a href=\"javascript:get_menu("+menus.get(i).getMenuid()+",'tree',0);\" id=\"menu_"+menus.get(i).getMenuid()+"\" class=\"menu selected\" alt=\""+menus.get(i).getName()+"\" name=\""+menus.get(i).getMenuid()+"\"><span>"+menus.get(i).getName()+"</span></a></li>");
    		}else{
    			out.println("<li><a href=\"javascript:get_menu("+menus.get(i).getMenuid()+",'tree',0);\" id=\"menu_"+menus.get(i).getMenuid()+"\" class=\"menu\" alt=\""+menus.get(i).getName()+"\"><span>"+menus.get(i).getName()+"</span></a></li>");
    		}
    	}
    	
    %>   
	  </ul>
  </div>
</div>
<div id="admin_left" style="height: 468px;">
  <div id="inner" class="inner">
    <h4><em style="float:right"><img src="${pageContext.request.contextPath}/admin/skin/images/refresh.gif" onclick="javascript:menu_refresh()" width="16" height="25" id="menurefresh" alt="刷新" title="刷新">
		</em><span id="menu_name">我的面板</span></h4>
	    <div id="tree_box" class="p_r" style="top: 0px; left: 6px;">
      <div id="tree" class="tree p_a" style="top: 34px; overflow-y: auto; overflow-x: hidden; height: 828px;">
	  <div class="tree_div" onclick=" get_menu(99,'tree_99',1);" id="tree_div_99"><span class="tree_img"><img src="${pageContext.request.contextPath}/admin/skin/images/elbow-minus.gif" id="touimg_99" width="16" height="18" border="0"><img src="${pageContext.request.contextPath}/admin/skin/images/folder-open.gif" id="img_99" width="16" height="16" border="0"></span><span class="tree_text">常用操作</span></div>
	  <div id="tree_99" class="tree_line" style=""></div>
	  <div class="tree_div" onclick=" get_menu(100,'tree_100',1);" id="tree_div_100"><span class="tree_img"><img src="${pageContext.request.contextPath}/admin/skin/images/elbow-end-plus.gif" id="touimg_100" width="16" height="18" border="0"><img src="${pageContext.request.contextPath}/admin/skin/images/folder.gif" id="img_100" width="16" height="16" border="0"></span><span class="tree_text">个人信息</span></div><div id="tree_100" class="end" style="display:none;"></div>
	  </div>
    	  <div id="tree_bg" class="p_a" style="display: none; top: 288px;"></div>
      <div id="tree_click" class="p_a"></div>
    </div>
  </div>
</div>
<div id="admin_right">
  <div id="inner" class="inner">
      <iframe name="right" id="right" frameborder="0" src="" style="height: 100%; width: 100%; z-index: 111; background-color: rgb(255, 255, 255);"></iframe>
  </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/images/js/jqDnR.js"></script>

</div>