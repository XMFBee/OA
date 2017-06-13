package com.oa.service.info;

import java.util.Map;

import com.oa.bean.Department;
import com.oa.bean.Role;
import com.oa.bean.info.DepEmp;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.info.DepEmpDAOInfo;

public class DepEmpServiceInfoImpl implements DepEmpServiceInfo{
	private DepEmpDAOInfo depEmpDAOVO;

	@Override
	public Pager4EasyUI<DepEmp> queryPager(Pager4EasyUI<DepEmp> pager) {
		return depEmpDAOVO.query(pager);
	}
	
	@Override
	public Map<String, String> empSelect(Department dep) {
		return depEmpDAOVO.empSelect(dep);
	}
	
	@Override
	public Role queryRole(String rolename) {
		return depEmpDAOVO.queryRole(rolename);
	}
	
	public DepEmpDAOInfo getDepEmpDAOVO() {
		return depEmpDAOVO;
	}
	public void setDepEmpDAOVO(DepEmpDAOInfo depEmpDAOVO) {
		this.depEmpDAOVO = depEmpDAOVO;
	}

	
}
