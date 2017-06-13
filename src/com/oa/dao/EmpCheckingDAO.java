package com.oa.dao;

import java.util.Date;
import java.util.List;

import com.oa.bean.Department;
import com.oa.bean.EmpChecking;
import com.oa.bean.EmpCheckingInfo;
import com.oa.bean.info.EmpCheckingStatistics;
import com.oa.bean.info.EmpCheckingVOInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface EmpCheckingDAO extends BaseDAO<EmpChecking>{
	/**
	 * 分页考勤信息
	 * @param pager
	 * @param empid
	 * @param empName
	 * @param beginDate
	 * @param endDate
	 * @param sort
	 * @param order
	 * @return
	 */
	public Pager4EasyUI<EmpCheckingVOInfo> queryPagerInfo(Pager4EasyUI<EmpCheckingVOInfo> pager,String depid,String empid ,String empName,Date beginDate, Date endDate,String sort , String order);
	
	

	/**
	 * 分页考勤统计
	 * @param pager
	 * @param norms 标准时间集,也就是info List
	 * @param empid
	 * @param empName
	 * @param begin
	 * @param end
	 * @param format 标准时间的分隔符
	 * @param sort 需要排序的字段
	 * @param order 排序方式
	 * @return
	 */
	public Pager4EasyUI<EmpCheckingStatistics> queryCheck4Base(Pager4EasyUI<EmpCheckingStatistics> pager,String depid,List<EmpCheckingInfo> norms,String empid,String empName,Date begin,Date end,String format,String sort,String order);
	
	
	/**
	 * 在导出excel时,需要查出传入的id得到结果结,
	 * 就是导出excel用
	 * 批量导出
	 * @param ids 多个员工id 
	 * @return
	 */
	public List<EmpCheckingVOInfo> queryByIds(String[] ids);
	
	
	/**
	 * 条件计数详情总数 总结总数也在这里
	 * @param empid	员工id
	 * @param empName	员工模糊姓名
	 * @param beginDate 开始日期
	 * @param endDate 结束日期
	 * @param sort 排序列
	 * @param order 排序(desc,asc)
	 * @return
	 */
	public int countInfo(String depid,String empid ,String empName,Date beginDate, Date endDate);
	
	
	
}
