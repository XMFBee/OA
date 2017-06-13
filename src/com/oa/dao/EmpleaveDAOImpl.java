package com.oa.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.oa.bean.Empleave;
import com.oa.bean.info.EmpappealInfo;
import com.oa.bean.info.EmpleaveInfo;
import com.oa.common.bean.Pager4EasyUI;

public class EmpleaveDAOImpl extends AbstractBaseDAO<Empleave> implements EmpleaveDAO{
	@Override
	public Pager4EasyUI<EmpleaveInfo> baseQuery(Pager4EasyUI<EmpleaveInfo> pager, String depId, String empId,
			String firstlevel,  String secondlevel, String pass, String hasPass,
			String status, Date startBegin, Date startEnd, Date endBegin, Date endEnd, Date beginLeave, Date endLeave) {
		
		String sel = "select e.empid za, e.name zb, d.depid zc,d.name zd,ea.leaveid ze,ea.startTime zf,ea.endTime zg,ea.leaveDay zh,ea.des zi,ea.status zj,ea.pass zk,ea.firstlevel zl,ea.secondlevel zm";
		String fro = " from t_empleave ea left join t_emp e on ea.empid = e.empid ";
		String whe = " where ea.leaveday<= :endLeave ";
		String addFro = " left join t_dept d on d.depid = e.depid  ";
		String startTimeWhe = "";
		String endTimeWhe = "";
		String leaveTimeWhe = "";
		
		if(startBegin!=null){	whe += " and ea.starttime >= :startBegin ";	}
		if(startEnd != null) {	whe += " and ea.starttime <= :startEnd ";	}
		if(endBegin!=null){		whe += " and ea.endtime >= :endBegin ";	}
		if(endEnd != null) {	whe += " and ea.endtime <= :endEnd";	}
		if(beginLeave!=null){	whe+= " and ea.leaveday >= :beginLeave ";	}
		if(endLeave==null){ 	endLeave= new Date();}
		
		if(depId!=null && depId !=""){
			whe += " and d.depid=" + depId + " " ;
		}
		if(empId != null && empId!=""){		whe += " and ea.empid=" + empId + " ";	}
		
		if(secondlevel!=null && secondlevel.equals("1")){//第二级已审核,一定是审核过的,如果想找没有审核的就在else里找
			whe += " and ea.secondlevel= 1 ";
		}else {//第二级未审核
			if(firstlevel!=null && firstlevel.equals("1")){//判断第一级是否已经审过了
				//已经审过了
				whe += " and ea.firstlevel = 1 ";
			}else if(firstlevel!=null && firstlevel.equals("0")){//第一级也未审过
				whe += " and ea.firstlevel = 0 ";
			}
				//第一级未审核
		}
		
		if(hasPass!=null&&!hasPass.equals("0")&&!hasPass.equals("")){//是否需要过滤pass,为0则不需要过滤,也就是是否审核到真正结果都无所谓,用于单人用户
			if(pass!=null&&!pass.equals("")){//需要过滤pass,也就是说要么是查询审核完的,要么就是没有审核过的
				if(pass.equals("1")){		//审核过的
					whe += " and ea.pass = 1 ";
				}else if(pass.equals("2")){
					whe += " and ea.pass = 2 ";
				}
			}else {
				whe += " and ea.pass !=0 ";
			}
		}else if(hasPass!=null&&!hasPass.equals("0")&&!hasPass.equals("")){
			whe += " and ea.pass =0 ";
		}
		
		if(status!=null && status.equals("")){
			whe += " and ea.status=" + Integer.valueOf(status) + " ";
		}
		
		String sql = sel + fro + addFro +whe;
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		
		/**
		 * setParam
		 */
		if(startBegin!=null) {query.setParameter("startBegin", startBegin);}
		if(startEnd!=null) {query.setParameter("startEnd", startEnd);}
		if(endBegin!=null) {query.setParameter("endBegin", endBegin);}
		if(endEnd!=null) {query.setParameter("endEnd", endEnd);}
		if(beginLeave!=null) {query.setParameter("beginLeave", beginLeave);}
		query.setParameter("endLeave", endLeave);
		
		List list = query.list();
		List empleaveInfos = new ArrayList();
		for(int i = 0,len = list.size() ; i<len; i++){
			Object[] obj = (Object[]) list.get(i);
			EmpleaveInfo empleaveInfo= new EmpleaveInfo();
		
			empleaveInfo.setEmpId(obj[0].toString());
			empleaveInfo.setEmpName(obj[1].toString());
			empleaveInfo.setDepId(obj[2].toString());
			empleaveInfo.setDepName(obj[3].toString());
			empleaveInfo.setLeaveId(obj[4].toString());
			empleaveInfo.setStartTime((Date)obj[5]);
			empleaveInfo.setEndTime((Date)obj[6]);
			empleaveInfo.setLeaveDay((Date)obj[7]);
			empleaveInfo.setDes(obj[8].toString());
			if(obj[9]!=null){empleaveInfo.setStatus((Integer)obj[9]);}
			if(obj[10]!=null){empleaveInfo.setPass((Integer)obj[10]);}
			if(obj[11]!=null){empleaveInfo.setFirstLeave((int) obj[11]);}
			if(obj[12]!=null){empleaveInfo.setSecondLeave((Integer)obj[12]);}
			empleaveInfos.add(empleaveInfo);
		}
		pager.setRows(empleaveInfos);
		return pager;
	}
	
