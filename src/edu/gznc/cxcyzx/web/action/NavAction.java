package edu.gznc.cxcyzx.web.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;


@Controller
@Scope("prototype")
public class NavAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	public String index(){return "index";}
	public String apply(){return "apply";}
	public String show(){return "show";}
	public String summary(){return "summary";}
	public String message(){return "message";}
}
