package com.oa.dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.oa.bean.Duty;
import com.oa.bean.Employee;

public class DutyDAOImpl extends AbstractBaseDAO<Duty> implements DutyDAO{

	@Override
	public List<Duty> queryTab() {	
		return currDuty(0);
	}

	@Override
	public List<String> queryAddress() {
		String sql = "select DISTINCT(select case when add1 is not null and add1 !='' then add1 end),"+
						"(select case when add2 is not null and add2 !='' then add2 end),"+
						"(select case when add3 is not null and add3 !='' then add3 end),"+
						"(select case when add4 is not null and add4 !='' then add4 end),"+
						"(select case when add5 is not null and add5 !='' then add5 end),"+
						"(select case when add6 is not null and add6 !='' then add6 end),"+
						"(select case when add7 is not null and add7 !='' then add7 end),"+
						"(select case when add8 is not null and add8 !='' then add8 end)"+
						" from t_duty ;";
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		List list = query.list();
		List adds = new ArrayList();
		if(list!=null&&list.size()>0) {
			Object[] result = (Object[]) list.get(0);
			for(int i = 0,len = result.length; i<len ; i++) {
				if(result[i]!=null){adds.add(result[i]);}
			}
		}
		return adds;
	}

	@Override
	public List<Duty> currDuty(int weekday) {
		String whe = "";
		if(weekday != 0) {			whe = " where weekday = " + weekday;		}
		String sql = "select d.dutyId as dId,d.weekday as day,"
				+ "d.add1 as a1,         d.add2 as a2          ,d.add3 as a3,        d.add4 as a4,         d.add5 as a5,           d.add6 as a6,        d.add7 as a7,       d.add8 as a8,"
				+ "d.empid1 as eid1, d.empid2 as eid2,  d.empid3 as eid3,d.empid4 as eid4,  d.empid5 as eid5,  d.empid6 as eid6,d.empid7 as eid7,d.empid8 as eid8,"
				+ "e1.name as ename1,e2.name as ename2,e3.name as ename3,e4.name as ename4,e5.name as ename5,e6.name as ename6,e7.name as ename7,e8.name as ename8 "
				+" from t_duty d left join t_emp e1 on d.empId1 = e1.empId"
				+"  left join t_emp e2 on d.empId2 = e2.empId"
				+"  left join t_emp e3 on d.empId3 = e3.empId"
				+"  left join t_emp e4 on d.empId4 = e4.empId"
				+"  left join t_emp e5 on d.empId5 = e5.empId"
				+"  left join t_emp e6 on d.empId6 = e6.empId"
				+"  left join t_emp e7 on d.empId7 = e7.empId"
				+"  left join t_emp e8 on d.empId8 = e8.empId ";
		
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql + whe);
		List<Object[]> result = query.list();
		List<Duty> dutys = new ArrayList<Duty>();
		for(int i = 0,len = result.size(); i<len; i++) {
			Object[] obj = (Object[]) result.get(i);
			String dutyid= obj[0].toString();
			String day = obj[1].toString();
			Duty duty = new Duty();duty.setDutyId(dutyid);
			if(obj[2] != null && !obj[2].equals("")){duty.setAdd1(obj[2].toString());} 
			if(obj[3] != null && !obj[3].equals("")){duty.setAdd2(obj[3].toString());} 
			if(obj[4] != null && !obj[4].equals("")){duty.setAdd3(obj[4].toString());}  
			if(obj[5] != null && !obj[5].equals("")){duty.setAdd4(obj[5].toString());}  
			if(obj[6] != null && !obj[6].equals("")){duty.setAdd5(obj[6].toString());}  
			if(obj[7] != null && !obj[7].equals("")){duty.setAdd6(obj[7].toString());}  
			if(obj[8] != null && !obj[8].equals("")){duty.setAdd7(obj[8].toString());}  
			if(obj[9] != null && !obj[9].equals("")){duty.setAdd8(obj[9].toString());}  
			
			if(obj[10] != null && !obj[10].equals("")) { duty.setWeekday(day);Employee employee = new Employee();employee.setEmpId(obj[10].toString());employee.setName(obj[18].toString()); duty.setEmp1(employee);	}
			if(obj[11] != null && !obj[11].equals("")) { duty.setWeekday(day);Employee employee = new Employee();employee.setEmpId(obj[11].toString());employee.setName(obj[19].toString()); duty.setEmp2(employee);	}
			if(obj[12] != null && !obj[12].equals("")) { duty.setWeekday(day);Employee employee = new Employee();employee.setEmpId(obj[12].toString());employee.setName(obj[20].toString()); duty.setEmp3(employee);	}
			if(obj[13] != null && !obj[13].equals("")) { duty.setWeekday(day);Employee employee = new Employee();employee.setEmpId(obj[13].toString());employee.setName(obj[21].toString()); duty.setEmp4(employee);	}
			if(obj[14] != null && !obj[14].equals("")) {duty.setWeekday(day);Employee employee = new Employee();employee.setEmpId(obj[14].toString());employee.setName(obj[22].toString()); duty.setEmp5(employee);	}
			if(obj[15] != null && !obj[15].equals("")) { duty.setWeekday(day);Employee employee = new Employee();employee.setEmpId(obj[15].toString());employee.setName(obj[23].toString()); duty.setEmp6(employee);	}
			if(obj[16] != null && !obj[16].equals("")) { duty.setWeekday(day);Employee employee = new Employee();employee.setEmpId(obj[16].toString());employee.setName(obj[24].toString()); duty.setEmp7(employee);	}
			if(obj[17] != null && !obj[17].equals("")) { duty.setWeekday(day);Employee employee = new Employee();employee.setEmpId(obj[17].toString());employee.setName(obj[25].toString()); duty.setEmp8(employee);	}
			
			dutys.add(duty);

		}
//		for(int i = 0,len = list.size(); i<len; i++) {
//			Object[] obj = (Object[]) list.get(i);
//			String dutyid= obj[0].toString();
//			String day = obj[1].toString();
//			if(obj[2] != null && !obj[2].equals("")) {Employee employee = new Employee();employee.setEmpId(obj[2].toString());employee.setName(obj[3].toString()); dutys.add(employee);	}
//			if(obj[4] != null && !obj[4].equals("")) {Employee employee = new Employee();employee.setEmpId(obj[4].toString());employee.setName(obj[5].toString()); dutys.add(employee);	}
//			if(obj[6] != null && !obj[6].equals("")) {Employee employee = new Employee();employee.setEmpId(obj[6].toString());employee.setName(obj[7].toString()); dutys.add(employee);	}
//			if(obj[8] != null && !obj[8].equals("")) {Employee employee = new Employee();employee.setEmpId(obj[8].toString());employee.setName(obj[9].toString()); dutys.add(employee);	}
//			if(obj[10] != null && !obj[10].equals("")) {Employee employee = new Employee();employee.setEmpId(obj[10].toString());employee.setName(obj[11].toString()); dutys.add(employee);	}
//			if(obj[12] != null && !obj[12].equals("")) {Employee employee = new Employee();employee.setEmpId(obj[12].toString());employee.setName(obj[13].toString()); dutys.add(employee);	}
//			if(obj[14] != null && !obj[14].equals("")) {Employee employee = new Employee();employee.setEmpId(obj[14].toString());employee.setName(obj[15].toString()); dutys.add(employee);	}
//			if(obj[16] != null && !obj[16].equals("")) {Employee employee = new Employee();employee.setEmpId(obj[16].toString());employee.setName(obj[17].toString()); dutys.add(employee);	}
//		}
		return dutys;
	}

	@Override
	public void updateDuty(Duty duty) {
		String sql = "update t_duty set empid1 = :empid1,empid2 = :empid2,empid3 = :empid3 , empid4=:empid4,empid5=:empid5 ,empid6=:empid6,empid7=:empid7,empid8=:empid8 where dutyid=:dutyid";
		
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("empid1", duty.getEmp1().getEmpId());
		query.setParameter("empid2", duty.getEmp2().getEmpId());
		query.setParameter("empid3", duty.getEmp3().getEmpId());
		query.setParameter("empid4", duty.getEmp4().getEmpId());
		query.setParameter("empid5", duty.getEmp5().getEmpId());
		query.setParameter("empid6", duty.getEmp6().getEmpId());
		query.setParameter("empid7", duty.getEmp7().getEmpId());
		query.setParameter("empid8", duty.getEmp8().getEmpId());
		query.setParameter("dutyid", duty.getDutyId());
		query.executeUpdate();
	}

	

	@Override
	public void addAddress(String addressid, String address) {//添加某个值班地点
		Session session= getSessionFactory().getCurrentSession();
		String sql = "update t_duty set "+ addressid + "=?";
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter(0, address);
		query.executeUpdate();
	}

	@Override
	public String queryNullAddress() {//查询某个值班地点
		Session session= getSessionFactory().getCurrentSession();
		String sql = "select distinct case";
				for(int i =0; i<8; i++){
					sql += " when d.add"+(i+1)+" is null then 'add"+(i+1)+"' when d.add"+(i+1)+" ='' then 'add"+(i+1)+"' ";
				}
				sql +="end from t_duty d ";
		SQLQuery query =  session.createSQLQuery(sql);
		Object result = query.uniqueResult();
		if(result!=null){
			return (String)result;
		}
		return null;
	}

	@Override
	public void updAddress(String oldAdd, String newAdd) {
		String oldAddId = queryAddidByValue(oldAdd);
		String sql = "update t_duty set " +oldAddId + "=?";
		Session session= getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter(0, newAdd);
		query.executeUpdate();
	}
	
	
	private  String queryAddidByValue(String value) {
		Session session= getSessionFactory().getCurrentSession();
		String sql = "select distinct case";
				for(int i =0; i<8; i++){
					sql += " when  d.add"+(i+1)+" =? then 'add"+(i+1)+"' ";
				}
				sql +=" end from t_duty d ";
		SQLQuery query =  session.createSQLQuery(sql);
		query.setParameter(0, value);
		query.setParameter(1, value);
		query.setParameter(2, value);
		query.setParameter(3, value);
		query.setParameter(4, value);
		query.setParameter(5, value);
		query.setParameter(6, value);
		query.setParameter(7, value);
		Object result = query.uniqueResult();
		if(result!=null){
			return (String)result;
		}
		return null;
	}

	@Override
	public void updEmp(String oldEmp, String newEmp) {
		String sql = "update t_duty set ";
		StringBuffer setStr = new StringBuffer();
		for(int i=1; i<=8;i++){
			if(i ==1) {
				setStr.append(" empid" + i + "=replace(empid"+i+",:oldEmp,:newEmp) ");
			}else {
				setStr.append(", empid" + i + "=replace(empid"+i+",:oldEmp,:newEmp) ");
			}
		}
		sql+=setStr.toString();
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("oldEmp", oldEmp);
		query.setParameter("newEmp", newEmp);
		query.executeUpdate();
	}


}
