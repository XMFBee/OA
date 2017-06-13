package com.oa.dao;

import java.util.List;

import com.oa.bean.Duty;
import com.oa.bean.info.DutyInfo;

public interface DutyDAO extends BaseDAO<Duty> {
	public List<Duty> queryTab();
	
	public List<String> queryAddress();
	
	public List<Duty> currDuty(int weekday);
	
	public void updateDuty(Duty duty);
	
	
	public void addAddress(String addressid,String address);//添加巡查地址
	
	public String queryNullAddress();//得到为空的地址
	
	public void updAddress(String oldAdd, String newAdd);
	
	public void updEmp(String oldEmp, String newEmp);
}
