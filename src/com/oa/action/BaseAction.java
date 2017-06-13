package com.oa.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.service.AuthorityService;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = 780696076487500104L;
	
	public HttpServletRequest req;
	public AuthorityService autService;
	
	
	public void setAutService(AuthorityService autService) {
		this.autService = autService;
	}


	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

}
