package com.oa.service;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oa.bean.Employee;
import com.oa.bean.SalaryInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.SalaryInfoDAO;
/**
 * 
 * @author 赖泰君
 *
 */
public class SalaryInfoServiceImpl implements SalaryInfoService {

	private SalaryInfoDAO salaryInfoDAO;

	public SalaryInfoDAO getSalaryInfoDAO() {
		return salaryInfoDAO;
	}

	public void setSalaryInfoDAO(SalaryInfoDAO salaryInfoDAO) {
		this.salaryInfoDAO = salaryInfoDAO;
	}

	@Override
	public SalaryInfo save(SalaryInfo t) {
		return salaryInfoDAO.save(t);
	}

	@Override
	public void delete(SalaryInfo t) {
		salaryInfoDAO.delete(t);
	}

	@Override
	public void update(SalaryInfo t) {
		salaryInfoDAO.update(t);
	}

	@Override
	public SalaryInfo queryById(Class<?> clazz, Serializable id) {
		return salaryInfoDAO.queryById(clazz, id);
	}

	@Override
	public List<SalaryInfo> queryAll(Serializable beanName) {
		return salaryInfoDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<SalaryInfo> queryPager(String beanName, Pager4EasyUI<SalaryInfo> pager) {
		return salaryInfoDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return salaryInfoDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO 待實現的方法
	}

	@Override
	public Pager4EasyUI<SalaryInfo> queryBySearch(Pager4EasyUI<SalaryInfo> pager, String name) {
		return salaryInfoDAO.queryBySearch(pager, name);
	}

	@Override
	public Pager4EasyUI<SalaryInfo> queryByPhone(Pager4EasyUI<SalaryInfo> pager, String phone) {
		return salaryInfoDAO.queryByPhone(pager, phone);
	}

	@Override
	public Pager4EasyUI<SalaryInfo> querySelfSalaryInfo(String empId, Pager4EasyUI<SalaryInfo> pager) {
		return salaryInfoDAO.querySelfSalaryInfo( empId, pager);
	}

}
