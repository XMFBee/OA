package com.oa.dao;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.oa.bean.EmpChecking;
import com.oa.bean.EmpCheckingInfo;
import com.oa.bean.info.EmpCheckingStatistics;
import com.oa.bean.info.EmpCheckingVOInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.TempDate;
import com.oa.common.web.WebUtil;

public class EmpCheckingDAOImpl extends AbstractBaseDAO<EmpChecking> implements EmpCheckingDAO{

	/**
	 * 
	 */
	@Override
	public Pager4EasyUI<EmpCheckingVOInfo> queryPagerInfo(Pager4EasyUI<EmpCheckingVOInfo> pager,String depid,String empid ,String empName,Date beginDate, Date endDate,String sort, String order) {
		StringBuffer whe = new StringBuffer();
		if(empid!=null && !empid.equals("")){	whe.append(" and ec.empid =:empid");}	
		if(depid!=null&& !depid.equals("")){whe.append(" and d.depid =:depid");}
		if(empName!=null&&!empName.equals("")){ whe.append(" and e.name like :empName"); }
		String orderby = "";
		String wheDate= " ec.checkingDay <= :endDate";
		if(beginDate!=null) {			wheDate += " and ec.checkingDay  >= :beginDate ";		}
		String sql  = "select ec.checkingId,e.empId,e.Name,d.depid,d.name name1,ec.time1, ec.time2,ec.time3,ec.time4,ec.time5,ec.time6,ec.time7,ec.time8 ,ec.checkingDay from t_empchecking ec left join t_emp e on ec.empid = e.empid left join t_dept d on e.depid = d.depid where " + wheDate ;
		
		if(sort!=null&&!sort.equals("")){
			orderby += " order by ec." +sort + " " + order; 
		}
		
		Session session = sessionFactory.getCurrentSession();
	        SQLQuery query = session.createSQLQuery(sql + whe+ orderby);
	        if(depid!=null&& !depid.equals("")){	query.setParameter("depid", depid);}
	        if(empid!=null && !empid.equals("")){	query.setParameter("empid", empid);}
	        if(empName!=null && !empName.equals("")){	query.setParameter("empName", empName);}
	        if(beginDate!=null){
	        	query.setParameter("beginDate", beginDate);
	        }
	        query.setParameter("endDate",endDate);
	        query.setFirstResult(pager.getBeginIndex());
	        query.setMaxResults(pager.getPageSize());
	        
	        List<Object[]> list =  query.list();
	        List<EmpCheckingVOInfo> voCheckings = null;
	        if(list!=null) {
	        	voCheckings = new ArrayList<EmpCheckingVOInfo>();
	        	for(int i = 0,len=list.size(); i<len; i++) {
	        		EmpCheckingVOInfo voChecking =new EmpCheckingVOInfo();
	        		Object[] obj = list.get(i);
	        		
	        		voChecking.setEmpCheckingId(obj[0].toString());
	        		voChecking.setEmpId(obj[1].toString());
	        		voChecking.setEmpName(obj[2].toString());
	        		
	        		voChecking.setDepId(obj[3].toString());
	        		voChecking.setDepName(obj[4].toString());
	        		
	        		
	        		voChecking.setTime1((Time) obj[5]);
	        		voChecking.setTime2((Time) obj[6]);
	        		voChecking.setTime3((Time) obj[7]);
	        		voChecking.setTime4((Time) obj[8]);
	        		voChecking.setTime5((Time) obj[9]);
	        		voChecking.setTime6((Time) obj[10]);
	        		voChecking.setTime7((Time) obj[11]);
	        		voChecking.setTime8((Time) obj[12]);
	        		
	        		voChecking.setCheckingDay((Date)obj[13]);
	        		voCheckings.add(voChecking);
	        	}
	        }
	        pager.setRows(voCheckings);
	        return pager;
	}

	
	/**
	 * 考勤总结用
	 * @param pager需要分页的,还要返回给页面
	 * @param norms标准时间
	 * @param begin开始计算的时间(用于where条件)
	 * @param end结束计算的时间(用于where条件)
	 * @param format
	 * @return
	 */
	@Override
	public Pager4EasyUI<EmpCheckingStatistics> queryCheck4Base(Pager4EasyUI<EmpCheckingStatistics> pager,String depid,List<EmpCheckingInfo> norms,String empid,String empName,Date begin,Date end,String format,String sort, String order) {
		String sql = "select e.empid,e.name ename,d.depid,d.name dname,ec.checkingday,count(DISTINCT(el.leaveid)),";
		int num = norms.size();//打卡次数
		StringBuffer late =new StringBuffer("sum(");
		StringBuffer forget=new StringBuffer("sum(");
		if(num==0){
			late.append( "0) latecount," );
			forget.append("0) forgetcount ") ;
		}
		for(int i = 0; i<num ;i++) {//打卡次数限制于info,所以需要循环num
			String normStr = norms.get(i).getCheckingTime(); //标准时间1; 
			String[] normStrs = normStr.split(format);
			Time normTime1 =TempDate.str2Time(normStrs[0]);
			Time normTime2 =TempDate.str2Time(normStrs[1]);
			if(i!=num-1){	late.append("(case when ec.time"+(i+1)+" !='' and (ec.time"+(i+1)+" < ? or ec.time"+(i+1)+" > ?)then 1 else 0 end)+");
			}else {		late.append("(case when ec.time"+(i+1)+" !='' and (ec.time"+(i+1)+" < ? or ec.time"+(i+1)+" > ?) then 1 else 0 end))  latecount,");
			}
			
			if(i!=num-1){	forget.append("(case when ec.time"+(i+1)+" ='' or ec.time"+(i+1)+" is null then 1 else 0 end)+");
			}else {	forget.append("(case when ec.time"+(i+1)+" ='' or ec.time"+(i+1)+" is null then 1 else 0 end))  forgetcount ");
			}
		}
		
		Date[] dates = null;
		Calendar calendar=Calendar.getInstance();
		if(begin!=null){	calendar.setTime(begin);		}
		if(end!=null){calendar.setTime(end);		}
		int mon =calendar.get(Calendar.MONTH)+1;
		dates =TempDate.inMoth2Date(mon);	
		
		
		String fro= "  from t_empchecking ec right join t_emp e on ec.empid=e.empid left join t_dept d on e.depid = d.depid ";
		String leave = "left join (select leaveid,empid from  t_empleave where starttime>=:starttime and endtime<=:endtime and pass = 2 ) as el on e.empid = el.empid ";
		
		StringBuffer where = new StringBuffer("where  ec.checkingday <= :endDate ");
		if(depid!=null&& !depid.equals("")){where.append(" and d.depid = :depid ");}
		if(empid!=null&&!empid.equals("")){where.append(" and e.empid = :empid");}
		if(empName!=null&&!empName.equals("")){empName = WebUtil.vague(empName);where.append(" and e.empName = :empName");}
		if(begin!=null){where.append(" and ec.checkingday >= :beginDate "); 	}
		if(end==null){end = new Date();}
		if(sort!=null&&!sort.equals("")){if(order != null&&!order.equals("")){where.append(" and ec."+sort + " " + order + " ");}}
		
		
		
		String groupby = " group by ec.empid ";
		Session session = sessionFactory.getCurrentSession();
	    Query query = session.createSQLQuery(sql + late + forget+ fro + leave+ where + groupby);
	    String str = sql + late + forget+ fro + where + groupby;
	    int j = 1;
	    for(int i = 1; i<=num ; i+=1){
	    	String normStr = norms.get(i-1).getCheckingTime(); //标准时间1; 
			String[] normStrs = normStr.split(format);
			Time normTime1 =TempDate.str2Time(normStrs[0]);
			Time normTime2 =TempDate.str2Time(normStrs[1]);
			int i1= i*2-2;
			int i2 = i*2-1;
			query.setParameter(i*2-2, normTime1);
			query.setParameter(i*2-1, normTime2);
			j = i+1;
	    }
		    
		    query.setParameter("endDate",end);
		    if(begin!=null){query.setParameter("beginDate",begin);}
		    if(depid!=null&& !depid.equals("")){query.setParameter("depid",depid);}
		    if(empid!=null&&!empid.equals("")){query.setParameter("empid", empid);}
		    if(empName!=null&&!empName.equals("")){query.setParameter("empName", empName);}
		    query.setParameter("starttime",dates[0]);
		    query.setParameter("endtime",dates[1]);
		    query.setFirstResult((pager.getPageNo()-1)*pager.getPageSize());
		    query.setMaxResults(pager.getPageSize());
		List list = query.list();
	    List<EmpCheckingStatistics> checkings = new ArrayList<EmpCheckingStatistics>();
	    for(int i = 0,len=list.size(); i<len ;i++){
	    	Object[] obj = (Object[]) list.get(i);
	    	EmpCheckingStatistics checkingStatistics = new EmpCheckingStatistics();
	    	checkingStatistics.setEmpid((String) obj[0]);
	    	checkingStatistics.setEmpname((String) obj[1]);
	    	checkingStatistics.setDepid((String) obj[2]);
	    	checkingStatistics.setDepname((String) obj[3]);
	    	checkingStatistics.setCheckingday((Date) obj[4]);
	    	if(obj[5]!=null){ BigInteger leaveNum = (BigInteger) obj[5]; checkingStatistics.setLeaveCount(leaveNum.intValue());}
	    	if(obj[6]!=null){BigDecimal laterC = (BigDecimal) obj[6];checkingStatistics.setLaterCount(laterC.intValue());}
	    	if(obj[7]!=null){BigDecimal forgetC= (BigDecimal)obj[7];checkingStatistics.setForgetCount(forgetC.intValue());}
	    	checkings.add(checkingStatistics);
	    }
	    pager.setRows(checkings);
		return pager;
		
	}

