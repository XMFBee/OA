package com.oa.dao;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.oa.bean.EmpFeedback;
import com.oa.common.bean.Pager4EasyUI;

public class EmpfeedbackDAOImpl extends AbstractBaseDAO<EmpFeedback> implements EmpfeedbackDAO {

	@Override
	public Pager4EasyUI<EmpFeedback> querySelfEmpfeedback(String empId, Pager4EasyUI<EmpFeedback> pager) {
		Session session = this.getSessionFactory().getCurrentSession();
		String hql = "from EmpFeedback s where s.empId =:empId";
		Query query = session.createQuery(hql);
		query.setParameter("empId", empId);
		@SuppressWarnings("unchecked")
		List<EmpFeedback> list = query.list();
		pager.setRows(list);
		pager.setTotal(list.size());
		return pager;
	}


}
