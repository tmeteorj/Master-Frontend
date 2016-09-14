<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/html/datadisplay/init.jsp"%>
<%@ page import="cn.edu.tju.cs.smt.data.Vizfunccfg"%>

<%@ page import="cn.edu.tju.cs.smt.data.WangdianInfo"%>
<%@ page import="cn.edu.tju.cs.smt.data.User"%>
<%@ page import="javax.xml.parsers.DocumentBuilder"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@ page import="javax.xml.parsers.ParserConfigurationException"%>
<%@ page import="javax.xml.transform.OutputKeys"%>
<%@ page import="javax.xml.transform.Result"%>
<%@ page import="javax.xml.transform.Source"%>
<%@ page import="javax.xml.transform.Transformer"%>
<%@ page import="javax.xml.transform.TransformerConfigurationException"%>
<%@ page import="javax.xml.transform.TransformerException"%>
<%@ page import="javax.xml.transform.TransformerFactory"%>
<%@ page import="javax.xml.transform.dom.DOMSource"%>
<%@ page import="javax.xml.transform.stream.StreamResult"%>
<%@ page import="java.io.StringReader"%>
<%@ page import="org.xml.sax.InputSource"%>
<%@ page import="org.w3c.dom.Document"%>
<%@ page import="org.w3c.dom.Element"%>
<%@ page import="org.w3c.dom.Node"%>
<%@ page import="org.w3c.dom.NodeList"%>
<%@ page import="org.w3c.dom.Text"%>
<%@ page import="org.xml.sax.SAXException"%>
<portlet:defineObjects />
<%
	String idview =(String) renderRequest.getAttribute("choose_id");
%>
		
<%
	//从后台传入的数据中获取经纬度、名称等信息
	//List<WangdianInfo> cases = (List<WangdianInfo>)(renderRequest.getAttribute("WangdianInfo"));
	//String ss1=renderRequest.getParameter("displayarea");
	String longitude[]=(String[])renderRequest.getAttribute("Lon");
	String latitude[]=(String[])renderRequest.getAttribute("Lat");
	String name[]=(String[])renderRequest.getAttribute("Info");
	if(latitude!=null)
	System.out.println(latitude.length+"latitude");
	char c[]=new char[3];
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>智慧城市大数据平台</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/datadisplay.css" />
<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
<script src="js/bplayer.js" type="text/javascript" charset="utf-8"></script>