	/**
	 * 在导出为excel,需要的批量查询
	 */
	@Override
	public List<EmpCheckingVOInfo> queryByIds(String[] ids) {
		String selStr="select d.name dname,e.empid eid ,e.name ename,ec.checkingday ecday,ec.time1 ect1,ec.time2 ect2,ec.time3 ect3,ec.time4 ect4,ec.time5 ect5,ec.time6 ect6,ec.time7 ect7,ec.time8 ect8 ";
		String fromStr = " from t_empchecking ec left join t_emp e on ec.empid = e.empid left join t_dept d on e.depid = d.depid ";
		String wheStr = " where ec.checkingid in ( ";
		String inStr ="";
		String orderStr = " order by d.depid ,ec.empid ";
		for(int i = 0,len = ids.length; i<len; i++){
			if(i!=0) {
				inStr += (",:id" + i); 
			}else if(i==0) {
				inStr += (":id"+i);
			}
		}
		inStr += ")";
		String sql = selStr + fromStr + wheStr + inStr + orderStr;
		Session session = sessionFactory.getCurrentSession();
	    Query query = session.createSQLQuery(sql);
	    for(int i = 0,len = ids.length; i<len; i++){
	    	query.setParameter("id" + i, ids[i]);
	    }
	    List result= query.list();
	    
	    List<EmpCheckingVOInfo> voCheckings = null;
        if(result!=null) {
        	voCheckings = new ArrayList<EmpCheckingVOInfo>();
        	for(int i = 0,len=result.size(); i<len; i++) {
        		EmpCheckingVOInfo voChecking =new EmpCheckingVOInfo();
        		Object[] obj = (Object[]) result.get(i);
        		
        		voChecking.setEmpName(obj[0].toString());
        		voChecking.setEmpId(obj[1].toString());
        		voChecking.setEmpName(obj[2].toString());
        		voChecking.setCheckingDay((Date)obj[3]);
        		
        		voChecking.setTime1((Time) obj[4]);
        		voChecking.setTime2((Time) obj[5]);
        		voChecking.setTime3((Time) obj[6]);
        		voChecking.setTime4((Time) obj[7]);
        		voChecking.setTime5((Time) obj[8]);
        		voChecking.setTime6((Time) obj[9]);
        		voChecking.setTime7((Time) obj[10]);
        		voChecking.setTime8((Time) obj[11]);
        		
        		voCheckings.add(voChecking);
        	}
        }
		return voCheckings;
	}




