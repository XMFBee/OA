package com.oa.service;

import java.util.List;

import com.oa.bean.Duty;
import com.oa.bean.info.DutyInfo;

public interface DutyService extends BaseService<Duty>{
	public List<Duty> queryTab();
	
	public List<Duty> currDuty();
	
	public List<String> queryAddress();
	public void updateDuty(Duty duty) ;
	
	public void addAddress(String address);
	
	public void updAddress(String oldAdd, String newAdd);
	
	public void updEmp(String oldEmp, String newEmp) ;
}
