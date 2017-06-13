package com.oa.dao;



import com.oa.bean.Student;
import com.oa.common.bean.Pager4EasyUI;

public interface StudentDAO extends BaseDAO<Student>{
	
	public Pager4EasyUI<Student> studentStatusPager(String stuStatus,Pager4EasyUI<Student> pager);
	public long countStatus(String  stuStatus);
	public Pager4EasyUI<Student> stuGradeById(String gradeId,Pager4EasyUI<Student> pager);
	public long countGradeID(String  gradeId);
	public Pager4EasyUI<Student> stuRoomById(String roomId,Pager4EasyUI<Student> pager);
	public long countRoomID(String roomId);
	// 没有班级和宿舍的学生
	public Pager4EasyUI<Student> stuGradeRoomById(String roomGradeId,Pager4EasyUI<Student> pager);
	public long stuGradeRoomById(String roomGradeId);
	
	public void updateGradeIds(String ids[],String gradeRoomId,String roomGradeId);
	
	public Pager4EasyUI<Student> queryBySearch(Pager4EasyUI<Student> pager,String stuName,String stuStatus);
	
	/**
	 * 根据招生老师ID查询，意向，预定，正式学生
	 * 
	 */
	public Pager4EasyUI<Student> queryByEmpId(Pager4EasyUI<Student> pager,String stuStatus, String empId );
	public long countEmpID(String empId);
}
