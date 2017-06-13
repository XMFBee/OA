package com.oa.service.info;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Course;
import com.oa.bean.info.EmpfeedbackInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.info.EmpfeedbackDAOInfo;

public class EmpfeedbackServiceInfoImpl implements EmpfeedbackInfoService{

	public EmpfeedbackDAOInfo empfeedbackDAOInfo;
	
	public void setEmpfeedbackDAOInfo(EmpfeedbackDAOInfo empfeedbackDAOInfo) {
		this.empfeedbackDAOInfo = empfeedbackDAOInfo;
	}

	@Override
	public EmpfeedbackInfo save(EmpfeedbackInfo t) {
		return null;
	}

	@Override
	public void delete(EmpfeedbackInfo t) {
		
	}

	@Override
	public void update(EmpfeedbackInfo t) {
		
	}

	@Override
	public EmpfeedbackInfo queryById(Class<?> clazz, Serializable id) {
		return null;
	}

	@Override
	public List<EmpfeedbackInfo> queryAll(Serializable beanName) {
		return null;
	}

	@Override
	public Pager4EasyUI<EmpfeedbackInfo> queryPager(String beanName, Pager4EasyUI<EmpfeedbackInfo> pager) {
		return empfeedbackDAOInfo.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return empfeedbackDAOInfo.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		
	}

	@Override
	public Pager4EasyUI<EmpfeedbackInfo> queryBySearch(Pager4EasyUI<EmpfeedbackInfo> pager, String empName) {
		return empfeedbackDAOInfo.queryBySearch(pager, empName);
	}

	
	
}