	@Override
	public int countInfo(String depid,String empid, String empName, Date beginDate, Date endDate) {
		StringBuffer whe = new StringBuffer();;
		if(empid!=null && !empid.equals("")){ whe.append(" and ec.empid =:empid");		}
		if(depid!=null&& !depid.equals("")){whe.append(" and d.depid =:depid");}
		if(empName!=null&&!empName.equals("")){whe.append(" and e.name like :empName"); }
		String wheDate= " ec.checkingDay <= :endDate";
		if(beginDate!=null) {			wheDate += " and ec.checkingDay  >= :beginDate ";		}
		String sql  = "select ec.checkingId where " + wheDate ;
		
		Session session = sessionFactory.getCurrentSession();
	        SQLQuery query = session.createSQLQuery(sql + whe);
	        if(depid!=null&& !depid.equals("")){query.setParameter("depid", depid);}
	        if(empid!=null && !empid.equals("")){	query.setParameter("empid", empid);}
	        if(empName!=null && !empName.equals("")){	query.setParameter("empName", empName);}
	        if(beginDate!=null){
	        	query.setParameter("beginDate", beginDate);
	        }
	        query.setParameter("endDate",endDate);
	        
	        BigInteger count=  (BigInteger) query.uniqueResult();
	        return count.intValue();
	}




	


