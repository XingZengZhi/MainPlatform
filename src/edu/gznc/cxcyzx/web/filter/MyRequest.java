package edu.gznc.cxcyzx.web.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class MyRequest extends HttpServletRequestWrapper {
	public MyRequest(HttpServletRequest request) {
		super(request);
	}

	@Override
	public String getParameter(String name) {
		String value = super.getParameter(name);
		try {
			if("GET".equalsIgnoreCase(super.getMethod())){
				value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return value;
	}
	
	

}
