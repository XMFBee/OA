package com.oa.dao;

import java.io.Serializable;

import com.oa.bean.StudentChecking;
import com.oa.common.bean.Pager4EasyUI;

public interface StudentCheckingDAO extends BaseDAO<StudentChecking>{
	
	public Pager4EasyUI<StudentChecking> queryPagerByGradeId(Pager4EasyUI<StudentChecking> pager, Serializable gradeId);
}
