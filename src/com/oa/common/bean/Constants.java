package com.oa.common.bean;

import org.apache.struts2.ServletActionContext;

public class Constants {

	public static final String UPLOAD_PATH = ServletActionContext.getServletContext().getRealPath("/") + "upload";
	public static final String ERROR = "error";
}
