package edu.gznc.cxcyzx.web.action;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.gznc.cxcyzx.domain.User;
import edu.gznc.cxcyzx.service.UserService;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Controller
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User> {
	private static final long serialVersionUID = 1L;
	private User user = new User();
	@Override
	public User getModel() {
		return user;
	}
	@Autowired
	private UserService userService;
	public String UserRegister(){
		boolean b = userService.UserRegister(user);//注册用户
		if(b){
			ActionContext.getContext().getSession().put("message", "注册成功");
		}else{
			ActionContext.getContext().getSession().put("message", "注册失败，注册的用户名已存在");
		}
		return "index";
	}
	public String UserLogin(){
		User loginUser = userService.FindUser(user);
		if(loginUser != null){
			ActionContext.getContext().getSession().put("message", null);
			ActionContext.getContext().getSession().put("user", loginUser);
		}
		return "index";
	}
	public String UserLoginOut(){
		ActionContext.getContext().getSession().put("user", null);
		return "index";
	}
	public String UserUpdata(){
		User updataUser = userService.FindUserByName(user);
		if(updataUser != null){
			updataUser.setUpassword(user.getUpassword());
			userService.UpdateUser(updataUser);
		}
		return "index";
	}
	//用户总数
	public String UserCount() throws IOException{
		DetachedCriteria dc = DetachedCriteria.forClass(User.class);
		Integer counts = userService.UserCount(dc);
		ServletActionContext.getResponse().getWriter().print(String.valueOf(counts));
		return NONE;
	}
	//每一页信息
	public String Page() throws IOException{
		DetachedCriteria dc = DetachedCriteria.forClass(User.class);
		Integer pageIndex = Integer.parseInt(ServletActionContext.getRequest().getParameter("pageIndex"));
		Integer pageSize = Integer.parseInt(ServletActionContext.getRequest().getParameter("pageIndex"));
		pageIndex = pageSize*(pageIndex - 1);
		List<User> users = userService.findByPage(dc, pageIndex, pageSize);
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"eqs"});
		ServletActionContext.getResponse().getWriter().print(JSONArray.fromObject(users, config));
		return NONE;
	}
}
