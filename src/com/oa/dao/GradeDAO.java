package com.oa.dao;

import com.oa.bean.Grade;
import com.oa.common.bean.Pager4EasyUI;

public interface GradeDAO extends BaseDAO<Grade>{
	
	public Pager4EasyUI<Grade> queryBySearch(Pager4EasyUI<Grade> pager,String stuName);
	
	/**某个班级下面有多少个学生
	 * 
	 * 
	 * @param gradeId
	 * @return
	 */
	public int queryByGradeId(String gradeId);
}
