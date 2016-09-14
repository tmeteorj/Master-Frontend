package cn.edu.tju.cs.smt;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Form;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;

import java.sql.SQLException;
import javax.ws.rs.client.Invocation.Builder;
import org.glassfish.jersey.client.ClientConfig;
import org.glassfish.jersey.jackson.JacksonFeature;

import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;
import cn.edu.tju.cs.smt.util.*;
import cn.edu.tju.cs.smt.data.*;

/**
 * Portlet implementation class datadisplay
 */
public class datadisplay extends MVCPortlet {
	/**
	 * @author lx
	 * @function 此函数仅作为过度函数，目的在于获取登陆用户的基本信息，以实现对不同用户展示不同功能。鉴于登陆注册并未实现，
	 * 于是暂时直接设置为简单赋值函数,等登陆注册实现后，再进行整改
	 * @param renderRequest
	 * @param renderResponse
	 * @throws PortletException
	 * @throws IOException
	 */
	String ss1=new String();
	String sscity=new String();
	String ssfunc=new String();
	private void initUserInfo(RenderRequest renderRequest,
			RenderResponse renderResponse) throws PortletException, IOException{
		renderRequest.setAttribute("city","天津市");
		renderRequest.setAttribute("user","超级管理员");
	}
	/**
	 * @author:LZ
	 * @function:此函数主要完成从Vizfunccfg的数据库中读取数据，然后输出.
	 * @loc:此函数链接后台的位置是/main/getAllVizfunccfg (non-Javadoc)
	 * @see javax.portlet.GenericPortlet#render(javax.portlet.RenderRequest,
	 *      javax.portlet.RenderResponse)
	 **/
	public void render(RenderRequest renderRequest,
			RenderResponse renderResponse) throws PortletException, IOException {
		
		initUserInfo(renderRequest,renderResponse);
		
		ClientConfig config = new ClientConfig();
		config.register(JacksonFeature.class);
		Client client = ClientBuilder.newClient(config);
		WebTarget target = client.target(Config.serverPath + Config.projectName
				+ "/rest/main/getAllVizfunccfg");
		System.out.println(Config.serverPath + Config.projectName
				+ "/rest/main/getAllVizfunccfg");
		GenericType<List<Vizfunccfg>> genericType = new GenericType<List<Vizfunccfg>>() {
		};
		Form form = new Form();
		
		String user = (String) renderRequest.getAttribute("user");
		System.out.println("user->"+user);
		form.param("user", user);
		List<Vizfunccfg> b = target
				.request(MediaType.APPLICATION_JSON_TYPE)
				.accept(MediaType.APPLICATION_JSON)
				.post(Entity
						.entity(form, MediaType.APPLICATION_FORM_URLENCODED),
						genericType);
		System.out.println("displaydatamenusource.size = " + b.size());
		for(Iterator<Vizfunccfg> it=b.iterator();it.hasNext();){
			Vizfunccfg item=it.next();
			System.out.println(item.getId()+",");
			}
		renderRequest.setAttribute("source_menu", b);
	
		super.render(renderRequest, renderResponse);
		
	}

