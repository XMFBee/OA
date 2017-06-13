package com.oa.action;

import com.oa.common.bean.ControllerRequest;
import com.oa.common.web.WebUtil;

public class AuthorityAction extends BaseAction {

	private static final long serialVersionUID = 4851875227500157169L;
	
	private String methodName;
	private ControllerRequest resu; // 返回提示信息到easyUI页面

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}
	

	public ControllerRequest getResu() {
		return resu;
	}





	public String authority() {
		String roleId = WebUtil.getRoleId(req);
		if (autService.queryAuthority(roleId, methodName)) {
			resu = ControllerRequest.getSuccessRequest("有权限");
		} else {
			resu = ControllerRequest.getFailRequest("您没有权限操作");
		}
		return "authority";
	}

}
