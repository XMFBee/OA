package com.oa.dao;

import java.io.Serializable;

import com.oa.bean.StudentLeave;
import com.oa.common.bean.Pager4EasyUI;

public interface StudentLeaveDAO extends BaseDAO<StudentLeave>{
	public Pager4EasyUI<StudentLeave> queryPagerByGradeId(Pager4EasyUI<StudentLeave> pager, Serializable gradeId);
	
}
