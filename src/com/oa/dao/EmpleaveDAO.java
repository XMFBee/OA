package com.oa.dao;

import java.util.Date;

import com.oa.bean.Empleave;
import com.oa.bean.info.EmpleaveInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface EmpleaveDAO extends BaseDAO<Empleave>{
	public Pager4EasyUI<EmpleaveInfo> baseQuery(Pager4EasyUI<EmpleaveInfo> pager, String depId, String empId,
			String firstlevel,  String secondlevel, String pass, String hasPass,
			String status, Date startBegin, Date startEnd, Date endBegin, Date endEnd, Date beginLeave, Date endLeave) ;
	
	
	public int baseCount(String depId,String empId, String firstlevel, String secondlevel, String pass,String hasPass, String status,Date startBegin,Date startEnd,Date endBegin,Date endEnd,Date beginLeave,Date endLeave);
	
	/**
	 * 修改status,pass,与当前等级,
	 * 
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
	public void baseUpdFirstLeave(String leaveid,int pass,int status);
	
	/**
	 * 是否同意
	 * 	是:pass=2,status=1,second=1;
	 * 否:pass= 1,status=1,second=1
	 */
	public void baseUpdSecondLeave(String leaveid,int pass);
	
}
