package edu.gznc.cxcyzx.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.gznc.cxcyzx.domain.User;


@Controller
@Scope("prototype")
public class ImageAction extends ActionSupport implements ModelDriven<User> {
	
	public String SaveImageURL(){
		
		return NONE;
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return null;
	}

}
