package com.oa.action.info;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class SomeJSON extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	
	public String execute(){
		return SUCCESS;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
