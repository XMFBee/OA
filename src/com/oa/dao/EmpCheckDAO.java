package com.oa.dao;

import java.util.Date;

import com.oa.bean.Check;
import com.oa.bean.info.EmpCheckInfo;
/**
 * 员工值班DAO
 * @author 程燕
 *
 */
import com.oa.common.bean.Pager4EasyUI;
public interface EmpCheckDAO  extends BaseDAO<Check>{
	public Pager4EasyUI<EmpCheckInfo> queryByPager(Pager4EasyUI<EmpCheckInfo> pager,Date beginDate,Date endDate ,String addType ,String address, String empid,String empName,String sort,String order);
	
	public int countNorm(Date[] date ,String addType ,String address, String empid);
}
