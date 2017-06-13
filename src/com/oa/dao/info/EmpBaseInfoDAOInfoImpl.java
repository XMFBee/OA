package com.oa.dao.info;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.oa.bean.info.EmpBaseInfo;
import com.oa.common.bean.Pager4EasyUI;

public class EmpBaseInfoDAOInfoImpl extends AbstractBaseDAO implements EmpBaseInfoDAOInfo{

	@Override
	public Pager4EasyUI<EmpBaseInfo> query(Pager4EasyUI<EmpBaseInfo> pager,int statu) {
		 Session session = getSessionFactory().getCurrentSession();
		 String sql = "select e.empId eid,e.name ename,d.depId did,d.name dname,e.nation enation,e.gender egender,e.birthday ebir,e.email eemail,e.hireDay ehire,e.resignDay eresi,e.status esta,r.roleId rrole,r.name rname";
	        SQLQuery query = session.createSQLQuery(sql + " from t_emp e left join t_dept d on e.depid = d.depid left join t_role r on e.roleid = r.roleid order by e.empid");
	        query.setFirstResult(pager.getBeginIndex());
	        query.setMaxResults(pager.getPageSize());
	        List list = query.list();
	        List<EmpBaseInfo> emps = null;
	        if(list!=null) {
	        	emps= new ArrayList<EmpBaseInfo>();
		        for(int i = 0, len = list.size(); i<len; i++) {
		        	Object[] obj = (Object[]) list.get(i);
		        	EmpBaseInfo emp = new EmpBaseInfo();
		        	
		        	emp.setEmpId(obj[0].toString());
		        	emp.setName(obj[1].toString());
		        	if(obj[2]!=null){
		        		emp.setDepId(obj[2].toString());
		        		emp.setDepName(obj[3].toString());}
		        	if(obj[5]!=null){     		emp.setGender(obj[5].toString());}
		        	if(obj[6]!=null){     		emp.setBirthday((Date) obj[6]);}
		        	if(obj[7]!=null){        	emp.setEmail(obj[7].toString());}
		        	if(obj[8]!=null){emp.setHireDay((Date) obj[8]);}
		        	if(obj[10]!=null){emp.setStatus((Integer) obj[10]);}
		        	if(obj[11]!=null){        	emp.setRoleId(obj[11].toString());       	emp.setRoleName(obj[12].toString());       	}
		        	
		        	if(obj[4] !=null){    		emp.setNation(obj[4].toString());}
		        	if(obj[9] !=null){    		emp.setResignDay((Date) obj[9]);}
		        	
		        	emps.add(emp);
		        }	
	        }
	        pager.setRows(emps);
	        return pager;
	}

}
