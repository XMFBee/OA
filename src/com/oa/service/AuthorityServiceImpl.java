package com.oa.service;

import com.oa.dao.AuthorityDAO;

public class AuthorityServiceImpl implements AuthorityService{

	private AuthorityDAO autDAO;
	
	
	
	public void setAutDAO(AuthorityDAO autDAO) {
		this.autDAO = autDAO;
	}


	@Override
	public boolean queryAuthority(String roleId, String actionName) {
		return autDAO.queryAuthority(roleId, actionName);
	}

}
