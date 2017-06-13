package com.oa.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;

import com.oa.bean.Department;
import com.oa.bean.Employee;
import com.oa.bean.Role;
import com.oa.bean.info.EmpBaseInfo;
import com.oa.common.bean.Pager4EasyUI;

public class EmployeeDAOImpl extends AbstractBaseDAO<Employee> implements EmployeeDAO{

	@Override
	public Employee login(Employee emp) {
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.createQuery("from Employee e where e.phone = :empPhone and e.pwd = :pwd");
		query.setParameter("empPhone", emp.getPhone());
		query.setParameter("pwd", emp.getPwd());
		emp = (Employee) query.uniqueResult();
		if (emp != null) {
			return emp;
		}
		return null;
	}

	@Override
	public List<Map<String, String>> allRoles(){
		return allBeanIdAndName("select r.roleId , r.name  from Role r where r.status = 1");
	}

	@Override
	public List<Map<String, String>> allEmps() {
		List<Map<String, String>> map = allBeanIdAndName("select e.empId , e.name from Employee e where e.status = 1");
		return map;
	}
	
	private List<Map<String, String>> allBeanIdAndName(String sql) {
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.createQuery(sql);
		List list = query.list();
		
		List<Map<String,String>> maps = null;
		if(list!=null){
			maps = new ArrayList<Map<String,String>>();
			for(int i = 0,len=list.size(); i<len; i++) {
				Map map = new HashMap<>();
				Object[] obj=(Object[]) list.get(i);
				map.put("key", obj[0].toString());
				map.put("value", obj[1].toString());
				maps.add(map);
			}
			Object[] obj = maps.toArray();
			System.out.println(obj);
		}
		
		return maps;
	}

	@Override
	public void giveRole2Emp(String roleid, String empid) {
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.createSQLQuery("update t_emp set roleid = ? where empid = ?");
		query.setParameter(0, roleid);
		query.setParameter(1, empid);
		query.executeUpdate();
	}

	@Override
	public String queryEmpByRole(String roleid, String depid) {
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.createSQLQuery("select e.empid from t_emp e where e.roleid = ?");
		query.setParameter(0, roleid);
		Object obj =  query.uniqueResult();
		String  empid = null;
		if(obj!=null){
			empid = (String) obj;
		}
		return empid;
	}
	
