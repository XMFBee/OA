package com.oa.service;

import com.oa.bean.Course;
import com.oa.common.bean.Pager4EasyUI;

public interface CourseService extends BaseService<Course>{
	public Pager4EasyUI<Course> queryBySearch(Pager4EasyUI<Course> pager,String courseName);
}
