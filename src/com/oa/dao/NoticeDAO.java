package com.oa.dao;

import com.oa.bean.Notice;
import com.oa.common.bean.Pager4EasyUI;

public interface NoticeDAO extends BaseDAO<Notice>{
	public Pager4EasyUI<Notice> queryBySearch(Pager4EasyUI<Notice> pager,String noticeName);
}