<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=3e639f3dd74bbd489d3357f9c35530ad"></script>
<script type="text/javascript"> 
			var map;
			var mnew;
			function initialize() {  
	
			//读取xml配置文件
			   var mvid=<%=idview%>;
			   //从数据库中根据选择读取配置文件
			   <%Vizfunccfg listv=(Vizfunccfg) renderRequest.getAttribute("sub_menu");
			   System.out.println(listv==null);
			    int stulength=0;int stulength1=0;int stulength2=0;
			    String fname[]=new String[2];
			    String fcity[]=new String[2];
			    String fnamep[]=new String[2];
			    String fcityp[]=new String[2];
			    String fdb[]=new String[2];
			    //根据读取的内容获得信息
			   if(listv!=null){
				   String strv=listv.getTxmlmemo();
				   System.out.println(strv);
				   DocumentBuilderFactory factory = DocumentBuilderFactory   
		                     .newInstance();   
		             DocumentBuilder builder = factory.newDocumentBuilder();   
		             Document doc = builder   
		                     .parse(new InputSource(new StringReader(strv)));   
		  
		             Element root = doc.getDocumentElement();   
		             NodeList books = root.getChildNodes();  
				//获得标签FuncPara的相关属性信息
					  NodeList func= root.getElementsByTagName("FuncPara");
					  fname=new String[func.getLength()] ;
					  fnamep=new String[func.getLength()] ;
					  stulength=func.getLength();
					  for (int ij = 0; ij < func.getLength(); ij++) {
					   Element ss = (Element) func.item(ij);
					   fname[ij]=ss.getAttribute("Value");
					   fnamep[ij]=ss.getAttribute("Name");
					   System.out.println(fname[ij]);
					  }
				//获得标签CityPara的相关属性信息
					  NodeList city = root.getElementsByTagName("CityPara");
					  fcity=new String[city.getLength()] ;
					  fcityp=new String[city.getLength()] ;
					  stulength1=city.getLength();
					  for (int ij = 0; ij < city.getLength(); ij++) {
					   Element ss = (Element) city.item(ij);
					   fcity[ij]=ss.getAttribute("Value");
					   fcityp[ij]=ss.getAttribute("Name");
					   System.out.println(fcity[ij]);
					  }
				//获得标签DataSet的相关属性信息
					  NodeList db = root.getElementsByTagName("DataSet");
					  fdb=new String[db.getLength()] ;
					  stulength2=db.getLength();
					  for (int ij = 0; ij < db.getLength(); ij++) {
					   Element ss = (Element) db.item(ij);
					   fdb[ij]=ss.getAttribute("Table");
					   System.out.println(fdb[ij]);
					  }
			   }%>
			<%if(longitude!=null){%>
					initializegaodemap();
			<%}%>
			}  
			
			function initializegaodemap() {  
				var marker;
				var nmarker=new Array();
				//初始化地图对象，加载地图
				map = new AMap.Map("allmap",{
					resizeEnable: true,
					//二维地图显示视口
					view: new AMap.View2D({
						center:new AMap.LngLat(117.21138, 39.07877),//地图中心点
						zoom:11 //地图显示的缩放级别
					})
				});	
		
				var fso, f1, ts, con,s,all;
				var ForReading = 1;
				//声明操作文件的对象
				var rank;
				var rankvalue;
				var mlatitude;
				var mlongitude;
				var mname;
				var i=0;
				
				<%
				if(longitude!=null){
					int ii=0;
					for(ii=0;ii<longitude.length;ii++){
						if(longitude[ii]!=null&&latitude[ii]!=null){%>
						mlongitude="<%=longitude[ii]%>";
						mlatitude="<%=latitude[ii]%>";
						mname="<%=name[ii]%>";
						nmarker[i] = new AMap.Marker({				  
						icon:"http://webapi.amap.com/images/marker_sprite.png",
						position:new AMap.LngLat(mlongitude,mlatitude)
					});
						
					nmarker[i].setMap(map);
					nmarker[i++].setTitle(mname);
					<%}
					}
					}%>
			
			}
			
		</script>
