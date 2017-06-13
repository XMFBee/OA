package com.oa.dao.info;

import com.oa.bean.info.EmpfeedbackInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface EmpfeedbackDAOInfo extends BaseDAO<EmpfeedbackInfo>{
	public Pager4EasyUI<EmpfeedbackInfo> queryBySearch(Pager4EasyUI<EmpfeedbackInfo> pager,String empName);
}
