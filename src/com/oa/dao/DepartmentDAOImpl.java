package com.oa.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.oa.bean.Department;

public class DepartmentDAOImpl extends AbstractBaseDAO<Department> implements DepartmentDAO{

	@Override
	public Map<String, String> queryAll() {
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.createQuery("select d.depId , d.name from Department d where d.status=1");
		List resultList = query.list();
		Map<String,String> select = null;
		if(resultList!=null){
			select = new HashMap<String,String>();
			for(int i = 0,len = resultList.size(); i<len; i++) {
				Object[] obj = (Object[]) resultList.get(i);
				select.put(obj[0].toString(),obj[1].toString() );
			}
		}
		return select;
	}

	@Override
	public void updateDep(Department dep) {
		Session session = getSessionFactory().getCurrentSession();
		String updDep = "update t_dept set name = '" + dep.getName()+"', empid='" + dep.getEmployee().getEmpId() + "', des='" + dep.getDes() + "',status = '" + dep.getStatus() + "' where depid = '" + dep.getDepId() + "'";
		SQLQuery query2= session.createSQLQuery(updDep);
		query2.executeUpdate();
	}

	@Override
	public void giveDeptEmp(String depid,String empid) {
		Session session = getSessionFactory().getCurrentSession();
		String updDep = "update t_dept set empid = ? where depid=?";
		SQLQuery query= session.createSQLQuery(updDep);
		query.setParameter(0,empid);
		query.setParameter(1,depid);
		query.executeUpdate();
	}

	@Override
	public String queryDepidByEmp(String empid) {
		Session session = getSessionFactory().getCurrentSession();
		String sql = "select depid from t_dept where empid = ?";
		SQLQuery query= session.createSQLQuery(sql);
		query.setParameter(0,empid);
		return 	(String) query.uniqueResult();
	}
	
	@Override 
	public String queryDepNameByDepId(String depid){
		Session session = getSessionFactory().getCurrentSession();
		String sql = "select depid from t_dept where depid= ?";
		SQLQuery query= session.createSQLQuery(sql);
		query.setParameter(0,depid);
		return 	(String) query.uniqueResult();
	}


}
