package com.oa.dao.info;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.oa.bean.Department;
import com.oa.bean.Role;
import com.oa.bean.info.DepEmp;
import com.oa.common.bean.Pager4EasyUI;

public class DepEmpDAOInfoImpl extends  AbstractBaseDAO<DepEmp>  implements DepEmpDAOInfo{
	public Pager4EasyUI<DepEmp> query( Pager4EasyUI<DepEmp> pager){
	    Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select d.depId,d.name,d.des,e.empId,e.name ,d.status from Department d left join d.employee e ");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        List list = query.list();
        List<DepEmp> depEmps = null;
        if(list!=null) {
        	depEmps= new ArrayList<DepEmp>();
	        for(int i = 0, len = list.size(); i<len; i++) {
	        	Object[] obj = (Object[]) list.get(i);
	        	DepEmp depEmp = new DepEmp();
	        	
	        	depEmp.setDepId(obj[0].toString());
	        	depEmp.setDepName(obj[1].toString());
	        	depEmp.setDes(obj[2].toString());
	        	if(obj[3] == null && obj[4] == null){
	        		depEmp.setEmpId(null);
	        		depEmp.setEmpName(null);
	        	}else{
	        		depEmp.setEmpId(obj[3].toString());
	        		depEmp.setEmpName(obj[4].toString());
	        	}
	        	depEmp.setStatus(Integer.parseInt(obj[5].toString()));
	        	
	        	depEmps.add(depEmp);
	        }	
        }
        pager.setRows(depEmps);
        return pager;
	}

	@Override
	public Map<String, String> empSelect(Department dep) {
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.createQuery("select e.empId,e.name from Department d join d.employees e");
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
	public Role queryRole(String rolename) {
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.createQuery("select r.roleId  from Role r where r.name=?");
		query.setParameter(0, rolename);
		String str  = (String) query.uniqueResult();
		Role role = new Role();
		role.setRoleId(str);
		return role;
	}
	
	
}
