package com.oa.dao.info;

import com.oa.bean.info.PayInfo;
import com.oa.common.bean.Pager4EasyUI;

//郭玉清
public interface PayInfoDAO extends BaseDAO<PayInfo> {

	/**
	 * 支出管理分页查看
	 * @param status
	 * @param pager
	 * @return
	 */
	public Pager4EasyUI<PayInfo> queryPayInfoPage(int status, Pager4EasyUI<PayInfo> pager);
	

}
