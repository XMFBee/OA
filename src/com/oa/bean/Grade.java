package com.oa.bean;

import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

/**
 * 班级表
 * @author 程燕
 *
 */
public class Grade {
	private String gradeId; 
	private String name;
	private String empIds1;		//班主任id(员工表)
	private String empIds2;		//主教老师id(员工表)
	private String empIds3;		//副教老师id(员工表)
	
	private Employee empId1;
	private Employee empId2;
	private Employee empId3;
	private String des;
	private int quantity;	//班级最大人数
	private int status;		//班级目前状态(良好1 | 冻结0)
	private int fact;		// 实际人数
	private Set<Progress> progress;
	 
	private Set<Student> stus;
	
	@JSON(serialize=false)
	public Set<Progress> getProgress() {
		return progress;
	}
	public void setProgress(Set<Progress> progress) {
		this.progress = progress;
	}
	public String getEmpIds1() {
		return empIds1;
	}
	public void setEmpIds1(String empIds1) {
		this.empIds1 = empIds1;
	}
	public String getEmpIds2() {
		return empIds2;
	}
	public void setEmpIds2(String empIds2) {
		this.empIds2 = empIds2;
	}
	public String getEmpIds3() {
		return empIds3;
	}
	public void setEmpIds3(String empIds3) {
		this.empIds3 = empIds3;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public Employee getEmpId1() {
		return empId1;
	}
	public void setEmpId1(Employee empId1) {
		this.empId1 = empId1;
	}
	public Employee getEmpId2() {
		return empId2;
	}
	
	public void setEmpId2(Employee empId2) {
		this.empId2 = empId2;
	}
	public Employee getEmpId3() {
		return empId3;
	}
	public void setEmpId3(Employee empId3) {
		this.empId3 = empId3;
	}
	
	@JSON(serialize=false)
	public Set<Student> getStus() {
		return stus;
	}
	public void setStus(Set<Student> stus) {
		this.stus = stus;
	}
	
	
	public int getFact() {
		return fact;
	}
	public void setFact(int fact) {
		this.fact = fact;
	}
	@Override
	public String toString() {
		return "Grade [gradeId=" + gradeId + ", name=" + name + ", empIds1=" + empIds1 + ", empIds2=" + empIds2
				+ ", empIds3=" + empIds3 + ", empId1=" + empId1 + ", empId2=" + empId2 + ", empId3=" + empId3 + ", des="
				+ des + ", quantity=" + quantity + ", status=" + status + "]";
	}
	
	
	
	
}
