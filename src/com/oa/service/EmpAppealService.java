package com.oa.service;

import java.util.Date;

import com.oa.bean.Department;
import com.oa.bean.Empappeal;
import com.oa.bean.info.EmpappealInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface EmpAppealService extends BaseService<Empappeal>{
	public Pager4EasyUI<EmpappealInfo> queryById(Pager4EasyUI<EmpappealInfo> pager,String empid,String pass,String hasPass,String beginDay,String endDay);
	
	public Pager4EasyUI<EmpappealInfo> queryByBoss(Pager4EasyUI<EmpappealInfo> pager,String secondLevel,String pass,String hasPass,String beginDay,String endDay);
	
	public Pager4EasyUI<EmpappealInfo> queryByDept(Pager4EasyUI<EmpappealInfo> pager,String depid, String empid ,String firstLevel,String pass,String hasPass,String beginDay,String endDay);
	
	//public int countById(String empid,String pass,String hasPass,String beginDay,String endDay);
	//public int countByBoss(String secondLevel,String hasSecond,String pass,String hasPass,String beginDay,String endDay);
	//public int countByDept(String depid, String empid ,String firstLevel,String hasFirst,String pass,String hasPass,String beginDay,String endDay);
	
	public void updateLevel(String appealId,String firstlevel,String secondlevel,String pass);
	
	
	
}
