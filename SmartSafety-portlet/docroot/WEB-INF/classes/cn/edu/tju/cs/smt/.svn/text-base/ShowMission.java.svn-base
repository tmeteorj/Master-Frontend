package cn.edu.tju.cs.smt;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

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

import cn.edu.tju.cs.smt.data.Mission;
import cn.edu.tju.cs.smt.util.Config;

import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class ShowMission
 */
public class ShowMission extends MVCPortlet {
	public boolean showmap=false;
	public int k=0;
	public List<String> loc=new ArrayList<String>();
	public void render(RenderRequest request,
			RenderResponse response) throws PortletException, IOException {
		ClientConfig config = new ClientConfig();
		config.register(JacksonFeature.class);
		Client client = ClientBuilder.newClient(config);
		WebTarget target = client.target(Config.serverPath + Config.projectName
				+ "/rest/main/getallmissionbyid");

		GenericType<List<Mission>> genericType = new GenericType<List<Mission>>() {
		};
		Form form = new Form();
		form.param("id", "1");
		Builder b = target.request(MediaType.APPLICATION_JSON_TYPE);
		List<Mission> ans=b.accept(MediaType.APPLICATION_JSON).post(
				Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED),
				genericType);

		request.setAttribute("loc", loc);
		request.setAttribute("ans", ans);
		request.setAttribute("k", k);
		request.setAttribute("showmap", showmap);
		super.render(request, response);
	}
	public void toedit(ActionRequest renderRequest,
			ActionResponse renderResponse) throws IOException, PortletException {
		k=0;
		showmap=true;
		ClientConfig config = new ClientConfig();
		config.register(JacksonFeature.class);
		Client client = ClientBuilder.newClient(config);
		WebTarget target = client.target(Config.serverPath + Config.projectName
				+ "/rest/main/getmissionbyid");

		GenericType<Mission> genericType = new GenericType<Mission>() {
		};
		Form form = new Form();
		form.param("id", ParamUtil.getString(renderRequest, "id"));
		Builder b = target.request(MediaType.APPLICATION_JSON_TYPE);
		Mission m=b.accept(MediaType.APPLICATION_JSON).post(
				Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED),
				genericType);

		File file=new File("D:\\algorithms\\output\\"+m.getOutputLoc());  
		List<String> temLoc=new ArrayList<String>();
		if(file.exists()){
			BufferedReader reader = null;
			try {
				reader = new BufferedReader(new FileReader(file));
				String tempString = null;
				while ((tempString = reader.readLine()) != null) {
					try {
						temLoc.add(tempString);
						String temLocs[]=tempString.split(",");
						k=Math.max(k, Integer.valueOf(temLocs[temLocs.length-1]));
						
					} catch (Exception o) {
						System.out.println("Oh my god!" + tempString
								+ "has a wrong.");
						o.printStackTrace();
					}
				}
				reader.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			k++;
			/*
			Random rd=new Random();
			int size=Math.min(1000, temLoc.size());
			Map<Integer,Boolean> set=new HashMap<Integer,Boolean>();
			int j;
			for(int i=0;i<size;i++){
				j=rd.nextInt(size);
				if(set.containsKey(j)){
					
				}
				else{
					set.put(j, true);
					loc.add(temLoc.get(j));
				}
			}*/
			loc=temLoc;
		}
		System.out.println(renderRequest.getParameter("id"));

	}
	
}
