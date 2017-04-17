package edu.gznc.cxcyzx.web.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.gznc.cxcyzx.domain.Classify;
import edu.gznc.cxcyzx.domain.User;
import edu.gznc.cxcyzx.domain.equipment;
import edu.gznc.cxcyzx.service.ClassService;
import edu.gznc.cxcyzx.service.EqService;
import edu.gznc.cxcyzx.service.UserService;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Controller
@Scope("prototype")
public class EqAction extends ActionSupport implements ModelDriven<equipment> {
	private static final long serialVersionUID = 1L;
	private equipment eq = new equipment();

	@Override
	public equipment getModel() {
		return eq;
	}

	@Autowired
	private EqService eqService;

	@Autowired
	private UserService userService;

	@Autowired
	private ClassService classService;

	// 保存一条报修的信息
	public String SaveEq() throws IOException {
		String classIndex = ServletActionContext.getRequest().getParameter("FixIndex");
		String eqName = ServletActionContext.getRequest().getParameter("eqName");
		String eqSpace = ServletActionContext.getRequest().getParameter("eqSpace");
		String eqMessage = ServletActionContext.getRequest().getParameter("eqMessage");
		String username = ServletActionContext.getRequest().getParameter("username");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String dateTime = sdf.format(date);
		System.out.println(classIndex);
		eq.setEq_name(eqName);
		eq.setEq_space(eqSpace);
		eq.setEq_message(eqMessage);
		eq.setEq_fixtime(dateTime);
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		try {
			if(eqName == "" || eqSpace == "" || eqMessage == ""){
				ServletActionContext.getResponse().getWriter().print("请填写完整的信息！");
				return NONE;
			}
			if (username == "") {
				ServletActionContext.getResponse().getWriter().print("请先登录！");
				return NONE;
			}
			if (eqService.FindEquipmentByName(eq) != null) {
				ServletActionContext.getResponse().getWriter().print("不能重复添加！");
			} else {
				Classify classify = classService.FindClassById(Long.valueOf(classIndex));
				User user = new User();
				user.setUname(username);
				User u = userService.FindUserByName(user);
				eq.setUser(u);// 添加报修人员
				eq.setClassify(classify);// 添加维修类别
				eq.setEq_sta(2);// 2表示正在维修
				eqService.SaveEquipment(eq);// 新增报修的设备
				ServletActionContext.getResponse().getWriter().print("申请报修成功！");
			}

		} catch (Exception e) {
			ServletActionContext.getResponse().getWriter().print("提交失败！");
			e.printStackTrace();
		}

		return NONE;
	}

	public String FindEquipment() throws IOException {
		String userid = ServletActionContext.getRequest().getParameter("userid");
		String pageSize = ServletActionContext.getRequest().getParameter("pageSize");
		String pageIndex = ServletActionContext.getRequest().getParameter("pageIndex");
		Integer size = Integer.valueOf(pageSize);
		Integer index = Integer.valueOf(pageIndex);
		DetachedCriteria dc = DetachedCriteria.forClass(equipment.class);
		// 总数量
		double eqCount = eqService.EquipmentCount(dc, userService.FindUserByid(Long.valueOf(userid)));
		// 一共几页
		double page = Math.ceil(eqCount / size);
		index = (index - 1) * size;
		// 每一页的数据
		List<equipment> eqs = null;
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"eqs","classify"});
		eqs = eqService.FindByEquipmentPage(dc, index, size);
		System.out.println(JSONArray.fromObject(eqs, config).toString());
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		ServletActionContext.getResponse().getWriter().print(JSONArray.fromObject(eqs, config).toString());
		return NONE;
	}
	
	public String FindPageIndex() throws IOException{
		String userid = ServletActionContext.getRequest().getParameter("userid");
		String pageSize = ServletActionContext.getRequest().getParameter("pageSize");
		String pageIndex = ServletActionContext.getRequest().getParameter("pageIndex");
		Integer size = Integer.valueOf(pageSize);
		Integer index = Integer.valueOf(pageIndex);
		DetachedCriteria dc = DetachedCriteria.forClass(equipment.class);
		// 总数量
		double eqCount = eqService.EquipmentCount(dc, userService.FindUserByid(Long.valueOf(userid)));
		// 一共几页
		double page = Math.ceil(eqCount / size);
		
		if(index == page && page != 1){
			ServletActionContext.getResponse().getWriter().print("2");
		}else if(index > 1 && index < page){
			ServletActionContext.getResponse().getWriter().print("1");
		}else if(index == 1 && page != 1){
			ServletActionContext.getResponse().getWriter().print("0");
		}else{
			ServletActionContext.getResponse().getWriter().print("3");
		}
		return NONE;
	}

	//故障种类维修分页
	public String FindClass() throws IOException{
		String class_id = ServletActionContext.getRequest().getParameter("class_id");
		String pageSize = ServletActionContext.getRequest().getParameter("pageSize");
		String pageIndex = ServletActionContext.getRequest().getParameter("pageIndex");
		Integer size = Integer.valueOf(pageSize);
		Integer index = Integer.valueOf(pageIndex);
		DetachedCriteria dc = DetachedCriteria.forClass(equipment.class);
		// 总数量
		double eqCount = classService.ClassCount(dc, classService.FindClassById(Long.valueOf(class_id)));
		// 一共几页
		double page = Math.ceil(eqCount / size);
		index = (index - 1) * size;
		// 每一页的数据
		List<equipment> eqs = null;
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"eqs","classify"});
		eqs = eqService.FindByEquipmentPage(dc, index, size);
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		ServletActionContext.getResponse().getWriter().print(JSONArray.fromObject(eqs, config).toString());
		return NONE;
	}
	
	public String FindClassPageIndex() throws IOException{
		String class_id = ServletActionContext.getRequest().getParameter("class_id");
		String pageSize = ServletActionContext.getRequest().getParameter("pageSize");
		String pageIndex = ServletActionContext.getRequest().getParameter("pageIndex");
		Integer size = Integer.valueOf(pageSize);
		Integer index = Integer.valueOf(pageIndex);
		DetachedCriteria dc = DetachedCriteria.forClass(equipment.class);
		// 总数量
		double eqCount = classService.ClassCount(dc, classService.FindClassById(Long.valueOf(class_id)));
		// 一共几页
		double page = Math.ceil(eqCount / size);
		if(index == page && page != 1){
			ServletActionContext.getResponse().getWriter().print("2");
		}else if(index > 1 && index < page){
			ServletActionContext.getResponse().getWriter().print("1");
		}else if(index == 1 && page != 1){
			ServletActionContext.getResponse().getWriter().print("0");
		}else{
			ServletActionContext.getResponse().getWriter().print("3");
		}
		return NONE;
	}
}
