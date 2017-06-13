package com.oa.dao;

import com.oa.bean.Course;
import com.oa.common.bean.Pager4EasyUI;

public interface CourseDAO extends BaseDAO<Course>{
	public Pager4EasyUI<Course> queryBySearch(Pager4EasyUI<Course> pager,String courseName);
}
