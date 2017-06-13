package com.oa.bean;

public class Roleaut {
	private int autRolId;
	
	private Role role;  // 角色
	private Authority aut;	// 权限
	
	
	
	public int getAutRolId() {
		return autRolId;
	}
	public void setAutRolId(int autRolId) {
		this.autRolId = autRolId;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public Authority getAut() {
		return aut;
	}
	public void setAut(Authority aut) {
		this.aut = aut;
	}
	
	
	
}
