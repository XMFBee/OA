package com.oa.dao;

import com.oa.bean.EmpFeedback;
import com.oa.common.bean.Pager4EasyUI;

public interface EmpfeedbackDAO extends BaseDAO<EmpFeedback> {
	public Pager4EasyUI<EmpFeedback> querySelfEmpfeedback(String empId, Pager4EasyUI<EmpFeedback> pager);
}
