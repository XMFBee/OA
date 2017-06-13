package com.oa.service;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import com.oa.bean.EmpChecking;
import com.oa.bean.EmpCheckingInfo;
import com.oa.bean.info.EmpCheckingStatistics;
import com.oa.bean.info.EmpCheckingVOInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.TempDate;
import com.oa.common.web.WebUtil;
import com.oa.dao.EmpCheckingDAO;

public class EmpCheckingServiceImpl implements EmpCheckingService{
	private EmpCheckingDAO empCheckingDAO;
	
	private CheckingService checkingService;


	@Override
	public EmpChecking save(EmpChecking t) {
		return empCheckingDAO.save(t);
	}

	@Override
	public void delete(EmpChecking t) {
		empCheckingDAO.delete(t);
	}

	@Override
	public void update(EmpChecking t) {
		empCheckingDAO.update(t);
	}

	@Override
	public EmpChecking queryById(Class<?> clazz, Serializable id) {
		return empCheckingDAO.queryById(clazz, id);
	}

	@Override
	public List<EmpChecking> queryAll(Serializable beanName) {
		return empCheckingDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<EmpChecking> queryPager(String beanName, Pager4EasyUI<EmpChecking> pager) {
		return empCheckingDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return empCheckingDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		empCheckingDAO.updateStatus(beanName, beanId, status, id);
	}
	
	/**
	 * 查询考勤详情
	 */
	@Override
	public Pager4EasyUI<EmpCheckingVOInfo> queryPagerInfo(Pager4EasyUI<EmpCheckingVOInfo> pager,String depid, String empid,String empName,
			String beginDate, String endDate,String sort , String order) {
		Date begin = null;
		Date end = null;
		if(beginDate!=null&&!beginDate.equals("")){
			begin = WebUtil.str2Date(beginDate, "yyyy-MM-dd");
		}
		if(endDate!=null&&!endDate.equals("")){			end = WebUtil.str2Date(endDate, "yyyy-MM-dd");		}
		else {end = new Date();}
		if(empName!=null) {empName = WebUtil.vague(empName);}
		return empCheckingDAO.queryPagerInfo(pager,depid, empid, empName, begin, end, sort, order);
	}
	
	/**
	 * 以月查考勤详情
	 */
	@Override
	public Pager4EasyUI<EmpCheckingVOInfo> queryPagerInfo4Moth(Pager4EasyUI<EmpCheckingVOInfo> pager,String depid, String empid,String empName,
			int month,String sort,String order) {
		Calendar calendar=Calendar.getInstance();
		
		Date[] dates = null;
		
		if(month!=0){			dates =TempDate.inMoth2Date(month);		}
		else {			int mon =calendar.get(Calendar.MONTH)+1;dates =TempDate.inMoth2Date(mon);		}
		if(empName!=null) {empName = WebUtil.vague(empName);}
		return empCheckingDAO.queryPagerInfo(pager, depid ,empid,empName, dates[0], dates[1],sort,order);
	}
	
	/**
	 * 查询考勤统计 
	 */
	@Override
	public Pager4EasyUI<EmpCheckingStatistics> queryPagerStatistics(Pager4EasyUI<EmpCheckingStatistics> pager, String depid,
			String empid, String empName, String beginDate, String endDate, String sort, String order) {
		Date begin = null;
		Date end = null;
		if(beginDate!=null&&!beginDate.equals("")){	begin = WebUtil.str2Date(beginDate, "yyyy-MM-dd");	}
		if(endDate!=null&&!endDate.equals("")){	end = WebUtil.str2Date(endDate, "yyyy-MM-dd");	}
		else {end = new Date();}
		if(empName!=null) {empName = WebUtil.vague(empName);}
		List norms = gainCheckingInfo();
		return empCheckingDAO.queryCheck4Base(pager, depid, norms, empid, empName, begin, end, "-", sort, order);
	}
	/**
	 * 以月查询考勤统计
	 */
	@Override
	public Pager4EasyUI<EmpCheckingStatistics> queryPagerStatistics4Moth(Pager4EasyUI<EmpCheckingStatistics> pager,
			String depid, String empid, String empName, int month, String sort, String order) {
		Calendar calendar=Calendar.getInstance();
		Date[] dates = null;
		if(month!=0){			dates =TempDate.inMoth2Date(month);		}
		else {			int mon =calendar.get(Calendar.MONTH)+1;dates =TempDate.inMoth2Date(mon);		}
		if(empName!=null) {empName = WebUtil.vague(empName);}
		List norms = gainCheckingInfo();
		return empCheckingDAO.queryCheck4Base(pager, depid, norms, empid, empName, dates[0], dates[1], "-", sort, order);
	}

	
	
	
	
	@JSON(serialize=false)
	public EmpCheckingDAO getEmpCheckingDAO() {
		return empCheckingDAO;
	}

	public void setEmpCheckingDAO(EmpCheckingDAO empCheckingDAO) {
		this.empCheckingDAO = empCheckingDAO;
	}
	
	private Date str2Date(String year ,String month, String day) {//设置查询的时间
		Date date = new Date();
		
		GregorianCalendar gc = new GregorianCalendar();
		gc.set(Calendar.YEAR,str2Int(year));//设置年
		gc.set(Calendar.MONTH, str2Int(month));//这里0是1月..以此向后推
		gc.set(Calendar.DAY_OF_MONTH, str2Int(day));//设置天
		date = gc.getTime();
		
		return date;
	}
	


	private List<EmpCheckingInfo> gainCheckingInfo(){
		Pager4EasyUI<EmpCheckingInfo> checkingInfoPager = new Pager4EasyUI<EmpCheckingInfo>();
		checkingInfoPager.setPageNo(1);checkingInfoPager.setPageSize(20);
		checkingInfoPager= checkingService.queryPager("EmpCheckingInfo", checkingInfoPager);
		List<EmpCheckingInfo> checkingInfos =  checkingInfoPager.getRows();
		return checkingInfos;
	}
	
	

	
	@JSON(serialize=false)
	public CheckingService getCheckingService() {
		return checkingService;
	}

	public void setCheckingService(CheckingService checkingService) {
		this.checkingService = checkingService;
	}
	
	private int str2Int(String str) { //字符串转整型
		try{
			int i = Integer.parseInt(str);
			return i;
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 条件考勤详情统计
	 */
	@Override
	public int countPagerInfo(String depid,String empid ,String empName, String beginDate,String endDate) {
		Date begin = null;
		Date end = null;
		if(beginDate!=null&&!beginDate.equals("")){	begin = WebUtil.str2Date(beginDate, "yyyy-MM-dd");	}
		if(endDate!=null&&!endDate.equals("")){	end = WebUtil.str2Date(endDate, "yyyy-MM-dd");}
		else {end = new Date();}
		return empCheckingDAO.countInfo(depid, empid, empName, begin,end);
	}

	/**
	 * 以月条件考勤统计
	 */
	@Override
	public int countPagerInfo4Moth(String depid,String empid ,String empName, int month) {
		Calendar calendar=Calendar.getInstance();
		Date[] dates = null;
		if(month!=0){	dates =TempDate.inMoth2Date(month);	}
		else {			int mon =calendar.get(Calendar.MONTH)+1;dates =TempDate.inMoth2Date(mon);		}
		return empCheckingDAO.countInfo(depid, empid, empName, dates[0], dates[1]);
	}

	@Override
	public List<EmpCheckingVOInfo> queryByIds(String idsStr) {
		String[] ids = WebUtil.idsStr2Strs(idsStr, ",");
		return empCheckingDAO.queryByIds(ids);
	}

}