	/**
	 * @author:LZ
	 * @function:选出功能菜单
	 * @loc:此函数链接后台的位置是/main/getVizfunccfgbyId (non-Javadoc)
	 * @see javax.portlet.GenericPortlet#render(javax.portlet.RenderRequest,
	 *      javax.portlet.RenderResponse)
	 **/
	public void tocheck(ActionRequest renderRequest,
			ActionResponse renderResponse) throws PortletException, IOException {
		System.out.println("In DataDisplay tocheck");
		ClientConfig config = new ClientConfig();
		config.register(JacksonFeature.class);
		Client client = ClientBuilder.newClient(config);
		String id = ParamUtil.getString(renderRequest, "id");
		WebTarget target = client.target(Config.serverPath + Config.projectName
				+ "/rest/main/getVizfunccfgbyId/"+id);
		
		GenericType<Vizfunccfg> genericType = new GenericType<Vizfunccfg>() {
		};
		Form form = new Form();
		String name = ParamUtil.getString(renderRequest, "name");
		System.out.println(id);
		form.param("id", id);
		Vizfunccfg b = target
				.request(MediaType.APPLICATION_JSON_TYPE)
				.accept(MediaType.APPLICATION_JSON)
				.post(Entity
						.entity(form, MediaType.APPLICATION_FORM_URLENCODED),
						genericType);
		System.out.println("displaydatamenusub.size = " );
	
		renderRequest.setAttribute("sub_menu", b);
		renderRequest.setAttribute("choose_name", name);
		renderRequest.setAttribute("choose_id", id.toString());
	}
	/**
	 * @author:LX
	 * @function:选出功能菜单
	 * @loc:此函数链接后台的位置是/main/displaydatamenusub (non-Javadoc)
	 * @see javax.portlet.GenericPortlet#render(javax.portlet.RenderRequest,
	 *      javax.portlet.RenderResponse)
	 **/
	public void tosubmit(ActionRequest renderRequest,
			ActionResponse renderResponse) throws PortletException, IOException {
		System.out.println("In DataDisplay tosubmit");
		
	}
	/**
	 * @author:LZ
	 * @function:标记天津农商银行网点
	 * @loc:此函数链接后台的位置是/main/wangdian_queryall (non-Javadoc)
	 * @see javax.portlet.GenericPortlet#render(javax.portlet.RenderRequest,
	 *      javax.portlet.RenderResponse)
	 **/
	public void mark(RenderRequest renderRequest,RenderResponse response) throws SQLException, PortletException, IOException {

		ClientConfig config=new ClientConfig();
		config.register(JacksonFeature.class);
		Client client=ClientBuilder.newClient(config);
		WebTarget target=client.target(Config.serverPath + Config.projectName+"/rest/main/wangdian_queryall");
		
		GenericType<List<WangdianInfo>> genericType = new GenericType<List<WangdianInfo>>(){};
		
		Form form=new Form();
		form.param("id", renderRequest.getParameter("id"));
		Builder b=target.request(MediaType.APPLICATION_JSON_TYPE);
		List<WangdianInfo> temp = b
				.accept(MediaType.APPLICATION_JSON)
			    .post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), genericType);

		
		renderRequest.setAttribute("WangdianInfo", temp);
	}
	/**
	 * @author:LZ
	 * @function:从数据库的表中获得经纬度等相关信息
	 * @loc:此函数链接后台的位置根据浏览器页面中获得参数值决定，详见以下三个函数(non-Javadoc)
	 * @see javax.portlet.GenericPortlet#render(javax.portlet.RenderRequest,
	 *      javax.portlet.RenderResponse)
	 **/
	public void tomark(ActionRequest renderRequest,ActionResponse response) throws SQLException, PortletException, IOException {
		ss1=(String)renderRequest.getParameter("displaydb");
		sscity=(String)renderRequest.getParameter("displaycity");
		ssfunc=(String)renderRequest.getParameter("displayarea");
		System.out.println(ss1+"			"+"ss1");
		togetLat(renderRequest, response);
		togetLon(renderRequest, response);
		togetInfo(renderRequest, response);
	}
	/**
	 * @author:LZ
	 * @function:从数据库的表中获得经纬度等相关信息
	 * @loc:此函数链接后台的位置根据浏览器页面中获得参数值决定，形式：main/getAll_"+表名+城市名+显示功能名(non-Javadoc)
	 * @see javax.portlet.GenericPortlet#render(javax.portlet.RenderRequest,
	 *      javax.portlet.RenderResponse)
	 **/
	public void togetInfo(ActionRequest renderRequest,ActionResponse response) throws SQLException, PortletException, IOException {
	//ss1="WangdianInfo";
		//System.out.println(ss1);
		ClientConfig config=new ClientConfig();
		config.register(JacksonFeature.class);
		Client client=ClientBuilder.newClient(config);
		WebTarget target=client.target(Config.serverPath + Config.projectName+"/rest/main/getAll_"+ss1+"Tianjin"+ssfunc+"/"+sscity);
		GenericType<String[]> genericType = new GenericType<String[]>(){};
		Form form=new Form();
		form.param("city", sscity);
		Builder b=target.request(MediaType.APPLICATION_JSON_TYPE);
		String[] temp = b
				.accept(MediaType.APPLICATION_JSON)
			    .post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), genericType);
		renderRequest.setAttribute("Info", temp);
	}
