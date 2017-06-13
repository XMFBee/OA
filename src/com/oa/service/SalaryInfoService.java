package com.oa.service;

import javax.servlet.http.HttpServletRequest;

import com.oa.bean.Employee;
import com.oa.bean.SalaryInfo;
import com.oa.common.bean.Pager4EasyUI;
/**
 * 
 * @author 赖泰君
 *
 */
public interface SalaryInfoService extends BaseService<SalaryInfo> {
	public Pager4EasyUI<SalaryInfo> queryBySearch(Pager4EasyUI<SalaryInfo> pager, String name);
	public Pager4EasyUI<SalaryInfo> queryByPhone(Pager4EasyUI<SalaryInfo> pager, String phone);
	public Pager4EasyUI<SalaryInfo> querySelfSalaryInfo(String empId, Pager4EasyUI<SalaryInfo> pager);
}
