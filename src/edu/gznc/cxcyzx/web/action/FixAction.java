package edu.gznc.cxcyzx.web.action;


import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.gznc.cxcyzx.domain.Fix;
import edu.gznc.cxcyzx.service.FixService;

@Controller
@Scope("prototype")
public class FixAction extends ActionSupport implements ModelDriven<Fix> {
	private static final long serialVersionUID = 1L;
	private Fix fix = new Fix();
	@Override
	public Fix getModel() {
		return fix;
	}
	@Autowired
	private FixService fixService;
	public String UserLogin(){
		Fix f = null;
		if(fix != null){//防止请求的对象为空
			f = fixService.FindFix(fix);
		}else{
			return "bgLogin";
		}
		if(f == null){//判断登录的对象是否存在
			ServletActionContext.getRequest().setAttribute("error", "用户不存在");
			return "bgLogin";
		}
		ActionContext.getContext().getSession().put("fixer", f);
		return "bgIndex";
	}
	public String LoginOut(){
		ActionContext.getContext().getSession().put("fixer", null);
		fix = null;//将fix置为空，才能真正起到用户退出的状态，若不置为空，服务器会有缓存。
		return "bgLogin";
	}
}
