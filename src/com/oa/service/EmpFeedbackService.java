package com.oa.service;

import com.oa.bean.EmpFeedback;
import com.oa.common.bean.Pager4EasyUI;

public interface EmpFeedbackService extends BaseService<EmpFeedback>{

	Pager4EasyUI<EmpFeedback> queryById(String empId, Pager4EasyUI<EmpFeedback> pager);

}
