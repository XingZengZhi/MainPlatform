package edu.gznc.cxcyzx.web.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.gznc.cxcyzx.domain.Classify;
import edu.gznc.cxcyzx.domain.equipment;
import edu.gznc.cxcyzx.service.ClassService;
import edu.gznc.cxcyzx.service.EqService;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Controller
@Scope("prototype")
public class ClassAction extends ActionSupport implements ModelDriven<Classify> {
	private static final long serialVersionUID = 1L;
	private Classify classify = new Classify();
	@Override
	public Classify getModel() {
		return classify;
	}
	@Autowired
	private EqService eqService;
	@Autowired
	private ClassService classService;
	
	public String FindClassify() throws IOException{
		String eq_id = ServletActionContext.getRequest().getParameter("eq_id");
		String[] eqs = eq_id.split(",");//设备编号数组
		List<String> lists = new ArrayList<String>();
		for(int i = 0;i<eqs.length;i++){
			equipment eq = eqService.FindEqById(Long.valueOf(eqs[i]));
			lists.add(eq.getClassify().getClass_name());//返回设备类型
		}
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		String json = JSONArray.fromObject(lists).toString();
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
}
