package com.oa.service;

import java.io.Serializable;

import com.oa.bean.StudentChecking;
import com.oa.common.bean.Pager4EasyUI;

public interface StudentCheckingService extends BaseService<StudentChecking>{
	public Pager4EasyUI<StudentChecking> queryPagerByGradeId(Pager4EasyUI<StudentChecking> pager, Serializable gradeId);
}
