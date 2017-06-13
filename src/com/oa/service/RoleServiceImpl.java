package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Role;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.RoleDAO;

public class RoleServiceImpl implements RoleService {

	private RoleDAO roleDAO;

	
	public void setRoleDAO(RoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}

	@Override
	public Role save(Role t) {
		return roleDAO.save(t);
	}

	@Override
	public void delete(Role t) {
		 roleDAO.delete(t);
	}

	@Override
	public void update(Role t) {
		roleDAO.update(t);
	}

	@Override
	public Role queryById(Class<?> clazz, Serializable id) {
		return roleDAO.queryById(clazz, id);
	}

	@Override
	public List<Role> queryAll(Serializable beanName) {
		return roleDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<Role> queryPager(String beanName, Pager4EasyUI<Role> pager) {
		return roleDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return roleDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		roleDAO.updateStatus(beanName, beanId, status, id);
	}
	

}