	/**
	 * 修改员工信息,通用
	 */
	@Override
	public void updBaseEmp(Employee e) {
		Session session = getSessionFactory().getCurrentSession();
		String updSql = "update t_emp set ";
		String whe = " where empid = :empid";
		
		StringBuffer setStr = new StringBuffer();
		setStr.append(" empid = :empid");
		if(e.getDepartment()!=null){
			if(e.getDepartment().getDepId()!=null&&!e.getDepartment().getDepId().equals("")){
				setStr.append(",depid = :depid");
			}
		}
		if(e.getRole()!=null){
			if(e.getRole().getRoleId()!=null&&!e.getRole().getRoleId().equals("")){
				setStr.append(",roleid = :roleid");
			}
		}
		if(e.getPwd()!=null&&!e.getPwd().equals("")){
			setStr.append(",pwd = :pwd");
		}
		if(e.getEmail()!=null&&!e.getEmail().equals("")){
			setStr.append(",email = :email");
		}
		if(e.getPhone()!=null&&!e.getPhone().equals("")){
			setStr.append(",phone = :phone");
		}
		if(e.getQq()!=null&&!e.getQq().equals("")){
			setStr.append(",qq = :qq");
		}
		if(e.getWeChat()!=null&&!e.getWeChat().equals("")){
			setStr.append(",wechat = :wechat");
		}
		if(e.getAddress()!=null&&!e.getAddress().equals("")){
			setStr.append(",address = :address");
		}
		if(e.getMarried()!=null&&!e.getMarried().equals("")){
			setStr.append(",married = :married");
		}
		if(e.getContactName()!=null&&!e.getContactName().equals("")){
			setStr.append(",contactName = :contactName");
		}
		if(e.getContactPhone()!=null&&!e.getContactPhone().equals("")){
			setStr.append(",contactPhone = :contactPhone");
		}
		if(e.getBankName()!=null&&!e.getBankName().equals("")){
			setStr.append(",bankName = :bankName");
		}
		if(e.getAccountName()!=null&&!e.getAccountName().equals("")){
			setStr.append(",accountName = :accountName");
		}
		if(e.getAccountNo()!=null&&!e.getAccountNo().equals("")){
			setStr.append(",accountNo = :accountNo");
		}
		if(e.getAlipay()!=null&&!e.getAlipay().equals("")){
			setStr.append(",alipay = :alipay");
		}
		if(e.getStatus()==0 || e.getStatus()==1){
			if(e.getStatus()==0) {
				setStr.append(",resignday = :resignday");
			}
			setStr.append(",status = :status");
		}
		String sqlStr = updSql + setStr.toString()+whe; 
		Query query = session.createSQLQuery(sqlStr);
		
		query.setParameter("empid", e.getEmpId());
		if(e.getDepartment()!=null){
			if(e.getDepartment().getDepId()!=null&&!e.getDepartment().getDepId().equals("")){
				query.setParameter("depid", e.getDepartment().getDepId());
			}
		}
		if(e.getRole()!=null){
			if(e.getRole().getRoleId()!=null&&!e.getRole().getRoleId().equals("")){
				query.setParameter("roleid", e.getRole().getRoleId());
			}
		}
		if(e.getPwd()!=null&&!e.getPwd().equals("")){
			query.setParameter("pwd", e.getPwd());
		}
		if(e.getEmail()!=null&&!e.getEmail().equals("")){
			query.setParameter("email", e.getEmail());
		}
		if(e.getPhone()!=null&&!e.getPhone().equals("")){
			query.setParameter("phone", e.getPhone());
		}
		if(e.getQq()!=null&&!e.getQq().equals("")){
			query.setParameter("qq", e.getQq());
		}
		if(e.getWeChat()!=null&&!e.getWeChat().equals("")){
			query.setParameter("wechat", e.getWeChat());
		}
		if(e.getAddress()!=null&&!e.getAddress().equals("")){
			query.setParameter("address", e.getAddress());
		}
		if(e.getMarried()!=null&&!e.getMarried().equals("")){
			query.setParameter("married", e.getMarried());
		}
		if(e.getContactName()!=null&&!e.getContactName().equals("")){
			query.setParameter("contactName", e.getContactName());
		}
		if(e.getContactPhone()!=null&&!e.getContactPhone().equals("")){
			query.setParameter("contactPhone", e.getContactPhone());
		}
		if(e.getBankName()!=null&&!e.getBankName().equals("")){
			query.setParameter("bankName", e.getBankName());
		}
		if(e.getAccountName()!=null&&!e.getAccountName().equals("")){
			query.setParameter("accountName", e.getAccountName());
		}
		if(e.getAccountNo()!=null&&!e.getAccountNo().equals("")){
			query.setParameter("accountNo", e.getAccountNo());
		}
		if(e.getAlipay()!=null&&!e.getAlipay().equals("")){
			query.setParameter("alipay", e.getAlipay());
		}
		if(e.getStatus()==0 || e.getStatus()==1){
			if(e.getStatus()==0) {
				query.setParameter("resignday", new Date());
			}
			query.setParameter("status", e.getStatus());
		}
		query.executeUpdate();
	}

	/**
	 * 计数部门中的员工(在职)
	 */
	@Override
	public int countEmpsByDept(String deptid) {
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery("select count(e.empid) from t_dept d left join t_emp e on d.depid = e.depid where d.depid = ? and e.status=1 ");
		query.setParameter(0, deptid);
		Object obj =  query.uniqueResult();
		BigInteger bigint = (BigInteger)obj;
		return bigint.intValue();
	}


