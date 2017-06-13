package com.oa.bean;

import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

public class Role {

	//杨健勇
	//角色
	private String roleId;//角色编号
	private String name;//名称
	private String des;//描述
	private int status;//状态，默认为可用
	
	private Set<Authority> roleauts;// 一个角色对应多个权限
	
	
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@JSON(serialize = false)
	public Set<Authority> getRoleauts() {
		return roleauts;
	}
	public void setRoleauts(Set<Authority> roleauts) {
		this.roleauts = roleauts;
	}
	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", name=" + name + ", des=" + des + ", status=" + status + "]";
	}
	
}