	@Override
	public int baseCount( String depId, String empId,
			String firstlevel,  String secondlevel, String pass, String hasPass,
			String status, Date startBegin, Date startEnd, Date endBegin, Date endEnd, Date beginLeave, Date endLeave) {
		
		String sel = "select count(ea.leaveid) ";
		String fro = " from t_empleave ea left join t_emp e on ea.empid = e.empid ";
		String whe = " where ea.leaveday<= :endLeave ";
		String addFro = " left join t_dept d on d.depid = e.depid  ";
		String startTimeWhe = "";
		String endTimeWhe = "";
		String leaveTimeWhe = "";
		
		if(startBegin!=null){	whe += " and ea.starttime >= :startBegin ";	}
		if(startEnd != null) {	whe += " and ea.starttime <= :startEnd ";	}
		if(endBegin!=null){		whe += " and ea.endtime >= :endBegin ";	}
		if(endEnd != null) {	whe += " and ea.endtime <= :endEnd";	}
		if(beginLeave!=null){	whe+= " and ea.leaveday >= :beginLeave ";	}
		if(endLeave==null){ 	endLeave= new Date();}
		
		if(depId!=null && depId !=""){
			whe += " and d.depid=" + depId + " " ;
		}
		if(empId != null && empId!=""){		whe += " and ea.empid=" + empId + " ";	}
		
		if(secondlevel!=null && secondlevel.equals("1")){//第二级已审核,一定是审核过的,如果想找没有审核的就在else里找
			whe += " and ea.secondlevel= 1 ";
		}else {//第二级未审核
			if(firstlevel!=null && firstlevel.equals("1")){//判断第一级是否已经审过了
				//已经审过了
				whe += " and ea.firstlevel = 1 ";
			}else{//第一级也未审过
				whe += " and ea.firstlevel = 0 ";
			}
				//第一级未审核
		}
		
		if(hasPass!=null&&!hasPass.equals("0")&&!hasPass.equals("")){//已经审核过了
			if(pass!=null&&!pass.equals("")&&!pass.equals("0")){
				if(pass.equals("1")){
					whe += " and ea.pass = 1 ";
				}else if(pass.equals("2")){
					whe += " and ea.pass = 2 ";
				}
			}else {
				whe += " and ea.pass != 0 ";
			}
		}else {
			whe += " and ea.pass = 0 ";	
		}
		
		if(status!=null && status.equals("")){
			whe += " and ea.status=" + Integer.valueOf(status) + " ";
		}
		
		String sql = sel + fro + addFro +whe;
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		
		/**
		 * setParam
		 */
		if(startBegin!=null) {query.setParameter("startBegin", startBegin);}
		if(startEnd!=null) {query.setParameter("startEnd", startEnd);}
		if(endBegin!=null) {query.setParameter("endBegin", endBegin);}
		if(endEnd!=null) {query.setParameter("endEnd", endEnd);}
		if(beginLeave!=null) {query.setParameter("beginLeave", beginLeave);}
		query.setParameter("endLeave", endLeave);
		
		BigInteger bigInt= (BigInteger) query.uniqueResult();
		return bigInt.intValue();
	}


	/**
	 * 是否同意
	 * 	是:
		 * 判断是否是大于3天,
		 * 	是,pass=0,status=0,first=1
		 *  否,pass=2,first=1,status=1;
	 *  否,pass:1,first=1,status=1;
	 *  
	 * 	
	 * 		
	 */
	@Override
	public void baseUpdFirstLeave(String leaveid,int pass, int status) {
		String sql = "update t_empleave set firstlevel = 1 , pass = ? , status = ? where leaveid = ?";
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter(0, pass);
		query.setParameter(1, status);
		query.setParameter(2, leaveid);
		query.executeUpdate();
	}