	@Override
	public Pager4EasyUI<EmpBaseInfo> queryNorm(Pager4EasyUI<EmpBaseInfo> pager,String depId, String empName,Date beginDate,Date endDate, String status,String sort, String order){
		 String sql = "select e.empId eid,e.name ename,d.depId did,d.name dname,e.nation enation,e.gender egender,e.birthday ebir,e.email eemail,e.hireDay ehire,e.resignDay eresi,e.status esta,r.roleId rrole,r.name rname";
		 StringBuffer whe = new StringBuffer(" where hireday <= :endDate");
		 String orderby = " order by d.depId";
		 	if(sort!=null&&!sort.equals("")&&order!=null&&!order.equals("")){
		 		orderby += " ,d." + sort + " " + order;
		 	}
	        if(depId!=null&&!depId.equals("")){	        	whe.append(" and d.depid = :depId");	        }
	        if(empName!=null && !empName.equals("")){  
	        	whe.append(" and e.name like :empName");    }
	        if(beginDate!=null){       	whe.append(" and e.hireday >= :beginDate");    }
	        if(status!=null&&status.equals("")){
		 		if(status.equals("0")){		 			whe.append(" and e.status = 0 " );
		 		}else if(status.equals("1")){		 			whe.append(" and e.status = 1 " );		 		}
		 	}
	        
	        
	        Session session = getSessionFactory().getCurrentSession();
	        sql +=" from t_emp e left join t_dept d on e.depid = d.depid left join t_role r on e.roleid = r.roleid "+ whe.toString() + orderby;
	        SQLQuery query = session.createSQLQuery(sql);
	        if(depId!=null&&!depId.equals("")){	        	query.setParameter("depId",depId); }
	        if(empName!=null && !empName.equals("")){    
	        	query.setParameter("empName", empName);    }
	        if(beginDate!=null){        query.setParameter("beginDate", beginDate);     }
	        if(endDate==null){endDate = new Date();}
	        query.setParameter("endDate",endDate);
	        
	        
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
	
	
	
	
	
	
	
	
	@Override
	public int countNorm(String depId, String empName,Date beginDate,Date endDate, String status){
		 String sql = "select e.empId eid,e.name ename,d.depId did,d.name dname,e.nation enation,e.gender egender,e.birthday ebir,e.email eemail,e.hireDay ehire,e.resignDay eresi,e.status esta,r.roleId rrole,r.name rname";
		 StringBuffer whe = new StringBuffer(" where hireday <= :endDate");
		 String orderby = " order by d.depId";
		 	if(status!=null&&status.equals("")){
		 		if(status.equals("0")){		 			whe.append(" and e.status = 0 " );
		 		}else if(status.equals("1")){		 			whe.append(" and e.status = 1 " );		 		}
		 	}
	        if(depId!=null&&!depId.equals("")){	        	whe.append(" and d.depid = :depId");	        }
	        if(empName!=null && !empName.equals("")){  
	        	whe.append(" and e.name like :empName");    }
	        if(beginDate!=null){       	whe.append(" and e.hireday >= :beginDate");    }
	        
	        Session session = getSessionFactory().getCurrentSession();
	        sql +=" from t_emp e left join t_dept d on e.depid = d.depid left join t_role r on e.roleid = r.roleid "+ whe.toString() + orderby;
	        SQLQuery query = session.createSQLQuery(sql);
	        if(depId!=null&&!depId.equals("")){	        	query.setParameter("depId",depId); }
	        if(empName!=null && !empName.equals("")){    
	        	query.setParameter("empName", empName);    }
	        if(beginDate!=null){        query.setParameter("beginDate", beginDate);     }
	        if(endDate==null){endDate = new Date();}
	        query.setParameter("endDate",endDate);
	        
	        BigInteger bigInteger= (BigInteger) query.uniqueResult();
	        
	        return bigInteger.intValue();
	}



}
