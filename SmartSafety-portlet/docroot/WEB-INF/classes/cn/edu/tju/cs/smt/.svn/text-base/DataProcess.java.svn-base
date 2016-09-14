package cn.edu.tju.cs.smt;

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
import javax.ws.rs.client.Invocation.Builder;
import javax.ws.rs.core.Form;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;

import org.glassfish.jersey.client.ClientConfig;
import org.glassfish.jersey.jackson.JacksonFeature;

import cn.edu.tju.cs.smt.util.Config;

import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

public class DataProcess extends MVCPortlet {
	String state="1";
	public void render(RenderRequest request,
			RenderResponse response) throws PortletException, IOException {
	/*	if (request.getParameter("jspPage") != null) {
			System.out.println("**************jspPage="
					+ request.getParameter("jspPage"));
		}

		request.getParameter("jspPage");
		*/
		request.setAttribute("state", state);
		super.render(request, response);
	}

	public void tosubmit(ActionRequest request, ActionResponse response)
			throws PortletException, IOException {
				System.out.println("In DataProcessPre tosubmit");
		ClientConfig config = new ClientConfig();
		config.register(JacksonFeature.class);
		Client client = ClientBuilder.newClient(config);
		WebTarget target = client.target(Config.serverPath + Config.projectName
				+ "/rest/main/displaycaseslockmoutline");

		GenericType<Boolean> genericType = new GenericType<Boolean>() {
		};
		Form form = new Form();

		String vk = ParamUtil.getString(request, "vk");
		String vmaxi = ParamUtil.getString(request, "vmaxi");
		if(vk.equals("")||vmaxi.equals("")){
			//state="2";
		}
		else{
			form.param("para", vk + "~" + vmaxi);
			form.param("data", " ");
			Builder b = target.request(MediaType.APPLICATION_JSON_TYPE);
			Boolean ans=b.accept(MediaType.APPLICATION_JSON).post(
					Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED),
					genericType);
			if(ans){
				state="3";
			}
			else{
				state="2";
			}
		}

	}
}
