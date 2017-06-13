package com.oa.dao;

import java.util.Date;

import com.oa.bean.Duty;
import com.oa.bean.Empappeal;
import com.oa.bean.info.EmpappealInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface EmpAppealDAO  extends BaseDAO<Empappeal> {
	public Pager4EasyUI<EmpappealInfo> baseQuery(Pager4EasyUI<EmpappealInfo> pager,String depId,String empId, String firstlevel, String secondlevel, String pass,String hasPass, String status,Date beginDay,Date endDay);
	
	/*public int baseCount(String depId, String empId,String firstlevel, String secondlevel, String pass,String hasPass, String status,Date beginDay,Date endDay);
*/	
	public void updateLevel(String appealId,String firstlevel,String secondlevel,String pass);
}
