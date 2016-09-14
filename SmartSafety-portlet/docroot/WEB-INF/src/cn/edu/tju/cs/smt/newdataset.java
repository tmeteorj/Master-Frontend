package cn.edu.tju.cs.smt;

import java.io.File;
import java.io.IOException;
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
import javax.ws.rs.core.MediaType;

import org.glassfish.jersey.client.ClientConfig;
import org.glassfish.jersey.jackson.JacksonFeature;

import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.FileUtil;
import com.liferay.portal.util.PortalUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

import cn.edu.tju.cs.smt.util.*;

/**
 * Portlet implementation class newdataset
 * @param <ModelAndView>
 */
public class newdataset<ModelAndView> extends MVCPortlet {
	@Override
	public void render(RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException, IOException
	{
		super.render(renderRequest, renderResponse);
	}
	public void toupload(ActionRequest actionRequest, ActionResponse actionResponse)
	{
		String title = actionRequest.getParameter("title");
		String datadescription = actionRequest.getParameter("datadescription");
		String datasource = actionRequest.getParameter("datasource");
		String type = actionRequest.getParameter("type");
		String datasizeval = actionRequest.getParameter("datasizeval");
		String datasizetype = actionRequest.getParameter("datasizetype");
		String price = actionRequest.getParameter("price");
		String publisher = actionRequest.getParameter("publisher");

		System.out.println("In toupload: title="+title+" publisher="+publisher);
		
		Form form=new Form();
		form.param("title", title);
		form.param("datadescription", datadescription);
		form.param("datasource", datasource);
		form.param("type", type);
		form.param("datasizeval", datasizeval);
		form.param("datasizetype", datasizetype);
		form.param("price", price);
		form.param("publisher", publisher);
		
		ClientConfig config = new ClientConfig();
		config.register(JacksonFeature.class);
		Client client = ClientBuilder.newClient(config);
		
		WebTarget target = client.target(Config.serverPath+"/smartsafety/rest/main/createNewDataSet");
		
		boolean b=target.request(MediaType.APPLICATION_JSON_TYPE)
				.accept(MediaType.APPLICATION_JSON)
				.post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED), boolean.class);
		
		if(b)
			System.out.println("INFO:\tnew DataSet \""+title+"\" has been created.");
		else
			System.out.println("INFO:\tnew DataSet \""+title+"\" has NOT been created.");
	}

	public void touploadfile(ActionRequest actionRequest, ActionResponse actionResponse) throws IOException
	{
		System.out.println("actionRequest touploadfile");
		UploadPortletRequest uploadRequest = PortalUtil.getUploadPortletRequest(actionRequest);
		String fileName = uploadRequest.getFileName("fileName");
		System.out.println(fileName);
		File file = uploadRequest.getFile("fileName");
		System.out.println(FileUtil.read(file, true));
	}
}
