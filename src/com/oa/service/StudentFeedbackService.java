package com.oa.service;

import java.io.Serializable;

import com.oa.bean.StudentChecking;
import com.oa.bean.StudentFeedback;
import com.oa.common.bean.Pager4EasyUI;

public interface StudentFeedbackService extends BaseService<StudentFeedback>{
	public Pager4EasyUI<StudentFeedback> queryPagerByGradeId(Pager4EasyUI<StudentFeedback> pager, Serializable gradeId);
}
