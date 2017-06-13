package com.oa.service;

import com.oa.bean.Empleave;
import com.oa.bean.info.EmpleaveInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface EmpleaveService extends BaseService<Empleave>{
	public Pager4EasyUI<EmpleaveInfo> queryById(Pager4EasyUI<EmpleaveInfo> pager,String empid,String pass,String hasPass,String startBegin,String startEnd,String endBegin,String endEnd,String beginLeave,String endLeave);
	
	public Pager4EasyUI<EmpleaveInfo> queryByDept(Pager4EasyUI<EmpleaveInfo> pager,String depid, String empid ,String firstLevel,String pass,String hasPass,String startBegin,String startEnd,String endBegin,String endEnd,String beginLeave,String endLeave);

	public Pager4EasyUI<EmpleaveInfo> queryByBoss(Pager4EasyUI<EmpleaveInfo> pager,String secondLevel,String pass,String hasPass,String startBegin,String startEnd,String endBegin,String endEnd,String beginLeave,String endLeave);
	
	
	public int countById(String empid,String pass,String hasPass,String startBegin,String startEnd,String endBegin,String endEnd,String beginLeave,String endLeave);

	
	public int countByDept(String depid, String empid ,String firstLevel,String pass,String hasPass,String startBegin,String startEnd,String endBegin,String endEnd,String beginLeave,String endLeave);
	
	public int countByBoss(String secondLevel,String pass,String hasPass,String startBegin,String startEnd,String endBegin,String endEnd,String beginLeave,String endLeave);

	public void baseUpdFirstLeave(String leaveid,String pass,int status);
	
	public void baseUpdSecondLeave(String leaveid, String pass);
	
}
