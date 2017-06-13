package com.oa.bean.info;

import java.util.Date;

/**
 * 以部门号查询所有员工的基本信息做对比,选出经理
 * @author Administrator
 *
 */
public class DepEmps {
	private String depId;	//部门id
	private String depName;	//部门名称
	private String empId;	//员工id
	private String empName;	//员工姓名
	private String empEduBack; //员工学历
	private String empCollege;	// 员工毕业学校
	private Date empHireDay;	//员工入职时间
	public String getDepId() {
		return depId;
	}
	public void setDepId(String depId) {
		this.depId = depId;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpEduBack() {
		return empEduBack;
	}
	public void setEmpEduback(String empEduBack) {
		this.empEduBack = empEduBack;
	}
	public String getEmpCollege() {
		return empCollege;
	}
	public void setEmpCollege(String empCollege) {
		this.empCollege = empCollege;
	}
	public Date getEmpHireDay() {
		return empHireDay;
	}
	public void setEmpHireDay(Date empHireDay) {
		this.empHireDay = empHireDay;
	}
	@Override
	public String toString() {
		return "DepEmps [depId=" + depId + ", depName=" + depName + ", empId=" + empId + ", empName=" + empName
				+  ", empEduBack=" + empEduBack + ", empCollege=" + empCollege
				+ ", empHireDay=" + empHireDay + "]";
	}
	
	
	
}
