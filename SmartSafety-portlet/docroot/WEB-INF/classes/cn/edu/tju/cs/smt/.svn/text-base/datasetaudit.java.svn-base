package cn.edu.tju.cs.smt;

import java.io.IOException;
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

import org.glassfish.jersey.client.ClientConfig;
import org.glassfish.jersey.jackson.JacksonFeature;

import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;
import cn.edu.tju.cs.smt.util.*;
import cn.edu.tju.cs.smt.data.*;

/**
 * Portlet implementation class datasetaudit
 */
public class datasetaudit extends MVCPortlet {
	
	List<DataSet> dataSetsT;
	List<DataSet> dataSetsF;
	
	public void render(RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException, IOException
	{
		System.out.print("In datasetaudit.render");
		if (renderRequest.getParameter("jspPage") == null ) {
			getAllDataSets(renderRequest);
			getAllNotAudited(renderRequest);
			System.out.println(".getAll*");
		}
		else
		{
			System.out.println(".*action");
			if(renderRequest.getParameter("action") != null && renderRequest.getParameter("action").equals("edit"))
				this.toedit(renderRequest);
			else if(renderRequest.getParameter("action") != null && renderRequest.getParameter("action").equals("delete"))
			{
				this.todelete(renderRequest);
				getAllDataSets(renderRequest);
				getAllNotAudited(renderRequest);
			}
			else if(renderRequest.getParameter("action") != null && renderRequest.getParameter("action").equals("deletes"))
			{
				this.todeletes(renderRequest);
				getAllDataSets(renderRequest);
				getAllNotAudited(renderRequest);
			}
		}
		super.render(renderRequest, renderResponse);
	}
	/**
	 * @author:lxy
	 * @function:调用webservice拉取所有的数据集信息
	 */
	public void getAllDataSets(RenderRequest renderRequest) {
		ClientConfig config=new ClientConfig();
		config.register(JacksonFeature.class);
		Client client=ClientBuilder.newClient(config);

		WebTarget target=client.target(Config.serverPath+"/smartsafety/rest/main/getAllDataSets");

		GenericType<List<DataSet>> genericType = new GenericType<List<DataSet>>(){};
		Form form=new Form();

		dataSetsT = target.request(MediaType.APPLICATION_JSON_TYPE)
				.accept(MediaType.APPLICATION_JSON)
				.post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), genericType);

		renderRequest.setAttribute("dsT", dataSetsT);
	}
	/**
	 * @author lhd
	 * @function 获取所有待审核的数据集信息
	 * @param renderRequest
	 */
	public void getAllNotAudited(RenderRequest renderRequest) {
		ClientConfig config=new ClientConfig();
		config.register(JacksonFeature.class);
		Client client=ClientBuilder.newClient(config);

		WebTarget target=client.target(Config.serverPath+"/smartsafety/rest/main/getAllNotAudited");

		GenericType<List<DataSet>> genericType = new GenericType<List<DataSet>>(){};
		Form form=new Form();

		dataSetsF = target.request(MediaType.APPLICATION_JSON_TYPE)
				.accept(MediaType.APPLICATION_JSON)
				.post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), genericType);

		renderRequest.setAttribute("dsF", dataSetsF);
	}
	public void toedit(RenderRequest renderRequest)
	{
		System.out.println("In datasetaudit.toedit");
		String dsId = ParamUtil.getString(renderRequest, "datasetId");
		for(DataSet ds : dataSetsT)
		{
			if(ds.getPkId().toString().equals(dsId))
			{
				renderRequest.setAttribute("specificDs", ds);
				System.out.println("INFO:\ttitle = "+ds.getTitle());
				return;
			}
		}
		for(DataSet ds : dataSetsF)
		{
			if(ds.getPkId().toString().equals(dsId))
			{
				renderRequest.setAttribute("specificDs", ds);
				System.out.println("INFO:\ttitle = "+ds.getTitle());
				return;
			}
		}
	}
	public void toupdate(ActionRequest actionRequest, ActionResponse actionResponse)
	{
		String title = actionRequest.getParameter("title");
		String datadescription = actionRequest.getParameter("datadescription");
		String datasource = actionRequest.getParameter("datasource");
		String publisher = actionRequest.getParameter("publisher");
		String pubtime = actionRequest.getParameter("pubtime");
		String type = actionRequest.getParameter("type");
		String datasizeval = actionRequest.getParameter("datasizeval");
		String datasizetype = actionRequest.getParameter("datasizetype");
		String price = actionRequest.getParameter("price");

		System.out.println("In datasetaudit.toupdate: title="+title);
		/*
		Form form=new Form();
		form.param("title", title);
		form.param("datadescription", datadescription);
		form.param("datasource", datasource);
		form.param("type", type);
		form.param("datasizeval", datasizeval);
		form.param("datasizetype", datasizetype);
		form.param("price", price);
		
		ClientConfig config = new ClientConfig();
		config.register(JacksonFeature.class);
		Client client = ClientBuilder.newClient(config);
		
		WebTarget target = client.target(Config.backPortNo+"/smartsafety/rest/main/createNewDataSet");
		
		boolean b=target.request(MediaType.APPLICATION_JSON_TYPE)
				.accept(MediaType.APPLICATION_JSON)
				.post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), boolean.class);
		
		if(b)
			System.out.println("INFO:\tnew DataSet "+title+" has been created.");
		else
			System.out.println("INFO:\tnew DataSet "+title+" has NOT been created.");
			*/
	}
	public void todelete(RenderRequest renderRequest) {
		String dsId = ParamUtil.getString(renderRequest, "datasetId");
		System.out.println("In datasetaudit.todelete: prepare to delete dataSetID = "+dsId + " ...");

		delete(dsId);
	}
	public void todeletes(RenderRequest renderRequest) {
		String ids = renderRequest.getParameter("ids");
		if(ids==null)
		{
			ids = renderRequest.getParameter("audDelId");
		}
		System.out.println("In datasetaudit.todeletes: prepare to delete all these dataSetIDs = "+ids + " ...");
		
		delete(ids);
	}
	public void delete(String ids)
	{
		ClientConfig config=new ClientConfig();
		config.register(JacksonFeature.class);
		Client client=ClientBuilder.newClient(config);

		WebTarget target=client.target(Config.serverPath+"/smartsafety/rest/main/deleteMulDataSets");

		Form form=new Form();
		form.param("ids", ids);

		boolean b = target.request(MediaType.APPLICATION_JSON_TYPE)
				.accept(MediaType.APPLICATION_JSON)
				.post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), boolean.class);
		
		if(b)
			System.out.println("INFO:\tthose DataSets \""+ids+"\" has been deleted.");
		else
			System.out.println("INFO:\tthose DataSets \""+ids+"\" has NOT been deleted.");
	}
}
