package com.oa.bean.info;

public class DepEmp {
	private String depId;
	private String empId;
	private String depName;
	private String empName;
	private String des;
	private Integer status;
	public String getDepId() {
		return depId;
	}
	public void setDepId(String depId) {
		this.depId = depId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "DepEmp [depId=" + depId + ", empId=" + empId + ", depName=" + depName + ", empName=" + empName
				+ ", des=" + des + ", status=" + status + "]";
	}
	
}
