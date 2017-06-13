package com.oa.service;

import java.io.Serializable;

import com.oa.bean.Job;
import com.oa.common.bean.Pager4EasyUI;

public interface JobService extends BaseService<Job> {
	public Pager4EasyUI<Job> queryPagerByGradeId(Pager4EasyUI<Job> pager, Serializable gradeId);
}