/**
 * @author:LZ
 * @function:从数据库的表中获得经纬度等相关信息
 * @loc:此函数链接后台的位置根据浏览器页面中获得参数值决定，形式：main/getAll_"+表名+"Lat"+城市名+显示功能名(non-Javadoc)
 * @see javax.portlet.GenericPortlet#render(javax.portlet.RenderRequest,
 *      javax.portlet.RenderResponse)
 **/
	public void togetLat(ActionRequest renderRequest,ActionResponse response) throws SQLException, PortletException, IOException {
		
		ClientConfig config=new ClientConfig();
		config.register(JacksonFeature.class);
		Client client=ClientBuilder.newClient(config);
		WebTarget target=client.target(Config.serverPath + Config.projectName+"/rest/main/getAll_"+ss1+"Lat"+"Tianjin"+ssfunc+"/"+sscity);
		
		GenericType<String[]> genericType = new GenericType<String[]>(){};
		
		Form form=new Form();
		form.param("city", sscity);
		Builder b=target.request(MediaType.APPLICATION_JSON_TYPE);
		String[] temp = b
				.accept(MediaType.APPLICATION_JSON)
			    .post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), genericType);

		
		renderRequest.setAttribute("Lat", temp);
	}
	/**
	 * @author:LZ
	 * @function:从数据库的表中获得经纬度等相关信息
	 * @loc:此函数链接后台的位置根据浏览器页面中获得参数值决定，形式：main/getAll_"+表名+"Lon"+城市名+显示功能名(non-Javadoc)
	 * @see javax.portlet.GenericPortlet#render(javax.portlet.RenderRequest,
	 *      javax.portlet.RenderResponse)
	 **/
	public void togetLon(ActionRequest renderRequest,ActionResponse response) throws SQLException, PortletException, IOException {
		//ss1="WangdianInfo";
		//System.out.println(ss1);
		ClientConfig config=new ClientConfig();
		config.register(JacksonFeature.class);
		Client client=ClientBuilder.newClient(config);
		WebTarget target=client.target(Config.serverPath + Config.projectName+"/rest/main/getAll_"+ss1+"Lon"+"Tianjin"+ssfunc+"/"+sscity);
		
		GenericType<String[]> genericType = new GenericType<String[]>(){};
		
		Form form=new Form();
		form.param("city", sscity);
		Builder b=target.request(MediaType.APPLICATION_JSON_TYPE);
		String[] temp = b
				.accept(MediaType.APPLICATION_JSON)
			    .post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), genericType);

		
		renderRequest.setAttribute("Lon", temp);
	}
	public void mark1(ActionRequest renderRequest,ActionResponse response) throws SQLException, PortletException, IOException {

		ClientConfig config=new ClientConfig();
		config.register(JacksonFeature.class);
		Client client=ClientBuilder.newClient(config);
		WebTarget target=client.target(Config.serverPath + Config.projectName+"/rest/main/wangdian_queryall");
		
		GenericType<List<WangdianInfo>> genericType = new GenericType<List<WangdianInfo>>(){};
		
		Form form=new Form();
		form.param("id", renderRequest.getParameter("id"));
		Builder b=target.request(MediaType.APPLICATION_JSON_TYPE);
		List<WangdianInfo> temp = b
				.accept(MediaType.APPLICATION_JSON)
			    .post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), genericType);

		
		renderRequest.setAttribute("WangdianInfo", temp);
	}
	public void markcases(ActionRequest renderRequest,ActionResponse response) throws SQLException, PortletException, IOException {

		ClientConfig config=new ClientConfig();
		config.register(JacksonFeature.class);
		Client client=ClientBuilder.newClient(config);
		WebTarget target=client.target(Config.serverPath + Config.projectName+"/rest/main/getcaseall");
		
		GenericType<List<Cases>> genericType = new GenericType<List<Cases>>(){};
		
		Form form=new Form();
		form.param("id", renderRequest.getParameter("id"));
		Builder b=target.request(MediaType.APPLICATION_JSON_TYPE);
		List<Cases> temp = b
				.accept(MediaType.APPLICATION_JSON)
			    .post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), genericType);

		
		renderRequest.setAttribute("Cases", temp);
	}
	public void muser(ActionRequest renderRequest,ActionResponse response) throws SQLException, PortletException, IOException {
	
	}
	public void markuser(ActionRequest renderRequest,ActionResponse response) throws SQLException, PortletException, IOException {
		
		String name = (String)renderRequest.getParameter("userName");
		//String name = (String)renderRequest.getPortletSession().getAttribute("userName");
		System.out.println(name);
		String password = (String)renderRequest.getParameter("password");
		System.out.println(password);
		System.out.println("In DataDisplay markuser");
		ClientConfig config = new ClientConfig();
		config.register(JacksonFeature.class);
		Client client = ClientBuilder.newClient(config);
		WebTarget target = client.target(Config.serverPath + Config.projectName
				+ "/rest/main/getUser/"+name+"/"+password);
		
		GenericType<User> genericType = new GenericType<User>() {
		};
		Form form = new Form();
		//form.param("list", searchlist);
		// 得到从数据库得到的表
		User b = target
				.request(MediaType.APPLICATION_JSON_TYPE)
				.accept(MediaType.APPLICATION_JSON)
				.post(Entity
						.entity(form, MediaType.APPLICATION_FORM_URLENCODED),
						genericType);
		if(b!=null){
			System.out.println( b.getAuthority());
			renderRequest.setAttribute("auth", b.getAuthority());
		}
	}
}
