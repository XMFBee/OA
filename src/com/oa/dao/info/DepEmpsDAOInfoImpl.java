package com.oa.dao.info;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.oa.bean.Department;
import com.oa.bean.info.DepEmps;
import com.oa.common.bean.Pager4EasyUI;

public class DepEmpsDAOInfoImpl extends AbstractBaseDAO implements DepEmpsDAOInfo{
	public Pager4EasyUI<DepEmps> query(String sql, Pager4EasyUI<DepEmps> pager){
	    Session session = getSessionFactory().getCurrentSession();
	    String sqlHead = "select d.depId,d.name,e.empId,e.name,e.eduBack,e.college,e.hireDay ";
	    System.out.println(sqlHead + sql);
        Query query = session.createQuery(sqlHead + sql);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        List list = query.list();
        List<DepEmps> depEmpes = null;
        if(list!=null) {
        	depEmpes= new ArrayList<DepEmps>();
	        for(int i = 0, len = list.size(); i<len; i++) {
	        	Object[] obj = (Object[]) list.get(i);
	        	DepEmps depEmps = new DepEmps();
	        	
	        	depEmps.setDepId(obj[0].toString());
	        	depEmps.setDepName(obj[1].toString());
	        	depEmps.setEmpId(obj[2].toString());
	        	depEmps.setEmpName(obj[3].toString());
	        	
	        	depEmps.setEmpHireDay((Date) obj[6]);
	        	if(obj[4] == null){
	        		depEmps.setEmpEduback(null);
	        	}else{
	        		depEmps.setEmpEduback(obj[4].toString());
	        	}
	        	
	        	if(obj[5] == null){
	        		depEmps.setEmpCollege(null);
	        	}else{
	        		depEmps.setEmpCollege(obj[5].toString());
	        	}
	        	
	        	depEmpes.add(depEmps);
	        }	
        }
        pager.setRows(depEmpes);
        return pager;
	}

}