</head>
<body onload="initialize()">
	
 
	<div id="base">
		<div id="lefttop">

			城市：<span><%=renderRequest.getAttribute("city")%></span><br> 机构：<span><%=renderRequest.getAttribute("user")%></span><br>
			<liferay-ui:search-container
				emptyResultsMessage="there-are-no-results" delta="6"
				var="searchContainer" curParam="current">
				<liferay-ui:search-container-results resultsVar="results"
					totalVar="total">
					<%
						
								@SuppressWarnings("unchecked")
								List<Vizfunccfg> source_menu = (List<Vizfunccfg>) renderRequest
										.getAttribute("source_menu");
								System.out.println(source_menu.size());
								String u = (String) renderRequest.getAttribute("auth");
								System.out.println(u);
								if (u != null) {
									List<Vizfunccfg> ll = new ArrayList<Vizfunccfg>();
									Iterator iii = source_menu.iterator();
									while (iii.hasNext()) {
										Vizfunccfg ddd = (Vizfunccfg) iii.next();
													 System.out.println(ddd.getId());
										if (ddd.getVorgName().contains(u)) {
											ll.add(ddd);
										}
									}
									results = ListUtil.subList(ll,
											searchContainer.getStart(),
											searchContainer.getEnd());
									System.out.println("Vizfunccfg.size = " + ll.size());
									System.out.println("results--->" + results);
									total = ll.size();
									pageContext.setAttribute("results", results);
									pageContext.setAttribute("total", total);
								} else {
									results = ListUtil.subList(source_menu,
											searchContainer.getStart(),
											searchContainer.getEnd());
									System.out.println("Vizfunccfg.size = "
											+ source_menu.size());
									System.out.println("results--->" + results);
									total = source_menu.size();
									pageContext.setAttribute("results", results);
									pageContext.setAttribute("total", total);
								}
					%>
				</liferay-ui:search-container-results>
				<liferay-ui:search-container-row
					className="cn.edu.tju.cs.smt.data.Vizfunccfg" keyProperty="id"
					modelVar="Vizfunccfg">
					<liferay-ui:search-container-column-text name="选择">
						<portlet:actionURL var="tocheck" name="tocheck">
							<portlet:param name="id"
								value="<%=Vizfunccfg.getId().toString()%>" />
								<%System.out.println("in view of datadisplay source me333333nu!");%>
								<%
								
								System.out.println(Vizfunccfg.getId().toString());
								%>
							<portlet:param name="name"
								value="<%=Vizfunccfg.getVorgName().toString()%>" />
						</portlet:actionURL>
						<liferay-ui:icon image="view" url="${tocheck}" />

					</liferay-ui:search-container-column-text>
					<liferay-ui:search-container-column-text name="组织名称"
						value="<%=Vizfunccfg.getVorgName().toString()%>" />

					<liferay-ui:search-container-column-text name="数据功能"
						value="<%=Vizfunccfg.getVfuncName().toString()%>" />
				</liferay-ui:search-container-row>
				<liferay-ui:search-iterator />
			</liferay-ui:search-container>
		</div>
		<div id="righttop">
			<div id="allmap"></div>
		</div>
		<div id="leftbot">

			<div id="lb2" style="display: block">

				<form id="form" name="form" method="post"
					action="<portlet:actionURL name="tomark"/>">
					<table>

						<tr>
							<td width="40%">显示范围：</td>
						</tr>
						<tr>
							<td width="200px"><select name="displaycity"
								style="width: 100%">
									<%
										int startedv = 0;
																																																																		for (; startedv < stulength1; startedv++) {
									%>
									<option value=<%=fcity[startedv]%>><%=fcity[startedv]%></option>
									<%
										}
									%>
							</select></td>
							</tr>
							<tr>
							<td width="200px"><select name="displayarea"
								style="width: 100%">
									<%
										startedv = 0;
																																																																		for (; startedv < stulength; startedv++) {
									%>
									<option value=<%=fnamep[startedv]%>><%=fname[startedv]%></option>
									<%
										}
									%>
							</select></td>
							</tr>
							<tr>
							<td width="200px"><select name="displaydb"
								style="width: 100%">
									<%
										startedv = 0;
																																																																		for (; startedv < stulength2; startedv++) {
									%>
									<option value=<%=fdb[startedv]%>><%=fdb[startedv]%></option>
									<%
										}
									%>
							</select></td>
						</tr>

						<tr>
							<td width="200px">
								<button id="001">确认</button>
							</td>
						
						</tr>
					</table>
				</form>
			</div>
		</div>

		<div id="rightbot">
			<%
				renderRequest.setAttribute("info","高德地图官方网站,提供全国地图浏览,地点搜索,公交驾车查询服务。可同时查看商家团购、优惠信息。高德地图,您的出行、生活好帮手。");
			%>
			<span style="width: 100%; text-align: left; display: block;"><p>
					&nbsp;&nbsp;&nbsp;&nbsp;<%=renderRequest.getAttribute("info")%></p></span>
		</div>
	</div>
	<!--
	<portlet:actionURL var="muser" name="muser">
		<portlet:param name="jspPage" value="/html/datadisplay/denglu.jsp" />
	</portlet:actionURL>
	<form name="form_query" id="form_query" method="post"
		action="<%=muser%>">
		<button type="submit">登录</button>
	</form>
	-->
</body>
</html>