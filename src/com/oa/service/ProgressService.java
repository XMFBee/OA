package com.oa.service;

import com.oa.bean.Progress;
import com.oa.common.bean.Pager4EasyUI;

public interface ProgressService extends BaseService<Progress>{
	public Pager4EasyUI<Progress> queryBySearch(Pager4EasyUI<Progress> pager,String empName);
}	
