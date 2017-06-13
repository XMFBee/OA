package com.oa.dao.info;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.oa.bean.info.EmpfeedbackInfo;
import com.oa.common.bean.Pager4EasyUI;

public class EmpfeedbackDAOInfoImpl extends AbstractBaseDAO<EmpfeedbackInfo> implements EmpfeedbackDAOInfo {

	@SuppressWarnings("unchecked")
	@Override
	public Pager4EasyUI<EmpfeedbackInfo> queryPager(String beanName, Pager4EasyUI<EmpfeedbackInfo> pager) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("select t.name as empName,e.feedbackid,e.feedbackday,e.des,e.status,e.empid from t_empfeedback e left join t_emp t on t.empid = e.empid");           
		query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        List<Object[]> row = query.list();
        List<EmpfeedbackInfo> list = new ArrayList<EmpfeedbackInfo>();
        for(Object[] o : row){
        	EmpfeedbackInfo empfeedbackInfo = new EmpfeedbackInfo();
        	empfeedbackInfo.setEmpName((String) o[0]);
        	empfeedbackInfo.setFeedbackId((String) o[1]);
        	empfeedbackInfo.setFeedbackDay((Date) o[2]);
        	empfeedbackInfo.setDes((String) o[3]);
        	empfeedbackInfo.setStatus((int) o[4]);
        	empfeedbackInfo.setEmpId((String) o[5]);        	
        	list.add(empfeedbackInfo);
        }
        pager.setRows(list);
		return pager;
	}

	@Override
	public Pager4EasyUI<EmpfeedbackInfo> queryBySearch(Pager4EasyUI<EmpfeedbackInfo> pager, String empName) {
		Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("select e.name as empName,e.empid,f.feedbackid,f.des,f.feedbackday,f.status from t_empfeedback f	left join t_emp e on e.empid = f.empid where e.name like binary :name or f.feedbackday like binary :name or f.des like binary :name");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        query.setParameter("name", "%" + empName + "%");
        @SuppressWarnings("unchecked")
		List<Object[]> row = query.list();
        List<EmpfeedbackInfo> list = new ArrayList<EmpfeedbackInfo>();
        for(Object[] o: row){
        	EmpfeedbackInfo emp = new EmpfeedbackInfo();
        	emp.setEmpName((String) o[0]);
        	emp.setEmpId((String) o[1]);
        	emp.setFeedbackId((String) o[2]);
        	emp.setDes((String) o[3]);
        	emp.setFeedbackDay((Date) o[4]);
        	emp.setStatus((int) o[5]);
        	list.add(emp);
        }
        pager.setRows(list);
        return pager;
	}
	
}
