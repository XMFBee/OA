package com.oa.bean.info;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

public class EmpBaseInfo {
	private String empId;//员工id
	private String name;//员工姓名
	private String depId;//所在部门id
	private String depName;//所在部门名称
	private String roleId;//所在部门id
	private String roleName;//所在部门名称
	private String nation;//员工籍贯
	private String gender;//员工性别
	private Date birthday;//员工生日
	private String email;//员工email
	private Date hireDay;//员工入职时间
	private Date resignDay;//员工离职时间
	private Integer status;//员工状态
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
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
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getHireDay() {
		return hireDay;
	}
	public void setHireDay(Date hireDay) {
		this.hireDay = hireDay;
	}
	public Date getResignDay() {
		return resignDay;
	}
	public void setResignDay(Date resignDay) {
		this.resignDay = resignDay;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	@Override
	public String toString() {
		return "BaseEmpInfo [empId=" + empId + ", name=" + name + ", depId=" + depId + ", depName=" + depName
				+ ", nation=" + nation + ", gender=" + gender + ", birthday=" + birthday + ", email=" + email
				+ ", hireDay=" + hireDay + ", resignDay=" + resignDay + ", status=" + status + "]";
	}
	
	
	
}