	@Override
	public void baseUpdSecondLeave(String leaveid,int pass) {
		String sql = "update t_empleave set secondlevel= 1 , pass = ? , status = 1 where leaveid = ?";
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter(0, pass);
		query.setParameter(1, leaveid);
		query.executeUpdate();
	}
	
	
	
	/*@Override
	public Pager4EasyUI<EmpleaveInfo> baseQuery(Pager4EasyUI<EmpleaveInfo> pager, String depId, String empId,
			String firstlevel, String hasFirst, String secondlevel, String hasSecond, String pass, String hasPass,
			String status, Date startBegin, Date startEnd, Date endBegin, Date endEnd, Date beginLeave, Date endLeave) {
		
		String sel = "select e.empid za, e.name zb, d.depid zc,d.name zd,ea.leaveid ze,ea.startTime zf,ea.endTime zg,ea.leaveDay zh,ea.des zi,ea.status zj,ea.pass zk,ea.firstlevel zl,ea.secondlevel zm";
		String fro = " from t_empleave ea left join t_emp e on ea.empid = e.empid ";
		String whe = " where ea.leaveday<= :endLeave ";
		String addFro = " left join t_dept d on d.depid = e.depid  ";
		String startTimeWhe = "";
		String endTimeWhe = "";
		String leaveTimeWhe = "";
		
		if(startBegin!=null){	whe += " and ea.starttime >= :startBegin ";	}
		if(startEnd != null) {	whe += " and ea.starttime <= :startEnd ";	}
		if(endBegin!=null){		whe += " and ea.endtime >= :endBegin ";	}
		if(endEnd != null) {	whe += " and ea.endtime <= :endEnd";	}
		if(beginLeave!=null){	whe+= " and ea.leaveday >= :beginLeave ";	}
		if(endLeave==null){ 	endLeave= new Date();}
		
		if(depId!=null && depId !=""){
			whe += " and d.depid=" + depId + " " ;
		}
		if(empId != null && empId!=""){		whe += " and ea.empid=" + empId + " ";	}
		
		if(hasFirst!=null && !hasFirst.equals("")){
			if(hasFirst.equals("1")){//第一级有条件,第一级有参数,也就是说获取的第一级有参数
				if(firstlevel!=null){//有限制,没有限制,任何都可以
					whe += " and ea.firstlevel=" + Integer.valueOf(firstlevel) + " ";
				}else {
					whe += " and ea.firstlevel is not null "; 
				}
			}else {//没有第一级条件,查询所有第一级为空的
				whe+=" and ea.firstlevel is null ";
			}
		}
			
		if(hasSecond!=null&&!hasSecond.equals("")){
			if(hasSecond.equals("1")){//获取的第二级有参数
				if(secondlevel!=null){
					whe += " and ea.secondlevel=" + Integer.valueOf(secondlevel)+ " ";
				}else {
					whe += " and ea.secondlevel is not null "; 
				}
			}else {//第二级没有参数
				whe += " and ea.secondlevel is null ";
			}
		}
		if(hasPass!=null&&!hasPass.equals("")){//有约束pass
			if(hasPass.equals("1")){//查找有审核过的
				if(pass!=null){//审核通过与否有条件
					whe += " and ea.pass=" + Integer.valueOf(pass) + " ";
				}else {//审核通过未通过
					whe += " and ea.pass is not null "; 
				}
			}else {//审核中的
				whe += " and ea.pass is null ";
			}
		}	
		
		if(status!=null){
			whe += " and ea.status=" + Integer.valueOf(status) + " ";
		}
		
		String sql = sel + fro + addFro +whe;
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		
		*//**
		 * setParam
		 *//*
		if(startBegin!=null) {query.setParameter("startBegin", startBegin);}
		if(startEnd!=null) {query.setParameter("startEnd", startEnd);}
		if(endBegin!=null) {query.setParameter("endBegin", endBegin);}
		if(endEnd!=null) {query.setParameter("endEnd", endEnd);}
		if(beginLeave!=null) {query.setParameter("beginLeave", beginLeave);}
		query.setParameter("endLeave", endLeave);
		
		List list = query.list();
		List empleaveInfos = new ArrayList();
		for(int i = 0,len = list.size() ; i<len; i++){
			Object[] obj = (Object[]) list.get(i);
			EmpleaveInfo empleaveInfo= new EmpleaveInfo();
		
			empleaveInfo.setEmpId(obj[0].toString());
			empleaveInfo.setEmpName(obj[1].toString());
			empleaveInfo.setDepId(obj[2].toString());
			empleaveInfo.setDepName(obj[3].toString());
			empleaveInfo.setLeaveId(obj[4].toString());
			empleaveInfo.setStartTime((Date)obj[5]);
			empleaveInfo.setEndTime((Date)obj[6]);
			empleaveInfo.setLeaveDay((Date)obj[7]);
			empleaveInfo.setDes(obj[8].toString());
			if(obj[9]!=null){empleaveInfo.setStatus((Integer)obj[9]);}
			if(obj[10]!=null){empleaveInfo.setPass((Integer)obj[10]);}
			if(obj[11]!=null){empleaveInfo.setFirstLeave((int) obj[11]);}
			if(obj[12]!=null){empleaveInfo.setSecondLeave((Integer)obj[12]);}
			empleaveInfos.add(empleaveInfo);
		}
		pager.setRows(empleaveInfos);
		return pager;
	}*/

