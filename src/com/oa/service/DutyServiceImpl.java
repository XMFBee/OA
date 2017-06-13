package com.oa.service;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.oa.bean.Duty;
import com.oa.bean.info.DutyInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.DutyDAO;

public class DutyServiceImpl implements DutyService {
	private DutyDAO dutyDAO;

	@Override
	public Duty save(Duty t) {
		return dutyDAO.save(t);
	}

	@Override
	public void delete(Duty t) {
		dutyDAO.delete(t);
	}

	@Override
	public void update(Duty t) {
		dutyDAO.update(t);
	}

	@Override
	public Duty queryById(Class<?> clazz, Serializable id) {
		return dutyDAO.queryById(clazz, id);
	}

	@Override
	public List<Duty> queryAll(Serializable beanName) {
		return dutyDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<Duty> queryPager(String beanName, Pager4EasyUI<Duty> pager) {
		return dutyDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return dutyDAO.count(beanName);
	}

	/**
	 * get/set
	 * @return
	 */
	public DutyDAO getDutyDAO() {
		return dutyDAO;
	}

	public void setDutyDAO(DutyDAO dutyDAO) {
		this.dutyDAO = dutyDAO;
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Duty> queryTab() {
		return dutyDAO.queryTab();
	}

	@Override
	public List<String> queryAddress() {
		return dutyDAO.queryAddress();
	}

	@Override
	public List<Duty> currDuty() {
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int[] weekdays = {7,1,2,3,4,5,6};
		int weekday = weekdays[cal.get(Calendar.DAY_OF_WEEK) - 1];
		return dutyDAO.currDuty(weekday);
	}
	@Override
	public void updateDuty(Duty duty) {
		dutyDAO.updateDuty(duty);
	}
	
	@Override
	public void addAddress(String address) {
		String addressid = dutyDAO.queryNullAddress();
		if(addressid!=null){
			dutyDAO.addAddress(addressid,address);
		}else {
			Duty duty = new Duty();
			duty.setWeekday("1");
			duty.setAdd1(address);
			dutyDAO.save(duty);
		}
	}

	@Override
	public void updAddress(String oldAdd, String newAdd){
		 dutyDAO.updAddress(oldAdd,newAdd);
	}

	@Override
	public void updEmp(String oldEmp, String newEmp) {
		dutyDAO.updEmp(oldEmp, newEmp);
	}

}
