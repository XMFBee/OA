package com.oa.dao;

public interface AuthorityDAO {
	
	/**
	 * 
	 * 根据角色id 和 全限定名查询有没有改权限
	 * @return 
	 */
	public boolean queryAuthority(String roleId,String actionName);
}
