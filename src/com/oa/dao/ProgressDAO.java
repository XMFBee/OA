package com.oa.dao;

import com.oa.bean.Progress;
import com.oa.common.bean.Pager4EasyUI;

public interface ProgressDAO extends BaseDAO<Progress>{
	public Pager4EasyUI<Progress> queryBySearch(Pager4EasyUI<Progress> pager,String empName);
}
