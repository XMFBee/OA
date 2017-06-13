package com.oa.service;

import com.oa.bean.Notice;
import com.oa.common.bean.Pager4EasyUI;

public interface NoticeService extends BaseService<Notice> {
	public Pager4EasyUI<Notice> queryBySearch(Pager4EasyUI<Notice> pager,String noticeName);
}
