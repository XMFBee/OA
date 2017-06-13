package com.oa.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.oa.bean.Employee;
import com.oa.bean.SalaryInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;

public class SalaryInfoDAOImpl extends AbstractBaseDAO<SalaryInfo> implements SalaryInfoDAO {

	@Override
	public Pager4EasyUI<SalaryInfo> queryBySearch(Pager4EasyUI<SalaryInfo> pager, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		Criteria c = session.createCriteria(SalaryInfo.class);
		Criteria empCriteria = c.createCriteria("emp");
		empCriteria.add(Restrictions.like("name", "%" + name + "%"));
		@SuppressWarnings("unchecked")
		List<SalaryInfo> list = (List<SalaryInfo>) c.list();
		pager.setRows(list);
		pager.setTotal(list.size());
		return pager;
	}

	@Override
	public Pager4EasyUI<SalaryInfo> queryByPhone(Pager4EasyUI<SalaryInfo> pager, String phone) {
		Session session = this.getSessionFactory().getCurrentSession();
		Criteria c = session.createCriteria(SalaryInfo.class);
		Criteria empCriteria = c.createCriteria("emp");
		empCriteria.add(Restrictions.like("name", "%" + phone + "%"));
		@SuppressWarnings("unchecked")
		List<SalaryInfo> list = (List<SalaryInfo>) c.list();
		pager.setRows(list);
		pager.setTotal(list.size());
		return pager;
	}

	@Override
	public Pager4EasyUI<SalaryInfo> querySelfSalaryInfo(String empId, Pager4EasyUI<SalaryInfo> pager) {
		Session session = this.getSessionFactory().getCurrentSession();
		String hql = "from SalaryInfo s where s.empId =:empId";
		Query query = session.createQuery(hql);
		query.setParameter("empId", empId);
		@SuppressWarnings("unchecked")
		List<SalaryInfo> list = query.list();
		pager.setRows(list);
		pager.setTotal(list.size());
		return pager;
	}
}
