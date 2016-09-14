package cn.edu.tju.cs.smt;

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

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import org.glassfish.jersey.client.ClientConfig;
import org.glassfish.jersey.jackson.JacksonFeature;

import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

import cn.edu.tju.cs.smt.util.*;
import cn.edu.tju.cs.smt.data.*;

/**
 * Portlet implementation class datasetdsip
 */
public class datasetdisp extends MVCPortlet {
	@Override
	public void render(RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException, IOException{
		if (renderRequest.getParameter("jspPage") == null ) {
			System.out.println("datadisp.jsp first launch");
			getAllDataSets(renderRequest);
		} else {
			System.out.println("datadisp.jsp launched");
			//列表显示查询结果
			if(renderRequest.getParameter("searchres")!=null) {
				tosearch(renderRequest);
				//查询数据集具体信息
			} else if(renderRequest.getParameter("datasetId")!=null) {
				toview(renderRequest);
				getTableInfo(renderRequest);
			}
		}
		super.render(renderRequest, renderResponse);
	}
	/**
	 * @author:lxy
	 * @function:调用webservice拉取所有的数据集信息
	 */
	public void getAllDataSets(RenderRequest renderRequest) {
		System.out.println("in");
		ClientConfig config=new ClientConfig();
		config.register(JacksonFeature.class);
		Client client=ClientBuilder.newClient(config);

		WebTarget target=client.target(Config.serverPath+"/smartsafety/rest/main/getAllDataSets");

		GenericType<List<DataSet>> genericType = new GenericType<List<DataSet>>(){};
		Form form=new Form();

		List<DataSet> ds = target.request(MediaType.APPLICATION_JSON_TYPE)
				.accept(MediaType.APPLICATION_JSON)
				.post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), genericType);

		renderRequest.setAttribute("DataSet", ds);
		System.out.println(ds);
	}

	/**
	 * @author lxy
	 * @function 跳转到搜索结果页
	 * @param renderRequest
	 * @param renderResponse
	 * @throws IOException
	 * @throws PortletException
	 */
	public void tosearch(RenderRequest renderRequest)
			throws IOException, PortletException {

		String kw = ParamUtil.getString(renderRequest, "keyword");
		kw = URLEncoder.encode(kw, "UTF-8");
		System.out.println("In tosearch: kw="+kw);

		ClientConfig config=new ClientConfig();
		config.register(JacksonFeature.class);
		Client client=ClientBuilder.newClient(config);

		WebTarget target=client.target(Config.serverPath+"/smartsafety/rest/main/searchDataSets?kw="+kw);

		GenericType<List<DataSet>> genericType = new GenericType<List<DataSet>>(){};
		Form form=new Form();

		List<DataSet> ds = target.request(MediaType.APPLICATION_JSON_TYPE)
				.accept(MediaType.APPLICATION_JSON)
				.post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), genericType);

		renderRequest.setAttribute("DataSet", ds);
		System.out.println("in tosearch listlength:"+ds.size());
	}
	/**
	 * @author lxy
	 * @function 获取一条数据集具体信息
	 */
	public void toview(RenderRequest renderRequest) {

		String dsId = ParamUtil.getString(renderRequest, "datasetId");
		System.out.println(dsId);
		ClientConfig config=new ClientConfig();
		config.register(JacksonFeature.class);
		Client client=ClientBuilder.newClient(config);

		WebTarget target=client.target(Config.serverPath+"/smartsafety/rest/main/getDataSetById?id="+dsId);

		GenericType<DataSet> genericType = new GenericType<DataSet>(){};
		Form form=new Form();

		DataSet ds = target.request(MediaType.APPLICATION_JSON_TYPE)
				.accept(MediaType.APPLICATION_JSON)
				.post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), genericType);

		renderRequest.setAttribute("DataSet", ds);
		System.out.println(dsId+" "+ds.getTitle());
	}
	/**
	 * @author lxy
	 * @function 数据集信息
	 */
	public void getTableInfo(RenderRequest renderRequest) {
		System.out.println("in =");

		ClientConfig config=new ClientConfig();
		config.register(JacksonFeature.class);
		Client client=ClientBuilder.newClient(config);

		WebTarget target=client.target(Config.serverPath+"/smartsafety/rest/main/viewWangdianInfo");

		GenericType<List<WangdianInfo>> genericType = new GenericType<List<WangdianInfo>>(){};
		Form form=new Form();
		List<WangdianInfo> lst = target.request(MediaType.APPLICATION_JSON_TYPE)
				.accept(MediaType.APPLICATION_JSON)
				.post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), genericType);
		List<String> strl = new ArrayList<String>();
		for(int i = 0; i<lst.size(); i++) {
			String str = "";
			str += lst.get(i).getName().replace("#", "") + "#";
			str += lst.get(i).getAddress().replace("#", "") + "#";
			if(lst.get(i).getLnglat().split(",").length==2){
				str += lst.get(i).getLnglat().split(",")[1]+","+lst.get(i).getLnglat().split(",")[0]+ "#";
			} else {
				str += "NaN,NaN#";
			}
			str += lst.get(i).getRank() + "#";
			str += lst.get(i).getRankresult().toString().replace("#", "");
			strl.add(str);
		}
		TableViewRowCol col1 = new TableViewRowCol("名称", false, false, false,false);
		TableViewRowCol col2 = new TableViewRowCol("地址", false, false, false,false);
		TableViewRowCol col3 = new TableViewRowCol("经纬度", true, false, false,false);
		TableViewRowCol col4 = new TableViewRowCol("排序", false, true, true,true);
		TableViewRowCol col5 = new TableViewRowCol("排序结果", false, true, true,true);
		TableViewRowCol[] tbTitle = {col1,col2,col3,col4,col5};
		
		renderRequest.setAttribute("TableView", strl);
		renderRequest.setAttribute("TableTitle", tbTitle);
	}
}
