package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Student;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.StudentDAO;

public class StudentServiceImpl implements StudentService{

	private StudentDAO studentDAO;
	
	
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}

	@Override
	public Student save(Student t) {
		return studentDAO.save(t);
	}

	@Override
	public void delete(Student t) {
		studentDAO.delete(t);
	}

	@Override
	public void update(Student t) {
		studentDAO.update(t);
	}

	@Override
	public Student queryById(Class<?> clazz, Serializable id) {
		return studentDAO.queryById(clazz, id);
	}

	@Override
	public List<Student> queryAll(Serializable beanName) {
		return studentDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<Student> queryPager(String beanName, Pager4EasyUI<Student> pager) {
		return studentDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return studentDAO.count(beanName);
	}

	@Override
	public Pager4EasyUI<Student> studentStatusPager(String stuStatus, Pager4EasyUI<Student> pager) {
		return studentDAO.studentStatusPager(stuStatus, pager);
	}

	@Override
	public long countStatus(String stuStatus) {
		return studentDAO.countStatus(stuStatus);
	}

	@Override
	public void updateStatus(String beanName,String beanId,int status, String id) {
		studentDAO.updateStatus(beanName,beanId,status, id);
	}

	@Override
	public Pager4EasyUI<Student> stuGradeById(String gradeId, Pager4EasyUI<Student> pager) {
		return studentDAO.stuGradeById(gradeId, pager);
	}

	@Override
	public long countGradeID(String gradeId) {
		return studentDAO.countGradeID(gradeId);
	}

	@Override
	public Pager4EasyUI<Student> stuRoomById(String roomId, Pager4EasyUI<Student> pager) {
		return studentDAO.stuRoomById(roomId, pager);
	}

	@Override
	public long countRoomID(String roomId) {
		return studentDAO.countRoomID(roomId);
	}

	@Override
	public Pager4EasyUI<Student> stuGradeRoomById(String roomGradeId, Pager4EasyUI<Student> pager) {
		return studentDAO.stuGradeRoomById(roomGradeId, pager);
	}

	@Override
	public long stuGradeRoomById(String roomGradeId) {
		return studentDAO.stuGradeRoomById(roomGradeId);
	}

	@Override
	public void updateGradeIds(String[] ids, String gradeRoomId, String roomGradeId) {
		studentDAO.updateGradeIds(ids, gradeRoomId, roomGradeId);
	}

	@Override
	public Pager4EasyUI<Student> queryBySearch(Pager4EasyUI<Student> pager, String stuName,String stuStatus) {
		return studentDAO.queryBySearch(pager, stuName,stuStatus);
	}

	@Override
	public Pager4EasyUI<Student> queryByEmpId(Pager4EasyUI<Student> pager, String stuStatus, String empId) {
		return studentDAO.queryByEmpId(pager, stuStatus, empId);
	}

	@Override
	public long countEmpID(String empId) {
		return studentDAO.countEmpID(empId);
	}


}
