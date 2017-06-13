package com.oa.dao;

import java.io.Serializable;

import com.oa.bean.StudentFeedback;
import com.oa.common.bean.Pager4EasyUI;

public interface StudentFeedbackDAO extends BaseDAO<StudentFeedback>{
	public Pager4EasyUI<StudentFeedback> queryPagerByGradeId(Pager4EasyUI<StudentFeedback> pager, Serializable gradeId);

}
