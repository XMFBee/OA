package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.EmpFeedback;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.EmpfeedbackDAO;

public class EmpFeedbackServiceImpl implements EmpFeedbackService {

	private EmpfeedbackDAO empfeedbackDAO;
	
	

	public EmpfeedbackDAO getEmpfeedbackDAO() {
		return empfeedbackDAO;
	}

	public void setEmpfeedbackDAO(EmpfeedbackDAO empfeedbackDAO) {
		this.empfeedbackDAO = empfeedbackDAO;
	}

	@Override
	public EmpFeedback queryById(Class<?> clazz, Serializable id) {
		return empfeedbackDAO.queryById(clazz, id);
	}

	@Override
	public List<EmpFeedback> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<EmpFeedback> queryPager(String beanName, Pager4EasyUI<EmpFeedback> pager) {
		return empfeedbackDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return empfeedbackDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		empfeedbackDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public void delete(EmpFeedback t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public EmpFeedback save(EmpFeedback t) {
		return empfeedbackDAO.save(t);
	}



	@Override
	public void update(EmpFeedback t) {
		empfeedbackDAO.update(t);
	}

	@Override
	public Pager4EasyUI<EmpFeedback> queryById(String empId, Pager4EasyUI<EmpFeedback> pager) {
		return empfeedbackDAO.querySelfEmpfeedback(empId, pager);
	}

}
