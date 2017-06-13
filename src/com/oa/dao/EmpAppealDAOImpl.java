package com.oa.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.oa.bean.Duty;
import com.oa.bean.Empappeal;
import com.oa.bean.info.EmpappealInfo;
import com.oa.common.bean.Pager4EasyUI;

public class EmpAppealDAOImpl  extends AbstractBaseDAO<Empappeal> implements EmpAppealDAO{

	@Override
	public Pager4EasyUI<EmpappealInfo> baseQuery(Pager4EasyUI<EmpappealInfo> pager, String depId, String empId,
			String firstlevel, String secondlevel, String pass,String hasPass, String status,Date beginDay,Date endDay) {
		String sel = "select e.empid za, e.name zb, d.depid zc,d.name zd,ea.appealid ze,ea.appealDay zf,ea.des zg,ea.status zh,ea.firstlevel zi,ea.secondlevel zj,ea.pass zk";
		String fro = " from t_empappeal ea left join t_emp e on ea.empid = e.empid ";
		String whe = " where ea.appealday < ? ";
		String addFro = " left join t_dept d on d.depid = e.depid  ";
		if(depId!=null && depId !=""){
			whe += " and d.depid=" + depId + " " ;
		}
		if(empId != null && empId!=""){
			whe += " and ea.empid=" + empId + " ";
		}
		
		if(secondlevel!=null && secondlevel.equals("1")){//第二级已审核,一定是审核过的,如果想找没有审核的就在else里找
			whe += " and ea.secondlevel= 1 ";
		}else {//第二级未审核
			if(firstlevel!=null && firstlevel.equals("1")){//判断第一级是否已经审过了
				//已经审过了
				whe += " and ea.firstlevel = 1 ";
			}else if(firstlevel!=null&&firstlevel.equals("0")){//第一级也未审过
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
		}else if(hasPass!=null&&hasPass.equals("0")&&!hasPass.equals("")){
			whe += " and ea.pass =0 ";
		}
		
		
			
		
		if(status!=null){
			whe += " and ea.status=" + Integer.valueOf(status) + " ";
		}
		if(endDay==null){
			endDay = new Date();
		}
		if(beginDay != null) {
			whe += " and ea.appealday >=? ";
		}
		
		String sql = sel + fro + addFro +whe;
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter(0, endDay);
		if(beginDay!=null) {
			query.setParameter(1, beginDay);
		}
		List list = query.list();
		List empAppealInfos = new ArrayList();
		for(int i = 0,len = list.size() ; i<len; i++){
			Object[] obj = (Object[]) list.get(i);
			EmpappealInfo empAppealInfo = new EmpappealInfo();
		
			empAppealInfo.setEmpId(obj[0].toString());
			empAppealInfo.setEmpName(obj[1].toString());
			empAppealInfo.setDepId(obj[2].toString());
			empAppealInfo.setDepName(obj[3].toString());
			empAppealInfo.setAppealId(obj[4].toString());
			empAppealInfo.setAppealDay((Date)obj[5]);
			if(obj[6]!=null){
				empAppealInfo.setDes(obj[6].toString());
			}
			empAppealInfo.setStatus((Integer)obj[7]);
			if(obj[8]!=null){
				empAppealInfo.setFirstLeave((Integer)obj[8]);}
			if(obj[9]!=null){
				empAppealInfo.setSecondLeave((Integer)obj[9]);
			}
			if(obj[10]!=null){
				empAppealInfo.setPass((Integer)obj[10]);
			}
			empAppealInfos.add(empAppealInfo);
		}
		pager.setRows(empAppealInfos);
		return pager;
	}

	@Override
	public void updateLevel(String appealId, String firstlevel, String secondlevel, String pass) {
		Session session = getSessionFactory().getCurrentSession();
		String firstStr= "";
		String secondStr="";
		String passStr = "";
		String statuStr = "";
		String updStr = "update t_empappeal set ";
		String wheStr = " where appealId='"+appealId+"' ";
		if(firstlevel!=null&&!firstlevel.equals("")){
			passStr+=" firstlevel = "+firstlevel+" ";
			if(pass.equals("1")){
				passStr+=" ,pass=1 ";
				statuStr += " ,status= "+1;
			}
		}else if(secondlevel!=null&&!secondlevel.equals("")){
			secondStr+=" secondlevel = " + secondlevel+" " ;
			passStr+=" ,pass=" + Integer.parseInt(pass)+ " ";
			statuStr += " ,status= "+1;
		}
		String sql = updStr + firstStr+ secondStr + passStr+ statuStr+ wheStr;
		SQLQuery query = session.createSQLQuery(sql);
		query.executeUpdate();
	}
	
	
/*	@Override
	public int baseCount(String depId, String empId,
			String firstlevel, String secondlevel, String pass,String hasPass, String status,Date beginDay,Date endDay) {
		String sel = "select count(ea.appealid) ";
		String fro = " from t_empappeal ea left join t_emp e on ea.empid = e.empid ";
		String whe = " where ea.appealday < ? ";
		String addFro = " left join t_dept d on d.depid = e.depid  ";
		if(depId!=null && depId !=""){
			whe += " and d.depid=" + depId + " " ;
		}
		if(empId != null && empId!=""){
			whe += " and ea.empid=" + empId + " ";
		}
		
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
		if(endDay==null){
			endDay = new Date();
		}
		if(beginDay != null) {
			whe += " and ea.appealday >=? ";
		}
		
		String sql = sel + fro + addFro +whe;
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter(0, endDay);
		if(beginDay!=null) {
			query.setParameter(1, beginDay);
		}
		BigInteger bigInte = (BigInteger) query.uniqueResult();
		return bigInte.intValue();
	}*/

}
