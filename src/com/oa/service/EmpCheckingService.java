package com.oa.service;

import java.util.Date;
import java.util.List;

import com.oa.bean.EmpChecking;
import com.oa.bean.EmpCheckingInfo;
import com.oa.bean.info.EmpCheckingStatistics;
import com.oa.bean.info.EmpCheckingVOInfo;
import com.oa.common.bean.Pager4EasyUI;

/**
 * 员工考勤表
 * @author 程燕
 *
 */
public interface EmpCheckingService extends BaseService<EmpChecking>{
	/**
	 * 条件查员工考勤详情
	 * @param pager
	 * @param empid	员工id
	 * @param empName 员工姓名
	 * @param beginDate 查询开始日期
	 * @param endDate 查询结束日期
	 * @param sort 排序字段
	 * @param order	排序(desc,asc)
	 * @return
	 */
	public Pager4EasyUI<EmpCheckingVOInfo> queryPagerInfo(Pager4EasyUI<EmpCheckingVOInfo> pager,String depid,String empid ,String empName,String beginDate, String endDate,String sort , String order);
	
	/**
	 * 查月员工考勤详情
	 * @param pager
	 * @param empid 员工id
	 * @param empName 员工姓名
	 * @param month 月份
	 * @param sort 排序字段
	 * @param order 排序(desc,asc)
	 * @return
	 */
	public Pager4EasyUI<EmpCheckingVOInfo> queryPagerInfo4Moth(Pager4EasyUI<EmpCheckingVOInfo> pager,String depid,String empid ,String empName,int month,String sort , String order);
	
	
	/**
	 * 条件查员工考勤统计
	 * @param pager
	 * @param empid	员工id
	 * @param empName 员工姓名
	 * @param beginDate 查询开始日期
	 * @param endDate 查询结束日期
	 * @param sort 排序字段
	 * @param order	排序(desc,asc)
	 * @return
	 */
	public Pager4EasyUI<EmpCheckingStatistics> queryPagerStatistics(Pager4EasyUI<EmpCheckingStatistics> pager, String depid,
			String empid, String empName, String beginDate, String endDate, String sort, String order) ;
	
	/**
	 * 查月员工考勤统计
	 * @param pager
	 * @param empid 员工id
	 * @param empName 员工姓名
	 * @param month 月份
	 * @param sort 排序字段
	 * @param order 排序(desc,asc)
	 * @return
	 */
	public Pager4EasyUI<EmpCheckingStatistics> queryPagerStatistics4Moth(Pager4EasyUI<EmpCheckingStatistics> pager,String depid,String empid ,String empName,int month,String sort , String order);
	
	
	
	/**
	 * 与统计共用
	 * @param depid
	 * @param empid
	 * @param empName
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	public int countPagerInfo(String depid,String empid ,String empName, String beginDate,String endDate);
	/**
	 * 与统计共用
	 * @param depid
	 * @param empid
	 * @param empName
	 * @param month
	 * @return
	 */
	public int countPagerInfo4Moth(String depid,String empid ,String empName, int month);
	
	/**
	 * 导出excel用
	 * @param idsStr 员工id们
	 * @return
	 */
	public List<EmpCheckingVOInfo> queryByIds(String idsStr) ;

	
	
	
}
