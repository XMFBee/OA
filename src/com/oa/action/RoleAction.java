package com.oa.action;

import java.util.List;


import com.oa.bean.Role;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.RoleService;

/*角色表  郭玉清*/
public class RoleAction extends BaseAction{

	private static final long serialVersionUID = -5879644660675740506L;

	private ControllerRequest resu; // 返回提示信息到easyUI页面
	private RoleService roleService;

	private Role role;
	private long total;// 返回total总记录数到easyUI页面
	private List<Role> rows;
	private String id;

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public ControllerRequest getResu() {
		return resu;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public long getTotal() {
		return total;
	}

	public List<Role> getRows() {
		return rows;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String showRole() {
		return "showRole";
	}

	public String rolePager() { // 分页显示角色
		Pager4EasyUI<Role> pager = new Pager4EasyUI<Role>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(roleService.count("Role"));
		pager = roleService.queryPager("Role", pager);
		total = pager.getTotal();
		rows = pager.getRows();
		return "role-pager";
	}

	public String addRole() {
		role.setStatus(1);
		roleService.save(role);
		resu = ControllerRequest.getSuccessRequest("添加成功");
		return "role-add";
	}

	public String updateRole() {
		roleService.update(role);
		resu = ControllerRequest.getSuccessRequest("修改成功");
		return "role-update";
	}

	public String roleActivate() {
		roleService.updateStatus("Role", "roleId", 1, id);
		return "activate";
	}

	public String roleDisable() {
		roleService.updateStatus("Role", "roleId", 0, id);
		return "disable";
	}

}