	/**
	 * 暂时没有用的方法...
	 * @param pager
	 * @param depid	部门id,有则是查部门
	 * @param empid	员工id,有则是查某员工
	 * @param vagueStr 员工姓名模糊
	 * @param begin	开始日期
	 * @param end 	结束日期
	 * @param count 打卡次数
	 * @return
	 * @throws NoSuchMethodException
	 * @throws SecurityException
	 */
	/*private Pager4EasyUI<EmpCheckingVOInfo> queryCheckByBase(Pager4EasyUI<EmpCheckingVOInfo> pager ,String depid, String empid ,String vagueStr,Date begin,Date end,int count) throws NoSuchMethodException, SecurityException{
		String depwhe = "";
		String empwhe = "";
		String vague = "";
		
		if(depid!=null){
			depwhe = " and d.depid = "+ depid;
		}
		if(empid!=null){
			empwhe = " and e.empid = " + empid;
		}
		if(vagueStr!=null){
			vague = " and e.name like '"+vagueStr+"'";
		}
		String sql = "select e.empid, e.name, d.depid,d.name,";
		for(int i= 0; i<count; i++){
			if(i!=count-1){
				sql += " time"+(i+1)+ ",";
			}else {
				sql += " time"+(i+1);
			}
		}
		sql += " from t_empchecking ec left join t_emp e left join t_dept d where ec.checkingday >=? and ec.checkingday <=? " + 
				depwhe + empwhe + vague;
		
		 Session session = sessionFactory.getCurrentSession();
	     Query query = session.createSQLQuery(sql);
	     query.setFirstResult((pager.getPageNo()-1)*pager.getPageSize());
	     query.setMaxResults(pager.getPageSize());
	     List result = query.list();
	     List<EmpCheckingVOInfo> empCheckings = new ArrayList<EmpCheckingVOInfo>();
	     for(int i = 0,len = result.size(); i<len; i++){
	    	 EmpCheckingVOInfo empChecking = new EmpCheckingVOInfo();
	    	 Object[] obj = (Object[]) result.get(i);
	    	 empChecking.setEmpId(obj[0].toString());
	    	 empChecking.setEmpName(obj[1].toString());
	    	 empChecking.setDepId(obj[2].toString());
	    	 empChecking.setDepName(obj[3].toString());
	         Class clazz = empChecking.getClass();
	         try {
	        	for(int j = 0,lenj=obj.length-4; j<lenj; j++){
	        		Method m1 = clazz.getDeclaredMethod("setTime"+j,Date.class);
	        		Date date = (Date) obj[j+4];
	        		m1.invoke(empChecking ,date);
	        	}
			} catch (Exception e) {
				e.printStackTrace();
			}
	        empCheckings.add(empChecking);
	     }
	     pager.setRows(empCheckings);
		return pager;
	}
	
	*/

	

}





