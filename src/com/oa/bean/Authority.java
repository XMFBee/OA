package com.oa.bean;

import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

/***
 * 
 * @author xiao-kang
 *	权限表
 */
public class Authority {
	private int autId; // 权限ID
	private String className;	// 权限定名
	private String des;		// 描述
	
	private Set<Roleaut> roleauts; 	// 一个权限对应多个角色
	
	
	public int getAutId() {
		return autId;
	}
	public void setAutId(int autId) {
		this.autId = autId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	@JSON(serialize = false)
	public Set<Roleaut> getRoleauts() {
		return roleauts;
	}
	public void setRoleauts(Set<Roleaut> roleauts) {
		this.roleauts = roleauts;
	}
	@Override
	public String toString() {
		return "Authority [autId=" + autId + ", className=" + className + ", des=" + des + "]";
	}
	
	
}