	/*@Override
	public int baseCount(String depId, String empId, String firstlevel, String hasFirst, String secondlevel,
			String hasSecond, String pass, String hasPass, String status, Date startBegin, Date startEnd, Date endBegin,
			Date endEnd, Date beginLeave, Date endLeave) {
		String sel = "select count(ea.leaveid) ";
		String fro = " from t_empleave ea left join t_emp e on ea.empid = e.empid ";
		String whe = " where ea.leaveday<= :endLeave ";
		String addFro = " left join t_dept d on d.depid = e.depid  ";
		String startTimeWhe = "";
		String endTimeWhe = "";
		String leaveTimeWhe = "";
		
		if(startBegin!=null){	whe += " and ea.starttime >= :startBegin ";	}
		if(startEnd != null) {	whe += " and ea.starttime <= :startEnd ";	}
		if(endBegin!=null){		whe += " and ea.endtime >= :endBegin ";	}
		if(endEnd != null) {	whe += " and ea.endtime <= :endEnd";	}
		if(beginLeave!=null){	whe+= " and ea.leaveday >= :beginLeave ";	}
		if(endLeave==null){ 	endLeave= new Date();}

		if(depId!=null && depId !=""){			whe += " and d.depid=" + depId + " " ;		}
		if(empId != null && empId!=""){		whe += " and ea.empid=" + empId + " ";	}
		
		if(hasFirst!=null && !hasFirst.equals("")){
			if(hasFirst.equals("1")){//第一级有条件,第一级有参数,也就是说获取的第一级有参数
				if(firstlevel!=null){//有限制,没有限制,任何都可以
					whe += " and ea.firstlevel=" + Integer.valueOf(firstlevel) + " ";
				}else {
					whe += " and ea.firstlevel is not null "; 
				}
			}else {//没有第一级条件,查询所有第一级为空的
				whe+=" and ea.firstlevel is null ";
			}
		}
			
		if(hasSecond!=null&&!hasSecond.equals("")){
			if(hasSecond.equals("1")){//获取的第二级有参数
				if(secondlevel!=null){
					whe += " and ea.secondlevel=" + Integer.valueOf(secondlevel)+ " ";
				}else {
					whe += " and ea.secondlevel is not null "; 
				}
			}else {//第二级没有参数
				whe += " and ea.secondlevel is null ";
			}
		}
		if(hasPass!=null&&!hasPass.equals("")){//有约束pass
			if(hasPass.equals("1")){//查找有审核过的
				if(pass!=null){//审核通过与否有条件
					whe += " and ea.pass=" + Integer.valueOf(pass) + " ";
				}else {//审核通过未通过
					whe += " and ea.pass is not null "; 
				}
			}else {//审核中的
				whe += " and ea.pass is null ";
			}
		}	
		
		if(status!=null){			whe += " and ea.status=" + Integer.valueOf(status) + " ";		}
		
		String sql = sel + fro + addFro +whe;
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		
		*//**
		 * setParam
		 *//*
		if(startBegin!=null) {query.setParameter("startBegin", startBegin);}
		if(startEnd!=null) {query.setParameter("startEnd", startEnd);}
		if(endBegin!=null) {query.setParameter("endBegin", endBegin);}
		if(endEnd!=null) {query.setParameter("endEnd", endEnd);}
		if(beginLeave!=null) {query.setParameter("beginLeave", beginLeave);}
		query.setParameter("endLeave", endLeave);		
		BigInteger bigInt= (BigInteger) query.uniqueResult();
		return bigInt.intValue();
	}*/


}
