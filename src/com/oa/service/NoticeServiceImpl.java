package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Notice;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.NoticeDAO;

public class NoticeServiceImpl implements NoticeService {

	private NoticeDAO noticeDAO;
	

	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	@Override
	public Notice save(Notice t) {
		return noticeDAO.save(t);
	}

	@Override
	public void delete(Notice t) {
		noticeDAO.delete(t);
	}

	@Override
	public void update(Notice t) {
		noticeDAO.update(t);
	}

	@Override
	public Notice queryById(Class<?> clazz, Serializable id) {
		return noticeDAO.queryById(clazz, id);
	}

	@Override
	public List<Notice> queryAll(Serializable beanName) {
		return noticeDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<Notice> queryPager(String beanName, Pager4EasyUI<Notice> pager) {
		return noticeDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return noticeDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		noticeDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Notice> queryBySearch(Pager4EasyUI<Notice> pager, String noticeName) {
		return noticeDAO.queryBySearch(pager, noticeName);
	}

}
