package edu.gznc.cxcyzx.web.interceptors;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import edu.gznc.cxcyzx.domain.Fix;

public class PrivilegeInterceptor extends MethodFilterInterceptor {
	private static final long serialVersionUID = 1L;
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		Fix fixer = (Fix) ActionContext.getContext().getSession().get("fixer");
		if(fixer == null){
			ActionSupport actionSupport = (ActionSupport) invocation.getAction();
			return "bgLogin";
		}else{
			return invocation.invoke();
		}
	}

}
