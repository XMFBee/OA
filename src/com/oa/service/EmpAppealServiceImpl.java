package com.oa.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.oa.bean.Empappeal;
import com.oa.bean.info.EmpappealInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.dao.EmpAppealDAO;

public class EmpAppealServiceImpl implements EmpAppealService{
	private EmpAppealDAO empAppealDAO;

	@Override
	public Pager4EasyUI<EmpappealInfo> queryById(Pager4EasyUI<EmpappealInfo> pager,String empid,String pass,String hasPass, String beginDay,String endDay){
		Date beginDate  = null;
		Date endDate = null;
		if(beginDay!=null&&!beginDay.equals("")){
			beginDate= WebUtil.str2Date(beginDay, "yyyy-MM-dd");
		}
		if(endDay!=null&&!endDay.equals("")){
			endDate= WebUtil.str2Date(endDay, "yyyy-MM-dd");
		}
		empAppealDAO.baseQuery(pager,null,empid,null,null,pass,hasPass,null,beginDate,endDate);
		return pager;
	}

	
	@Override
	public Pager4EasyUI<EmpappealInfo> queryByBoss(Pager4EasyUI<EmpappealInfo> pager,
			String secondLevel, String pass,String hasPass, String beginDay,String endDay) {
		Date beginDate  = null;
		Date endDate = null;
		if(beginDay!=null&&!beginDay.equals("")){
			beginDate= WebUtil.str2Date(beginDay, "yyyy-MM-dd");
		}
		if(endDay!=null&&!endDay.equals("")){
			endDate= WebUtil.str2Date(endDay, "yyyy-MM-dd");
		}
		empAppealDAO.baseQuery(pager,null,null,"1",secondLevel,pass,hasPass,null,beginDate,endDate);
		return pager;
	}
	
	/*empAppealDAO.baseQuery(pager, depId, empId, firstlevel, hasFirst, secondlevel, hasSecond, pass, hasPass, status, appealDay)*/

	/**
	 * get/set
	 */
	public void setEmpAppealDAO(EmpAppealDAO empAppealDAO) {
		this.empAppealDAO = empAppealDAO;
	}


	@Override
	public Pager4EasyUI<EmpappealInfo> queryByDept(Pager4EasyUI<EmpappealInfo> pager, String depid, String empid,
			String firstLevel, String pass,String hasPass ,String beginDay,String endDay) {
		/*empAppealDAO.baseQuery(pager, depId, empId, firstlevel, hasFirst, secondlevel, hasSecond, pass, hasPass, status, appealDay)*/
		Date beginDate  = null;
		Date endDate = null;
		if(beginDay!=null&&!beginDay.equals("")){
			beginDate= WebUtil.str2Date(beginDay, "yyyy-MM-dd");
		}
		if(endDay!=null&&!endDay.equals("")){
			endDate= WebUtil.str2Date(endDay, "yyyy-MM-dd");
		}
		empAppealDAO.baseQuery(pager,depid,empid,firstLevel,null,pass,hasPass,null,beginDate,endDate);
		return pager;
	}




/*	*//**
	 * COUNT
	 *//*
	@Override
	public int countById(String empid, String pass, String hasPass, String beginDay, String endDay) {
		Date beginDate  = null;
		Date endDate = null;
		if(beginDay!=null&&!beginDay.equals("")){
			beginDate= WebUtil.str2Date(beginDay, "yyyy-MM-dd");
		}
		if(endDay!=null&&!endDay.equals("")){
			endDate= WebUtil.str2Date(endDay, "yyyy-MM-dd");
		}
		return empAppealDAO.baseCount(null,empid,null,null,null,null,pass,hasPass,null,beginDate,endDate);
	}


	@Override
	public int countByBoss(String secondLevel, String hasSecond, String pass, String hasPass, String beginDay,
			String endDay) {
		Date beginDate  = null;
		Date endDate = null;
		if(beginDay!=null&&!beginDay.equals("")){
			beginDate= WebUtil.str2Date(beginDay, "yyyy-MM-dd");
		}
		if(endDay!=null&&!endDay.equals("")){
			endDate= WebUtil.str2Date(endDay, "yyyy-MM-dd");
		}
		return empAppealDAO.baseCount(null,null,null,"1",secondLevel,hasSecond,pass,hasPass,null,beginDate,endDate);
	}


	@Override
	public int countByDept(String depid, String empid, String firstLevel, String hasFirst, String pass, String hasPass,
			String beginDay, String endDay) {
		Date beginDate  = null;
		Date endDate = null;
		if(beginDay!=null&&!beginDay.equals("")){
			beginDate= WebUtil.str2Date(beginDay, "yyyy-MM-dd");
		}
		if(endDay!=null&&!endDay.equals("")){
			endDate= WebUtil.str2Date(endDay, "yyyy-MM-dd");
		}
		return empAppealDAO.baseCount(depid,empid,firstLevel,hasFirst,null,null,pass,hasPass,null,beginDate,endDate);
	}
*/
	
	/**
	 * UPDATE
	 * 
	 */
	@Override
	public void updateLevel(String appealId, String firstlevel, String secondlevel, String pass) {
		empAppealDAO.updateLevel(appealId, firstlevel, secondlevel, pass);
	}


	@Override
	public Empappeal save(Empappeal t) {
		return empAppealDAO.save(t);
	}


	@Override
	public void delete(Empappeal t) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void update(Empappeal t) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public Empappeal queryById(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Empappeal> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Pager4EasyUI<Empappeal> queryPager(String beanName, Pager4EasyUI<Empappeal> pager) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public long count(Serializable beanName) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO Auto-generated method stub
		
	}

}
