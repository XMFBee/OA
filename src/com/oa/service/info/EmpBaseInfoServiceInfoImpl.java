package com.oa.service.info;

import org.apache.struts2.json.annotations.JSON;

import com.oa.bean.info.EmpBaseInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.info.EmpBaseInfoDAOInfo;

public class EmpBaseInfoServiceInfoImpl implements EmpBaseInfoServiceInfo{
	private EmpBaseInfoDAOInfo empBaseInfoDAOInfo;
	@Override
	public Pager4EasyUI<EmpBaseInfo> query(Pager4EasyUI<EmpBaseInfo> pager, int statu) {
		return empBaseInfoDAOInfo.query(pager, statu);
	}
	@JSON(serialize=false)
	public EmpBaseInfoDAOInfo getBaseEmpInfoDAOVO() {
		return empBaseInfoDAOInfo;
	}
	public void setBaseEmpInfoDAOVO(EmpBaseInfoDAOInfo empBaseInfoDAOInfo) {
		this.empBaseInfoDAOInfo = empBaseInfoDAOInfo;
	}
	
}
