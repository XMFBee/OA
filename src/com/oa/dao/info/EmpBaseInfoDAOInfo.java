package com.oa.dao.info;

import com.oa.bean.info.EmpBaseInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface EmpBaseInfoDAOInfo {
	public Pager4EasyUI<EmpBaseInfo> query(Pager4EasyUI<EmpBaseInfo> pager,int statu);
	
}
